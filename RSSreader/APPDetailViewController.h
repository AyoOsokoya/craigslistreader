//
//  APPDetailViewController.h
//  RSSreader
//
//  Created by Osokoya Ayodeji on 5/21/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, copy) NSString *url;
    
@end
