//
//  City.m
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/18/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "City.h"

@implementation City

- (NSString *)title{
    if (!_title) _title = [NSString new];
    return _title;
}

- (NSString *)URLTitle{
    if (!_title) _title = [NSString new];
    return _title;
}

- (City *)initWithTitle:(NSString *)title URLTitle:(NSString *)URLTitle{
    return self;
}

@end
