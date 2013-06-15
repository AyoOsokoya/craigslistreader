//
//  CategoriesListTablewViewController.h
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/13/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriesListTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *categories; //a temporary array to hold the pre defined categories.
@end
