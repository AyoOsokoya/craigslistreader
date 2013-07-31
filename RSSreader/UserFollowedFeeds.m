//
//  UserFollowedFeeds.m
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 7/28/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "UserFollowedFeeds.h"

@implementation UserFollowedFeeds

- (NSMutableArray *)items{
    if (!_items) _items = [[NSMutableArray alloc] init];
    return _items;
    
}

//A Temporary InitMethod
- (UserFollowedFeeds *) init{
    self = [super init];
    Feed *feed = [[Feed alloc] initWithURL:@"http://tokyo.craigslist.jp/search/med?query=%20&format=rss" withTitle:nil categoryTitle:@"Jobs" isFollowed:YES];
    Feed *feed1 = [[Feed alloc] initWithURL:@"http://tokyo.craigslist.jp/search/eng?query=%20&format=rss" withTitle:nil categoryTitle:@"Jobs" isFollowed:YES];
    Feed *feed2 = [[Feed alloc] initWithURL:@"http://tokyo.craigslist.jp/edu/index.rss" withTitle:nil categoryTitle:@"Jobs" isFollowed:YES];
    Feed *feed3 = [[Feed alloc] initWithURL:@"http://tokyo.craigslist.jp/search/sof?query=%20&format=rss" withTitle:nil categoryTitle:@"Jobs" isFollowed:YES];
    Feed *feed4 = [[Feed alloc] initWithURL:@"http://tokyo.craigslist.jp/search/sad?query=%20&format=rss" withTitle:nil categoryTitle:@"Jobs" isFollowed:YES];
    Feed *feed5 = [[Feed alloc] initWithURL:@"http://tokyo.craigslist.jp/search/tch?query=%20&format=rss" withTitle:nil categoryTitle:@"Jobs" isFollowed:YES];
    Feed *feed6 = [[Feed alloc] initWithURL:@"http://tokyo.craigslist.jp/search/web?query=%20&format=rss" withTitle:nil categoryTitle:@"Jobs" isFollowed:YES];
    Feed *feed7 = [[Feed alloc] initWithURL:@"http://tokyo.craigslist.jp/apa/index.rss" withTitle:nil categoryTitle:@"Housing" isFollowed:YES];
    [self.feeds  addObjectsFromArray:@[feed, feed1, feed2, feed3, feed4, feed5, feed6, feed7]];
    
    self.items = [self sortItemsIn:self.items By:@"date"];
    //if item is viewed and date is less than a particular time.... cull it
    
    //Copy all of the items to a single array
    for (Feed *feed in self.feeds){
        [self.items addObjectsFromArray:feed.items];
    }
    
    NSLog(@"%d", [self.items count]);
    
    for (Feed *feed in self.feeds) {
        feed.items = [self cullItems:feed.items ByNSDate:nil];
    }
    
    self.items = nil;
    
    for (Feed *feed in self.feeds){
        [self.items addObjectsFromArray:feed.items];
    }
    //dump this into a Method
    /*NSMutableIndexSet *itemsForRemoval = [[NSMutableIndexSet alloc] init];
    for (NSInteger i = 0; i < [self.items count]; i++ ) {
        NSDate *itemDate = [self.items[i] objectForKey:@"date"];
        ///NSLog(@"%f", [[item objectForKey:@"date"] timeIntervalSinceNow]);
        if ([itemDate timeIntervalSinceNow] < -48*60*60) {
            [itemsForRemoval addIndex:i];
        }
    }*/
    
    
    NSLog(@"%d", [self.items count]);
    
    return self;
}
- (UserFollowedFeeds *) initWithURLs:(NSArray *) feedURLs{//designated initializer
    self = [super initWithURLs:[feedURLs mutableCopy]];
    return self;
}

- (NSMutableArray *)cullItems:(NSMutableArray *)items ByNSDate:(NSDate *)cullDate{
    NSMutableIndexSet *itemsForRemoval = [[NSMutableIndexSet alloc] init];
    
    for (NSInteger i = 0; i < [items count]; i++ ) {
        NSDate *itemDate = [items[i] objectForKey:@"date"];
        ///NSLog(@"%f", [[item objectForKey:@"date"] timeIntervalSinceNow]);
        if ([itemDate timeIntervalSinceNow] < -48*60*60) {
            [itemsForRemoval addIndex:i];
        }
    }
    [items removeObjectsAtIndexes:itemsForRemoval];
    return items;
}
#pragma mark - Feed Array Methods
- (void)refreshFeeds{
    //TODO This might be faster asynchronously
    for (Feed *feed in self.feeds) {
        [self refreshFeed:feed];
    }
    [self updateAllFeeds];
}

- (void)refreshFeed:(Feed *)feed{
    [feed refresh];
}

- (UserFollowedFeeds *)initFeedsWithArrayOfFeedData:(NSArray *)feedData{
    
    //Take an array of dictionary items with feed data, URL, Title, City, Last Refresh
    //This will come from the database
    //
    return nil;
}

- (void)addFeed:(Feed *)feed{
    [self.feeds addObject:feed];
    //[self saveAllFeeds];
}

- (void)removeFeed:(Feed *)feed{
    [self.feeds removeObject:feed];
    //[self updateAllFeeds];
}

#pragma mark - Persistence Methods
- (void)saveAllFeeds{
    
}

- (void)saveFeed:(Feed *)feed{
    
}

- (void)loadAllFeeds{
    
}

- (void)loadFeed:(id)feedId{
    
}

- (void)updateAllFeeds{
    
}

- (void)updateFeed:(Feed *)feed{
    
}

#pragma mark - Sorting Methods
//make this take take the item list as a parameter
- (NSMutableArray *)sortItemsIn:(NSMutableArray *)sortingArray By:(NSString *)sortingType{
    /*
     – sortUsingDescriptors:
     – sortUsingComparator:
     – sortWithOptions:usingComparator:
     – sortUsingFunction:context:
     – sortUsingSelector:
     */
    NSMutableArray *sortedItems = [sortingArray mutableCopy];
    
    if([sortingType isEqualToString:@"ByDate"]) {
        [sortedItems sortUsingComparator:(NSComparator)^(NSMutableDictionary *item1, NSMutableDictionary *item2) {
            return [[item1 objectForKey:@"date"] compare:[item2 objectForKey:@"date"]];
        }];
        
    } else if([sortingType isEqualToString:@"ByType"]){
        [sortedItems sortUsingComparator:(NSComparator)^(NSMutableDictionary *item1, NSMutableDictionary *item2) {
            return [[item1 objectForKey:@"title"] caseInsensitiveCompare:[item2 objectForKey:@"title"]];
        }];
        
    } else if([sortingType isEqualToString:@"OriginalOrder"]){
        [sortedItems sortUsingComparator:(NSComparator)^(NSMutableDictionary *item1, NSMutableDictionary *item2) {
            return [[item1 objectForKey:@"title"] caseInsensitiveCompare:[item2 objectForKey:@"title"]];
        }];
        
    } else if([sortingType isEqualToString:@"Title"]){
        [sortedItems sortUsingComparator:(NSComparator)^(NSMutableDictionary *item1, NSMutableDictionary *item2) {
            return [[item1 objectForKey:@"title"] caseInsensitiveCompare:[item2 objectForKey:@"title"]];
        }];
    }
    //NSSortDescriptor or NSComparator
    
    return sortedItems;
}

@end
