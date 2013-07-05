//
//  City.m
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/16/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "CityWithCategorys.h"
#import "CategoryOfFeeds.h"

@implementation CityWithCategorys
- (NSString *)title{
    return _title;
}

- (NSArray *)allCategorys{
    //init all of the categories
    if(!_allCategorys){
        _allCategorys = [[NSArray alloc] init];
    }
    return _allCategorys;
}
- (CityWithCategorys *)initCity:(NSString *)city withCategories:(NSArray *)categories{
    //this should go through an array of categories and use self.title as the city
    _title = city;
    _title = @"Tokyo";
    
    CategoryOfFeeds *community = [[CategoryOfFeeds alloc] initWithTitle:@"Community" forCity:_title];
    CategoryOfFeeds *jobs = [[CategoryOfFeeds alloc] initWithTitle:@"Jobs" forCity:@"Tokyo"];
    CategoryOfFeeds *personals = [[CategoryOfFeeds alloc] initWithTitle:@"Personals" forCity:@"Tokyo"];
    CategoryOfFeeds *services = [[CategoryOfFeeds alloc] initWithTitle:@"Services" forCity:@"Tokyo"];
    CategoryOfFeeds *housing = [[CategoryOfFeeds alloc] initWithTitle:@"Housing" forCity:@"Tokyo"];
    CategoryOfFeeds *forSale = [[CategoryOfFeeds alloc] initWithTitle:@"ForSale" forCity:@"Tokyo"];
    CategoryOfFeeds *events = [[CategoryOfFeeds alloc] initWithTitle:@"Events" forCity:@"Tokyo"];
    //todo, American cities have a few more catetories
    //also I could init all categories but if a category has no found feeds, just ignore it
        
    _allCategorys = [[NSArray alloc] initWithObjects:community, jobs, personals, services, housing, forSale, events, nil];
    
    return self;
}
@end
