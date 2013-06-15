//
//  AllFeedLinksAndCategories.m
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/11/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "AllFeedLinksAndCategories.h"
#import "FeedCategory.h"

@interface AllFeedLinksAndCategories()
@end

@implementation AllFeedLinksAndCategories
@synthesize feedCategories = _feedCategories;

- (NSMutableDictionary *)feedCategories{
    if(!_feedCategories) {
        _feedCategories = [[NSMutableDictionary alloc] init];
        //NSArray *tempFeeds = [[NSArray alloc] init];
        //FeedCategory *jobs = [[FeedCategory alloc] initWithTitle:@"Jobs" withFeeds:nil];
        
        //@"Tokyo Admin/Office"
        //http://tokyo.craigslist.jp/ofc/index.rss
        //
        //@"Architects, Engineers, CAD"
        //http://tokyo.craigslist.jp/search/egr?query=%20&format=rss
        //
        //@"Art Media Design"
        //http://tokyo.craigslist.jp/med/index.rss
        //
        //@"Education & Teaching"
        //http://tokyo.craigslist.jp/edu/index.rss
        //
        //@"Internet Engineering"
        //http://tokyo.craigslist.jp/search/eng?query=+
        //
        //@"Software, QA/DBA/etc jobs"
        //http://tokyo.craigslist.jp/sof/
 
        //FeedCategory *housing = [[FeedCategory alloc] initWithTitle:@"Jobs" withFeeds:nil];
        //FeedCategory *forSale = [[FeedCategory alloc] initWithTitle:@"Jobs" withFeeds:nil];
        //FeedCategory *services = [[FeedCategory alloc] initWithTitle:@"Jobs" withFeeds:nil];
        //FeedCategory *community = [[FeedCategory alloc] initWithTitle:@"Jobs" withFeeds:nil];
        //ignore for the first release
        //FeedCategory *personal = [[FeedCategory alloc] initWithTitle:@"Jobs" withFeeds:nil];
        
        
        [_feedCategories setObject:@" " forKey:@"something"];
    }
    return _feedCategories;
}

- (void) setFeedCategories:(NSMutableDictionary *)feedCategories{
    
}
@end
