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

@property (strong, nonatomic) NSString *pageHTML;
@property (nonatomic, copy) NSString *itemURL;
@property (nonatomic, strong) NSString *guid;
@property (nonatomic, strong) NSString *pubdate;
@property (nonatomic, strong) NSString *enclosure;
//title is already a property

@end
