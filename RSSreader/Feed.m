//
//  Feed.m
//  RSSreader
//
//  Created by Ayodeji Osokoya on 5/23/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "Feed.h"
#import "NSString+HTML.h"
#import "GTMNSString+HTML.h"
#import "FeedItem.h"

@interface Feed()
@property (nonatomic, strong) NSMutableDictionary *temporaryItem;
@property (nonatomic, strong) NSMutableString *temporaryPostTitle;
@property (nonatomic, strong) NSMutableString *temporaryLink;
@property (nonatomic, strong) NSMutableString *temporaryDescription;
@property (nonatomic, strong) NSMutableString *temporaryDateString;
@property (nonatomic, strong) NSDate *temporaryDateObject;
@property (nonatomic, strong) NSMutableString *temporaryEnclosure;
@property (nonatomic, strong) NSMutableString *temporaryGuid;
@property (nonatomic, strong) NSString *parentElement;

@property (nonatomic, strong) NSXMLParser *parser;//parser is the object that will download and parse the RSS XML files
@property (nonatomic, strong) NSString *element;
@end

@implementation Feed
@synthesize isFollowed = _isFollowed;

#pragma mark - Accessors
- (NSMutableString *) title{
    if(!_title) _title = [[NSMutableString alloc] init];
    return _title;
}

- (NSMutableString *) temporaryDateString{
    if(!_temporaryDateString) _temporaryDateString = [[NSMutableString alloc] init];
    return _temporaryDateString;
}

- (void) setIsFollowed:(BOOL)isFollowed{
    if (isFollowed) {
       //If the feed is followed, enable the parser and parse it
        //todo, parse in a separate thread
        _isFollowed = YES;
        [self.parser setDelegate:self];
        [self.parser setShouldResolveExternalEntities:NO];
    } else {
        _isFollowed = NO;
        self.parser = nil;
    }
}

- (Feed *) initWithURL:(NSString *)feedURL isFollowed:(BOOL)isFollowed{
    self = [self initWithURL:feedURL withTitle:nil isFollowed:isFollowed];
    
    if (isFollowed) [self.parser parse];
    return self;
}
- (Feed *)initWithURL:(NSString *)feedURL withTitle:(NSString *)title categoryTitle:(NSString *)categoryTitle isFollowed:(BOOL)isFollowed{
    if(self = [super init]) {
        self.link = [feedURL copy];
        self.title = [title mutableCopy];//this ought to replace the assigned title from the feed with the new title
        self.categoryTitle = [categoryTitle mutableCopy];
        self.isFollowed = isFollowed; //this is set lasts as it call parse
    }
    
    if (isFollowed) [self.parser parse];
    return self;
    
}

- (Feed *) initWithURL:(NSString *)feedURL withTitle:(NSString *)title isFollowed:(BOOL)isFollowed{//designated initializer
    if(self = [super init]) {
        self.link = [feedURL copy];
        self.title = [title mutableCopy];//this ought to replace the assigned title from the feed with the new title
        self.isFollowed = isFollowed;
    }
    
    if (isFollowed) [self.parser parse];
    return self;
}

- (void) refresh {
    self.items = nil;
    [self.parser parse];
    //we could use NSNotification Center to update the view once this is done
}

- (NSMutableArray *) items{
    if(!_items) _items = [[NSMutableArray alloc] init];
    return _items;
}

#pragma mark - NSXMLParserDelegate implemenatation
- (NSXMLParser *) parser{
    if(!_parser) _parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:self.link]];
    return _parser;
}

