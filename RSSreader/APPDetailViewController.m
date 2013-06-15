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

#pragma mark - Managing the detail item
- (void)viewDidLoad {
    [super viewDidLoad];
    //NSURL *myURL = [NSURL URLWithString:[self.itemURL stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    //NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    //[self.webView loadRequest:request];
    
    //check if the item is a favorite
    //if so set the button to active
    
    [self.webView loadHTMLString:self.pageHTML baseURL:nil];
}

- (void)viewDidDisappear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
