//
//  NSString+HTMLFunctions.m
//  RSSreader
//
//  Created by Ayodeji Osokoya on 6/2/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "NSString+HTMLFunctions.h"

@implementation NSString (HTMLFunctions)
-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

@end
