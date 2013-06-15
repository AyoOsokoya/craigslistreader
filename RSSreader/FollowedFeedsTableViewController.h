//
//  FollowedFeeds.h
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/14/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"
#import "Feeds.h"
#import "FeedsTableViewController.h"

@interface FollowedFeedsTableViewController : UITableViewController
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *followedFeeds;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (nonatomic, strong) Feeds *feeds;
@end
