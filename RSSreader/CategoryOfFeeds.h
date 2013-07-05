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
#import "Feed.h"
#import "CategoryWithFeedsTemplate.h"

//A collection of Feeds
/*
What if I make Feed Category a subclass of Feeds as it can be considered
  a special instance of a collection of Feed objects.
 */

@interface CategoryOfFeeds : Feeds
@property (nonatomic, strong) NSString * title;

//generates the rss feeds for a give city name
- (CategoryOfFeeds *) initWithTitle:(NSString *)categoryTitle forCity:(NSString *)city;

@end
