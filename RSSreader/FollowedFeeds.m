//
//  FollowedFeeds.m
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/15/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "FollowedFeeds.h"

@implementation FollowedFeeds

- (NSMutableArray *) followedFeeds{
    if(!_followedFeeds) {
        _followedFeeds = [[NSMutableArray alloc] init];
        [_followedFeeds addObject: @"http://tokyo.craigslist.jp/sof/index.rss"];
        //[_followedFeeds addObject: @"http://tokyo.craigslist.jp/sad/index.rss"];
        //[_followedFeeds addObject: @"http://tokyo.craigslist.jp/search/tch?query=%20&format=rss"];
        //[_followedFeeds addObject: @"http://tokyo.craigslist.jp/web/index.rss"];
    }
    return _followedFeeds;
    
}
@end
