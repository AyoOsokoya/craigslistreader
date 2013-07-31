//
//  FollowedFeeds.m
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/14/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "FollowedFeedsTableViewController.h"
#import "CategoryOfFeeds.h"

@interface FollowedFeedsTableViewController ()
@property NSInteger selectedRow;
@end

@implementation FollowedFeedsTableViewController
- (NSMutableArray *) followedFeeds{
    //only init if the feeds have been grabbed
    //this prevents asynchronous thread initing the followed feeds when self.feeds is not ready
    //self.followedFeeds causes it to be set up only when ready else it is nil and will
    //be init only when there is feed data
    
    if(!_followedFeeds && [_feeds count]) {
        _followedFeeds = [[NSMutableArray alloc] init];
        for (Feed *feed in self.feeds.feeds) {
            NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc] init];
            [tempDictionary setObject:feed.title forKey:@"title"];
            [tempDictionary setObject:[NSString stringWithFormat:@"%d Posts ??? New Posts",[feed.items count]] forKey:@"subtitle"];
            [_followedFeeds addObject:tempDictionary];
            //NSLog(@"Feed Title %@",feed.title);
            tempDictionary = nil;
        }
    }
    //@[@"All Feeds", @"Jobs - IT", @"Jobs - Web Design", @"For Sale - Cars", @"Personals - Women For Men"];
    return _followedFeeds;
}

- (CategoryOfFeeds *) feeds{
    if(!_feeds) _feeds = [[CategoryOfFeeds alloc] init];
    return _feeds;
}

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [self.navigationController setToolbarHidden:NO animated:NO];
}
- (IBAction)refreshButtonPressed:(UIBarButtonItem *)sender {
    [self refreshFeeds];
}

- (void)refreshFeeds {
    self.feeds = nil;
    self.followedFeeds = nil;
    [self.tableView reloadData];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
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
}
#pragma mark - UIViewController Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self refreshFeeds];
    /*
    CategoryOfFeeds *test0 = [[CategoryOfFeeds alloc] initWithTitle:@"Jobs" forCity:@"Tokyo"];
    self.feeds = test0;
    [self.tableView reloadData];
     */
    //NSLog(@"%ld Feeds", (long)sumFeedsCount);
}

- (IBAction)toggleEditMode:(UIBarButtonItem *)sender {
    if(!self.tableView.editing){
        [self.tableView setEditing:YES animated:YES];
        self.editButton.title = @"Done";
    } else {
        [self.tableView setEditing:NO animated:YES];
        self.editButton.title = @"Edit";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.followedFeeds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FollowedFeedsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    NSMutableDictionary *feedInfo = self.followedFeeds[indexPath.row];
    cell.textLabel.text = [feedInfo objectForKey:@"title"];
    cell.detailTextLabel.text = [feedInfo objectForKey:@"subtitle"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        sender = (UITableViewCell*) sender;
        if([segue.identifier isEqualToString:@"showFeedsSegue"]){
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            
            FeedsTableViewController *controller = (FeedsTableViewController *)segue.destinationViewController;
            Feed* feed = self.feeds.feeds[indexPath.row];
            //NSLog(@"%ld", (long)indexPath.row);
            controller.userData.feeds = [[NSMutableArray alloc] initWithObjects:feed, nil];
            controller.title = [feed.title stringByReplacingOccurrencesOfString:@"craigslist | " withString:@""];
            //take this and
        }
    }
}

@end
