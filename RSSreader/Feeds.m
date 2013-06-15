//
//  Feeds.m
//  RSSreader
//
//  Created by Ayodeji Osokoya on 5/29/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "Feeds.h"
#import "FollowedFeeds.h"

@implementation Feeds//a collection of Feed objects
#pragma mark Accessors
- (NSMutableArray *) feedURLs{
    if (!_feedURLs) {
        _feedURLs = [[NSMutableArray alloc] init];
        self.feedURLs = self.followedFeeds.followedFeeds;
    }
    return _feedURLs;
}

- (FollowedFeeds *) followedFeeds{
    if (!_followedFeeds) _followedFeeds = [[FollowedFeeds alloc] init];
    return _followedFeeds;
}

- (NSArray *) allFeeds{
    if (!_allFeeds) _allFeeds = [[NSMutableArray alloc] init];
    return _allFeeds;
}

#pragma mark Methods
- (Feeds *) initWithURLs:(NSArray *) feedURLs{//designated initializer
    
    self = [super init];
    self.feedURLs = [feedURLs mutableCopy];
    
    for (NSString *feedURL in feedURLs) {
        Feed *feed = [[Feed alloc] initWithURL:feedURL withTitle:@"" isFollowed:YES];
        //this needs some work
        [self.allFeeds addObject:feed];
    }
    return self;
}

- (Feeds *) init{
    if(self = [super init])
        return [self initWithURLs:nil];
    
    else return nil;
}

- (NSInteger)count{
    return [self.allFeeds count];
}
@end
