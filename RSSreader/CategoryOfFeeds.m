//
//  Category.m
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/11/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "CategoryOfFeeds.h"

@implementation CategoryOfFeeds

- (CategoryOfFeeds *) initWithTitle:(NSString *)title feedDomain:(NSString *)domain forCity:(NSString *)city{
    _title = title;
    //just set a bunch of non followed feeds
    //- (Feed *) initWithURL: (NSString *)feedURL withTitle:(NSString *) title isFollowed:(BOOL)isFollowed;
    //TODO think of a clever way to get the city name into the feed
    NSMutableArray *tempCategory = [NSMutableArray new];
    
    CategoryWithFeedsTemplate *template = [[CategoryWithFeedsTemplate alloc] initWithTitle:title feedDomain:(NSString *)domain forCity:city];
    for (NSDictionary *feedTemplate in template.feedTemplates) {
        [tempCategory addObject:[[Feed alloc]initWithURL:[feedTemplate objectForKey:@"feedURL"] withTitle:[feedTemplate objectForKey:@"title"] isFollowed:YES]];
    }

    self.allFeeds = tempCategory;
    return self;
}

@end
