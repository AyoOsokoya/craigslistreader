//
//  FeedItem.h
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 7/31/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Feed;

@interface FeedItem : NSObject
@property (nonatomic, strong) NSMutableString *title;
@property (nonatomic, strong) NSMutableString *description;
@property (nonatomic, strong) NSMutableString *link;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSMutableString *cityTitle;
@property (nonatomic, strong) NSMutableString *feed;
@property (nonatomic, strong) NSMutableString *feedTitle;
@property (nonatomic, strong) NSMutableString *categoryTitle;
@property (nonatomic) BOOL wasViewed;
@property (nonatomic, strong) Feed *parentFeed;
@property (nonatomic, strong) NSMutableString *feedURL;
/*
 feedTitle;
 title;
 link;
 description;
 date;
 itemFeed;
 category;
 wasViewed;
 */
- (FeedItem *) initWithTitle:(NSMutableString *)title description:(NSMutableString *)description date:(NSDate *)date cityTitle:(NSMutableString *)cityTitle;
@end
