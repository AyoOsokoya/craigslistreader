//
//  APPMasterViewController.m
//  RSSreader
//
//  Created by Osokoya Ayodeji on 5/21/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "FeedsTableViewController.h"

@interface FeedsTableViewController ()
@property (nonatomic, strong) UserFollowedFeeds *feeds;
@end

@implementation FeedsTableViewController

- (UserFollowedFeeds *) feeds{
    if(!_feeds) _feeds = [[UserFollowedFeeds alloc] init];
    return _feeds;
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setToolbarHidden:NO animated:NO];
}

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)refreshFeeds{
}

- (IBAction)toggleEditMode:(id)sender {
    if(!self.tableView.editing){
        [self.tableView setEditing:YES animated:YES];
        self.editButton.title = @"Done";
    } else {
        [self.tableView setEditing:NO animated:YES];
        self.editButton.title = @"Edit";
    }
}

- (IBAction)refreshButtonPressed:(id)sender {
    [self.userData refreshFeeds];
    [self.tableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.userData = [[UserFollowedFeeds alloc] init];
    
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //return 110;
    return 70;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //count the number of feeds
    return [self.userData.feeds count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //introspection not necessary but good practice
    if ([self.userData.feeds[section] isKindOfClass:[Feed class]]) {
        Feed * feed = (Feed *) self.userData.feeds[section];
        return [feed.items count];
    } else return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //Feed *feed = (Feed *) self.userData.feeds[section];
    //return [NSString stringWithFormat:@"%d Items", [feed.items count]];
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *cellIdentifier = @"FeedCell";
    static NSString *cellIdentifier = @"CellTypeColorIndicator";
    ColorStripTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    Feed *feed = self.userData.feeds[indexPath.section];
    NSDictionary *currentItem = feed.items[indexPath.row];
    //currentItem.
    
    NSString *itemTitle = [currentItem objectForKey: @"title"];
    cell.feedItemTitle.text = [NSString stringWithFormat:@"%@", itemTitle];
    
    
    NSString *description = [[currentItem objectForKey:@"description"] stringByReplacingOccurrencesOfString:@" 00:00:00 +0000" withString:@""];
    cell.itemSummary.text = [NSString stringWithFormat:@"%@", description];
    
    cell.locationLabel.text = @"Somewhere in Japan";
    cell.dateLabel.text = @"Yesterday";
    
    [cell setCellTypeColorIndicatorByCategoryName:feed.categoryTitle];
    [cell.itemSummary setHidden:YES];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"ShowDetailSegue"]){
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSMutableDictionary * currentItem = [[self.userData.feeds[indexPath.section] items] objectAtIndex:indexPath.row];
        
        [segue.destinationViewController setItemURL:[currentItem objectForKey:@"link"]];
        //[segue.destinationViewController setPageHTML:[currentItem objectForKey:@"description"]];
        [segue.destinationViewController setTitle:[currentItem objectForKey:@"title"]];
    }
}

@end

