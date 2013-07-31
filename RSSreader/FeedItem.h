//
//  FeedItem.h
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 7/31/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedItem : NSObject
@property (nonatomic, strong) NSMutableString *title;
@property (nonatomic, strong) NSMutableString *description;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSMutableString *cityTitle;

- (FeedItem *) initWithTitle:(NSMutableString *)title description:(NSMutableString *)description date:(NSDate *)date cityTitle:(NSMutableString *)cityTitle;
@end
