//
//  APPMasterViewController.m
//  RSSreader
//
//  Created by Osokoya Ayodeji on 5/21/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "FeedsTableViewController.h"
#import "APPDetailViewController.h"
#import "NSString+HTMLFunctions.h"

@interface FeedsTableViewController ()
@end

@implementation FeedsTableViewController

- (Feeds *) feeds{
    if(!_feeds) _feeds = [[Feeds alloc] init];
    return _feeds;
}

- (void) viewWillAppear:(BOOL)animated{
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //self.navigationItem.rightBarButtonItem = addButton;
    //self.feeds = [self.feeds init];//hmmm this looks wrong...
    
    //self.feeds = [[Feeds alloc] initWithURLs:self.feeds.feedURLs];
    [self.tableView reloadData];
    
}

- (void)viewDidAppear:(BOOL) animated{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //count the number of feeds
    return [self.feeds.allFeeds count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //introspection not necessary but good practice
    if ([self.feeds.allFeeds[section] isKindOfClass:[Feed class]]) {
        Feed * feed = (Feed *) self.feeds.allFeeds[section];
        //NSLog(@"Number Rows in Section %lu", (unsigned long)[feed.items count]);
        return [feed.items count];
    } else return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //grab the name of the feed
    //Feed *feed = (Feed *) self.feeds.allFeeds[section];
    return [self.feeds.allFeeds[section] title];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    //implement this
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell" forIndexPath:indexPath];
    
    Feed *feed = self.feeds.allFeeds[indexPath.section];
    
    NSString *itemTitle = [feed.items[indexPath.row] objectForKey: @"title"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", itemTitle];
    
    cell.detailTextLabel.text = [[feed.items[indexPath.row] objectForKey:@"description"] stringByReplacingOccurrencesOfString:@" 00:00:00 +0000" withString:@""];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //not sure if I need to implement this
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    /*if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSMutableDictionary * currentItem = [[self.feeds.allFeeds[indexPath.section] items] objectAtIndex:indexPath.row];
        
        [segue.destinationViewController setItemURL:[currentItem objectForKey:@"link"]];
        [segue.destinationViewController setPageHTML:[currentItem objectForKey:@"description"]];
        [segue.destinationViewController setTitle:[currentItem objectForKey:@"title"] ];
    }*/
}

@end
