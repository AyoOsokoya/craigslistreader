//
//  Country.h
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/16/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <CoreLocation/CoreLocation.h>
@interface CountryWithRegions : NSObject
//a collection of regions
@property (nonatomic, strong) NSString *title;

//for now only returns the city
//Region with City tells this which cities it has

//@property (nonatomic, strong) CLLocation *countryLocation;

@end
