//
//  City.h
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/16/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityWithCategorys : NSObject
//A collection of FeedCategories
//For now this will only return Tokyos information
//property gps location
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *allCategorys;

- (CityWithCategorys *)initCity:(NSString *)city withCategories:(NSArray *)categories;
@end
