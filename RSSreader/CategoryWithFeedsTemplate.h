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

- (CategoryWithFeedsTemplate *) initWithTitle:(NSString *)title forCity:(NSString *)city;
@end