- (void) parserDidStartDocument:(NSXMLParser *)parser{
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    self.element = elementName;
    
    if ([self.element isEqualToString:@"channel"]) {
        self.parentElement = @"channel";
    }
    else if ([self.element isEqualToString:@"item"]) {
        self.parentElement = @"item";
        //move all of this to lazy inistatiation
        self.temporaryItem  = [[NSMutableDictionary alloc] init];
        self.temporaryPostTitle   = [[NSMutableString alloc] init];
        self.temporaryLink    = [[NSMutableString alloc] init];
        self.temporaryDescription = [[NSMutableString alloc] init];
        self.temporaryDateString = [[NSMutableString alloc] init];
        self.temporaryGuid = [[NSMutableString alloc] init];
        self.temporaryEnclosure = [[NSMutableString alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock{
    NSString *CDATAString = [[NSString alloc]initWithData:CDATABlock encoding:NSUTF8StringEncoding];
    NSString *string = [CDATAString stringByDecodingHTMLEntities];
    //(id)initWithData:(NSData *)data encoding:(NSStringEncoding)encoding
    //I need to decode these entities http://stackoverflow.com/questions/1105169/html-character-decoding-in-objective-c-cocoa-touch
    if([self.parentElement isEqualToString:@"item"]){
        if ([self.element isEqualToString:@"title"]) {
            [self.temporaryPostTitle appendString:string];
        } else if ([self.element isEqualToString:@"description"]) {
            [self.temporaryDescription appendString:string];
        }
    }

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {//presents all of the chars of the current element
    if([self.parentElement isEqualToString:@"item"]){
        string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
        if ([self.element isEqualToString:@"title"]) {
            //[self.temporaryPostTitle appendString:string];
        } else if ([self.element isEqualToString:@"link"]) {
            string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
            [self.temporaryLink appendString:string];//fixes accidental spaces in the feed URL
        } else if ([self.element isEqualToString:@"guid"]) {
            [self.temporaryGuid appendString:string];
        } else if ([self.element isEqualToString:@"description"]) {
            //[self.temporaryDescription appendString:string];
        } else if ([self.element isEqualToString:@"dc:date"]) {
            [self.temporaryDateString appendString:string];
            //process the string
            //2013-07-10T17:04:44+09:00
            //init with the publication date
            NSMutableString *dateString = self.temporaryDateString;
            [dateString replaceOccurrencesOfString:@"-" withString:@"|" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [dateString length])];
            [dateString replaceOccurrencesOfString:@"+" withString:@"|" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [dateString length])];
            [dateString replaceOccurrencesOfString:@":" withString:@"|" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [dateString length])];
            [dateString replaceOccurrencesOfString:@"T" withString:@"|" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [dateString length])];
            
            NSArray *timeBits = [[dateString componentsSeparatedByString:@"|"] mutableCopy];
            NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
            
            //2013-07-10T17:04:44+09:00
            //TODO re implement this using NSDateFormatter
            //http://stackoverflow.com/questions/11165284/nsdateformatter-ios-date-pattern
            [dateComponents setYear:[timeBits[0] intValue]];
            [dateComponents setMonth:[timeBits[1] intValue]];
            [dateComponents setDay:[timeBits[2] intValue]];
            [dateComponents setHour:[timeBits[3] intValue]];
            [dateComponents setMinute:[timeBits[4] intValue]];
            [dateComponents setSecond:[timeBits[5] intValue]];
            
            NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            self.temporaryDateObject = [gregorian dateFromComponents:dateComponents];
            //
        } else if ([self.element isEqualToString:@"enclosure"]) {
            [self.temporaryEnclosure appendString:string];
        }
    } else if ([self.parentElement isEqualToString:@"channel"]){
        if ([self.element isEqualToString:@"title"]) {
            if (![self.title length]) {
                [self.title appendString:string];//prevent overwriting of the feed title if one is set manually
            }
        }
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"item"]) {
        FeedItem *newItem = [[FeedItem alloc]init];
        newItem.title = self.temporaryPostTitle;
        newItem.feedTitle = self.title;
        newItem.link = self.temporaryLink;
        newItem.description = self.temporaryDescription;
        newItem.date = self.temporaryDateObject;
        newItem.categoryTitle = self.categoryTitle;
        //was viewed will come from the database
        newItem.wasViewed = NO;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
}

@end
