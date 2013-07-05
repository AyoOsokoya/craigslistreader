//
//  Feeds.h
//  RSSreader
//
//  Created by Ayodeji Osokoya on 5/29/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"
#import "FollowedFeeds.h"

//A collection of Feeds
@interface Feeds : NSObject
@property (strong, nonatomic) NSMutableArray *allFeeds;//An Array of all feed objects
@property (strong, nonatomic) NSMutableArray *feedURLs;
@property (strong, nonatomic) FollowedFeeds *followedFeeds;
@property (strong, nonatomic) NSMutableArray *followedFeedsURLs;

- (Feeds *) initWithURLs:(NSMutableArray *)feedURLs;//designated initializer
- (Feeds *) init;

- (NSInteger) count;
@end

/*
Persistence
It would be a good idea to save old feeds to the database and instantly present them to the user upon application launch. Then
The feed should be able to:
 
    - Save data to a database upon getting new data
        - Only save new items
            - query database for each guid if not there save it
    - recall all feed items from the database
    - delete saved items if required
 
Schema
    feeds
        id
        url
        title
        active
        link_to_page //link to the url or just use the description
 
    items
        feed_id
        url
        guid
        description 
        favourite
        read
*/
