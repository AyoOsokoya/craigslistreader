//
//  Category.m
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/11/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "FeedCategory.h"

@implementation FeedCategory

- (FeedCategory *) initWithTitle:(NSString *)title withFeeds: (NSArray *)feeds{
    self.title = title;
    return self;
}

- (void) addFeed:(NSString *)feed withTitle:(NSString *) title{
    //add the feed to the category 
}
@end
