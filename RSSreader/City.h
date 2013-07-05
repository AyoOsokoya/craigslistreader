//
//  City.h
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/18/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <Foundation/Foundation.h>

//A simple class to store city name
@interface City : NSObject
@property (nonatomic, strong) NSString *title;
//@property (nonatomic, strong) NSString *location;
//The title of a city in a format suitable for URLs
@property (nonatomic, strong) NSString *URLTitle;

//This will be fed to the template and used to generate the url for differeing countries that do not use the
//same url scheme like tokyo.craigslist.com
@property (nonatomic, strong) NSString *craigsListURL;
@end
