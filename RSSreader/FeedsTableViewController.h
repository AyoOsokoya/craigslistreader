//
//  APPMasterViewController.h
//  RSSreader
//
//  Created by Osokoya Ayodeji on 5/21/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APPDetailViewController.h"
#import "NSString+HTMLFunctions.h"
#import "Feeds.h"
#import "feed.h"
#import "ColorStripTableViewCell.h"
#import "UserFollowedFeeds.h"

@interface FeedsTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *settingsButton;
@property (strong, nonatomic) UserFollowedFeeds *userData;
@end
