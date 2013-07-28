//
//  APPDetailViewController.m
//  RSSreader
//
//  Created by Osokoya Ayodeji on 5/21/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "APPDetailViewController.h"

@interface APPDetailViewController ()
@end

@implementation APPDetailViewController

#pragma mark - Managing the detail item
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *pageURLEscaptedUTF8 = [self.itemURL stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    NSString *pageProblemURLString = [@"http://tokyo.craigslist.jp/tch/3926678905.html" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *pageFineURLString    = [@"http://tokyo.craigslist.jp/fbh/3882721752.html" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL *pageProblemURL = [NSURL URLWithString:pageProblemURLString];
    NSURL *pageFineURL  = [NSURL URLWithString:pageFineURLString];
    
    NSURL *pageURL = [NSURL URLWithString:pageURLEscaptedUTF8];
    
    NSURLRequest *pageRequest = [NSURLRequest requestWithURL:pageURL];
    [pageRequest allowsCellularAccess];
    
    //TODO solve the problem with some URLs not loading
    NSError *pageLoadError = [[NSError alloc] initWithDomain:pageProblemURLString code:nil userInfo:nil];
    NSString *pageHTML = [NSString stringWithContentsOfURL:pageURL encoding:NSUTF8StringEncoding error:&pageLoadError];
    //[self.webView loadRequest:pageRequest];
    //HTML Parsing
    //http://www.cocoawithlove.com/2008/10/using-libxml2-for-parsing-and-xpath.html
    //http://www.raywenderlich.com/14172/how-to-parse-html-on-ios
    //request the page
    //process it
    //output some HTML
    //load the page
    [self.webView loadHTMLString:pageHTML baseURL:pageURL];
    
    //check if the item is a favorite
    //if so set the button to active
    
    //[self.webView loadHTMLString:self.pageHTML baseURL:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    //http://stackoverflow.com/questions/5148022/how-are-toolbars-hidden-using-animation
    /*[UIView animateWithDuration:0.2
                     animations:^{
                         [self.navigationController setToolbarHidden:NO animated:YES];
                     }
                     completion:^(BOOL finished){
                         // whatever
                     }];*/
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions for the ToolBar Buttons
- (IBAction)replyToItem:(UIBarButtonItem *)sender {
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    controller.subject = self.title;
    controller.toRecipients = @[@"inspireology@gmail.com"];
    [controller setMessageBody:self.itemURL isHTML:NO];
    //TODO... should i implement the completion handler?
    if (controller) [self presentViewController:controller animated:YES completion: NULL];
    NSLog(@"Replying to Item");
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    // Notifies users about errors associated with the interface
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Result: canceled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Result: saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Result: sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Result: failed");
            break;
        default:
            NSLog(@"Result: not sent");
            break;
    }
    
    [controller dismissViewControllerAnimated:YES completion:NULL];
}

-(void)launchMailApp {
        NSString *recipients = @"dest_email";
        NSString *subject = @"a subject";
        NSString *email = [NSString stringWithFormat:@"%@%@", recipients, subject];
        email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

#pragma - mark Export
- (IBAction)exportItem:(UIBarButtonItem *)sender {
    NSLog(@"Exporting Item");
    //bring up a modal dialogue to suggest:
        // -- Email
        // -- Copy Link
        // -- Save to Drafts folder
}

#pragma - mark Bookmark
- (IBAction)toggleBookMarkItem:(UIBarButtonItem *)sender {
    NSLog(@"Toggling Bookmark");
    //Call the userData save item function
    //
}

#pragma mark - NSXMLParserDelegate implemenatation
- (NSXMLParser *) parser{
    if(!_parser) _parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:self.itemURL]];
    return _parser;
}

- (void) parserDidStartDocument:(NSXMLParser *)parser{
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {//presents all of the chars of the current element
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
}
@end
