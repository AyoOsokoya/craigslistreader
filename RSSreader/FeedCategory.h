//
//  Category.h
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/11/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

//A collection of all of the possible feeds and their titles

#import <Foundation/Foundation.h>
#import "Feeds.h"

@interface FeedCategory : NSObject
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSMutableArray *feeds;
- (FeedCategory *) initWithTitle:(NSString *)title withFeeds:(NSArray *)feeds;
- (void) addFeed:(NSString *)feed withTitle:(NSString *) title;
@end
