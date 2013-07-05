//
//  APPDetailViewController.h
//  RSSreader
//
//  Created by Osokoya Ayodeji on 5/21/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface APPDetailViewController : UIViewController <MFMailComposeViewControllerDelegate, NSXMLParserDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *pageHTML;
@property (nonatomic, copy) NSString *itemURL;
@property (nonatomic, strong) NSString *guid;
@property (nonatomic, strong) NSString *pubdate;
@property (nonatomic, strong) NSString *enclosure;
@property (nonatomic, strong) NSXMLParser *parser;
//title is already a property
#pragma mark - Outlets for the ToolBar 
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *replyButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *exportButton;

@end
