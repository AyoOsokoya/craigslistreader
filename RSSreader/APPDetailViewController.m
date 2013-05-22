//
//  APPDetailViewController.m
//  RSSreader
//
//  Created by Osokoya Ayodeji on 5/21/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "APPDetailViewController.h"

@interface APPDetailViewController ()
@end

@implementation APPDetailViewController
@synthesize url = _url;

#pragma mark - Managing the detail item
- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *myURL = [NSURL URLWithString: [self.url stringByAddingPercentEscapesUsingEncoding:
                                          NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [self.webView loadRequest:request];
    NSLog(@"%@", self.url);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
