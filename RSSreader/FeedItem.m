//
//  FeedItem.m
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 7/31/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "FeedItem.h"
#import "Feed.h"

@interface FeedItem()
@property (nonatomic, strong) NSMutableDictionary *dataStore;
@end

@implementation FeedItem
@synthesize title = _title;
@synthesize description = _description;
@synthesize date = _date;
@synthesize cityTitle= _cityTitle;
@synthesize dataStore = _dataStore;

#pragma mark - Init Methods
- (FeedItem *)initWithTitle:(NSMutableString *)title description:(NSMutableString *)description date:(NSDate *)date cityTitle:(NSMutableString *)cityTitle{
    self = [super init];
    _date = date;
    _cityTitle = cityTitle;
    _description = description;
    _title = title;
    return self;
}
- (NSMutableString *)title{
    if (!_title) _title = [[NSMutableString alloc]init];
    return _title;
}

- (void)setTitle:(NSMutableString *)title{
    _title = title;
}
- (NSMutableString *)description{
    if (!_description) _description= [[NSMutableString alloc]init];
    return _description;
}

- (void)setDescription:(NSMutableString *)description{
    _description = description;
}
- (NSMutableString *)cityTitle{
    if (!_cityTitle) _cityTitle = [[NSMutableString alloc]init];
    return _cityTitle;
}

- (void)setCityTitle:(NSMutableString *)cityTitle{
    _cityTitle = cityTitle;
}

- (NSDate *)date{
    if (!_date) _date = [[NSDate alloc]init];
    return _date;
}

- (void)setDate:(NSDate*)date{
    _date = date;
}
@end
