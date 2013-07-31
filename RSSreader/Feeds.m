//
//  Feeds.m
//  RSSreader
//
//  Created by Ayodeji Osokoya on 5/29/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "Feeds.h"
@interface Feeds()

@end

@implementation Feeds//a collection of Feed objects

#pragma mark Accessors
- (NSMutableArray *) feeds{
    if (!_feeds) _feeds = [[NSMutableArray alloc] init];
    return _feeds;
}

#pragma mark Methods
- (Feeds *) initWithURLs:(NSArray *) feedURLs{//designated initializer
    self = [super init];
    
    for (NSString *feedURL in feedURLs) {
        Feed *feed = [[Feed alloc] initWithURL:feedURL withTitle:@"" isFollowed:YES];
        //this needs some work
        [self.feeds addObject:feed];
    }
    return self;
}

- (Feeds *) init{
    if(self = [super init])
        return [self initWithURLs:nil];
    else return nil;
}

- (NSInteger)count{
    return [self.feeds count];
}
@end
