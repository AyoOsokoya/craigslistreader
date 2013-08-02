//
//  APPMasterViewController.m
//  RSSreader
//
//  Created by Osokoya Ayodeji on 5/21/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "FeedsTableViewController.h"
#import "FeedItem.h"

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
    
    /*dispatch_async(dispatch_get_global_queue(0, 0), ^{
                       [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
                        //Todo ask the city to init the feed with the correct feed domain
                        //could I store all of this as json or something then just load it up
                        self.feeds = [[CategoryOfFeeds alloc] initWithTitle:@"Jobs" feedDomain:@"craigslist.jp" forCity:@"Tokyo"];
                        //[self.feeds [[CategoryOfFeeds alloc] initWithTitle:@"Housing" feedDomain:@"craigslist.jp" forCity:@"Tokyo"];
        
                       dispatch_async(dispatch_get_main_queue(), ^ {
                           [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                           [self.tableView reloadData];
                       });
                   });
     */
    dispatch_async(dispatch_get_global_queue(0, 0), ^ {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    });
    
    //http://stackoverflow.com/questions/6246003/setnetworkactivityindicatorvisible-spinner-not-displaying
    //TODO Network Activity not being updated has something do to with threads
    NSLog(@"Refreshing Start");
    self.userData.items = nil;
    //reload data seems to be ignored till we return to main function
    [self.tableView reloadData];
    
    
    [self.userData refreshFeeds];
    [self.tableView reloadData];
    NSLog(@"Refreshing Finish");
    //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.userData = [[UserFollowedFeeds alloc] init];
    //UIColor *navigationColor = [UIColor colorWithHue:240/360.0f saturation:0.0f brightness:0.8f alpha:1];
    
    UIColor *navigationColor = [UIColor colorWithHue:240/360.0f saturation:0.0f brightness:0.6f alpha:1];
    //Nice Blurple
    //UIColor *navigationColor = [UIColor colorWithHue:240/360.0f saturation:0.4f brightness:0.8f alpha:1];
    [self.navigationController.navigationBar setTintColor:navigationColor];
    [self.navigationController.toolbar setTintColor:navigationColor];
    
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
    //return [self.userData.feeds count];
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //introspection not necessary but good practice
    //if ([self.userData.feeds[section] isKindOfClass:[Feed class]]) {
        //Feed * feed = (Feed *) self.userData.feeds[section];
        //return [feed.items count];
    //} else return 0;
    return [self.userData.items count];
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
    
    FeedItem *currentItem = self.userData.items[indexPath.row];
    //currentItem.
    
    NSString *itemTitle = currentItem.title;
    cell.feedItemTitle.text = [NSString stringWithFormat:@"%@", itemTitle];
    
    
    NSString *description = [currentItem.description stringByReplacingOccurrencesOfString:@" 00:00:00 +0000" withString:@""];
    cell.itemSummary.text = [NSString stringWithFormat:@"%@", description];
    
    cell.locationLabel.text = @"Somewhere in Japan";
    cell.dateLabel.text = [NSString stringWithFormat:@"%@", currentItem.date];
    
    //NSMutableString *category = [currentItem objectForKey:@"category"];
    
    [cell setCellTypeColorIndicatorByCategoryName:currentItem.categoryTitle];
    currentItem.wasViewed = YES;
    
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
        FeedItem * currentItem = self.userData.items[indexPath.row];
        
        [segue.destinationViewController setItemURL:currentItem.link];
        //[segue.destinationViewController setPageHTML:[currentItem objectForKey:@"description"]];
        [segue.destinationViewController setTitle:currentItem.title];
    }
}

@end

