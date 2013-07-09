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

- (NSString *)craigslistDomain{
    if(!_craigslistDomain) _craigslistDomain = [[NSString alloc] init];
    return _craigslistDomain;
}

- (CityWithCategorys *)initCity:(NSString *)city withCategories:(NSArray *)categories feedDomain:(NSString *)domain{
    //this should go through an array of categories and use self.title as the city
    _title = city;
    _title = @"Tokyo";
    _craigslistDomain = domain;
    domain = @"craigslist.jp";
    
    
    //initWithTitle:(NSString *)categoryTitle forCity:(NSString *)city feedDomain:(NSString *)domain
    CategoryOfFeeds *community = [[CategoryOfFeeds alloc] initWithTitle:@"Community" feedDomain:domain forCity:city];
    CategoryOfFeeds *jobs = [[CategoryOfFeeds alloc] initWithTitle:@"Jobs" feedDomain:domain  forCity:city];
    CategoryOfFeeds *personals = [[CategoryOfFeeds alloc] initWithTitle:@"Personals" feedDomain:domain forCity:city];
    CategoryOfFeeds *services = [[CategoryOfFeeds alloc] initWithTitle:@"Services" feedDomain:domain forCity:city];
    CategoryOfFeeds *housing = [[CategoryOfFeeds alloc] initWithTitle:@"Housing" feedDomain:domain forCity:city];
    CategoryOfFeeds *forSale = [[CategoryOfFeeds alloc] initWithTitle:@"ForSale" feedDomain:domain forCity:city];
    CategoryOfFeeds *events = [[CategoryOfFeeds alloc] initWithTitle:@"Events" feedDomain:domain forCity:city];
    //todo, American cities have a few more catetories
    //also I could init all categories but if a category has no found feeds, just ignore it
        
    _allCategorys = [[NSArray alloc] initWithObjects:community, jobs, personals, services, housing, forSale, events, nil];
    
    return self;
}
@end
