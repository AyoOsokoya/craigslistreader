//
//  UserFollowedFeeds.h
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 7/28/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserSavedItems.h"
#import "Feeds.h"
#import "Feed.h"

@interface UserFollowedFeeds : Feeds
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UserSavedItems *savedItems;

- (void)refreshFeeds;
- (void)refreshFeed:(Feed *)feed;

- (UserFollowedFeeds *)initFeedsWithArrayOfFeedData:(NSMutableArray *)feedData;
- (void)addFeed:(Feed *)feed;
- (void)removeFeed:(Feed *)feed;

- (void)loadAllFeeds;
- (void)loadFeed:(id)feedId;//Not Particularly useful but added for completeness

- (void)saveAllFeeds;
- (void)saveFeed:(Feed *)feed;

- (void)updateAllFeeds;
- (void)updateFeed:(Feed *)feed;
@end
