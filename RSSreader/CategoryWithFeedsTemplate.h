//
//  CategoryWithFeedsTemplates.h
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/16/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryWithFeedsTemplate : NSObject
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSArray* feedTemplates;
@property (nonatomic, strong) NSMutableDictionary *template;
@property (nonatomic, strong) NSString *domain; //the domain of the feed ie craigslist.jp etc

- (CategoryWithFeedsTemplate *) initWithTitle:(NSString *)title feedDomain:(NSString *)domain forCity:(NSString *)city;
@end
//[[CategoryWithFeedsTemplate alloc] initWithTitle:title feedDomain:(NSString *)domain forCity:city]
