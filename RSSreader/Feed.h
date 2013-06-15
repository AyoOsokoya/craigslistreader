//
//  Feed.h
//  RSSreader
//
//  Created by Ayodeji Osokoya on 5/23/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject <NSXMLParserDelegate>
//RSS Specification taken from http://cyber.law.harvard.edu/rss/rss.html

//mandatory
@property (nonatomic, strong) NSMutableString *title;
@property (nonatomic, strong) NSMutableString *link;
@property (nonatomic, strong) NSMutableString *description;
//optional
@property (nonatomic, strong) NSURL *image;
@property (nonatomic, strong) NSString *lastBuildDate;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic) BOOL isFollowed;

- (Feed *) initWithURL: (NSString *)feedURL withTitle:(NSString *) title isFollowed:(BOOL)isFollowed;
- (Feed *) initWithURL: (NSString *)feedURL isFollowed:(BOOL)isFollowed;
- (void) refresh;

@end