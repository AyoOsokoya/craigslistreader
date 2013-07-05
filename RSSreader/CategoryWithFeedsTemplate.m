//
//  CategoryWithFeedsTemplates.m
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 6/16/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "CategoryWithFeedsTemplate.h"
@interface CategoryWithFeedsTemplate()
@property (nonatomic, strong) NSMutableArray *temporaryFeedArray;
@end

@implementation CategoryWithFeedsTemplate
- (NSString *) city{
    if (!_city) _city = [[NSString alloc] init];
    return _city;
}

- (NSMutableArray *) temporaryFeedArray{
    if (!_temporaryFeedArray) _temporaryFeedArray = [[NSMutableArray alloc] init];
    return _temporaryFeedArray;
}
#pragma mark - Initializors
- (CategoryWithFeedsTemplate *) initWithTitle:(NSString *)title forCity:(NSString *)city{
    _city = [city lowercaseString];
    if ([title isEqualToString:@"Community"])           [self communityTemplateArray];
    else if ([title isEqualToString:@"Personals"])  	[self personalsTemplateArray];
    else if ([title isEqualToString:@"Services"])       [self servicesTemplateArray];
    else if ([title isEqualToString:@"Housing"])        [self housingTemplateArray];
    else if ([title isEqualToString:@"For Sale"])       [self forSaleTemplateArray];
    else if ([title isEqualToString:@"Jobs"])           [self jobsTemplateArray];
    else if ([title isEqualToString:@"Resumes"])        [self resumesTemplateArray];
    else if ([title isEqualToString:@"Part-Time"])  	[self parttimeTemplateArray];
    else if ([title isEqualToString:@"Gigs"])           [self gigsTemplateArray];
    else if ([title isEqualToString:@"Events"])         [self eventsTemplateArray];
    
    return self;
}

- (NSDictionary *)feedTemplateWithURL:(NSString *)feedURL title:(NSString *) title{
    NSMutableDictionary * tempDictionary = [[NSMutableDictionary alloc] init];
    [tempDictionary setObject:title forKey:@"title"];//
    //todo change craigslist.jp to a token that can be replaces by the cities base url
    [tempDictionary setObject:[feedURL stringByReplacingOccurrencesOfString:@"{#}" withString:self.city] forKey:@"feedURL"];
    [self.temporaryFeedArray addObject:tempDictionary];
    self.feedTemplates = [self.temporaryFeedArray copy];
    return tempDictionary;
}

- (void) jobsTemplateArray{
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/jjj/index.rss" title:@"All Jobs"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/acc/index.rss" title:@"Accounting & Finance"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/ofc/index.rss" title:@"Admin & Office"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/egr/index.rss" title:@"Architecture & Engineering"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/med/index.rss" title:@"Art, Media & Design"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/sci/index.rss" title:@"Biotech & Science"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/bus/index.rss" title:@"Business & Management"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/csr/index.rss" title:@"Customer Service"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/edu/index.rss" title:@"Education"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/fbh/index.rss" title:@"Food, Drink & Hospitality"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/lab/index.rss" title:@"General Labor"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/gov/index.rss" title:@"Government"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/hum/index.rss" title:@"Human Resources"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/eng/index.rss" title:@"Internet Engineers"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/lgl/index.rss" title:@"Legal & Paralegal"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/mnu/index.rss" title:@"Manufacturing"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/mar/index.rss" title:@"Marketing, PR & Advertising"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/hea/index.rss" title:@"Medical & Health"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/npo/index.rss" title:@"Nonprofit Sector"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/rej/index.rss" title:@"Real Estate"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/ret/index.rss" title:@"Retail & Wholesale"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/sls/index.rss" title:@"Sales & Biz Dev"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/spa/index.rss" title:@"Salon, Spas & Fitness"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/sec/index.rss" title:@"Security"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/trd/index.rss" title:@"Skilled Trade & Craft"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/sof/index.rss" title:@"Software, QA & DBA"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/sad/index.rss" title:@"Systems & Network"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/tch/index.rss" title:@"Technical Support"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/trp/index.rss" title:@"Transport"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/tfr/index.rss" title:@"TV, Film & Video"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/web/index.rss" title:@"Web & Information Design"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/wri/index.rss" title:@"Writing & Editing"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/etc/index.rss" title:@"Etc"];
}

- (void) communityTemplateArray{
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/ccc/index.rss" title:@"All Community"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/act/index.rss" title:@"Activities"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/ats/index.rss" title:@"Artists"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/kid/index.rss" title:@"Childcare"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/cls/index.rss" title:@"Classes"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/eve/index.rss" title:@"Events"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/com/index.rss" title:@"General"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/grp/index.rss" title:@"Groups"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/vnn/index.rss" title:@"Local & News"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/laf/index.rss" title:@"Lost+Found"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/muc/index.rss" title:@"Musicians"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/pet/index.rss" title:@"Pets"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/pol/index.rss" title:@"Politics"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/rid/index.rss" title:@"Rideshare"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/vol/index.rss" title:@"Volunteers"];
}

- (void) personalsTemplateArray{
    //TODO Strictly Platonic has more subcategories
    //currently just show all
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/stp/index.rss" title:@"Strictly Platonic"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/w4w/index.rss" title:@"Women Seek Women"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/w4m/index.rss" title:@"Women Seeking Men"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/m4w/index.rss" title:@"Men Seeking Women"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/m4m/index.rss" title:@"Men Seeking Men"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/msr/index.rss" title:@"Misc Romance"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/cas/index.rss" title:@"Casual Encounters"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/mis/index.rss" title:@"Missed Connections"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/rnr/index.rss" title:@"Rants and Raves"];
}

- (void) servicesTemplateArray{
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/bbb/index.rss" title:@"All Services"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/bts/index.rss" title:@"Beauty"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/cps/index.rss" title:@"Computer"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/crs/index.rss" title:@"Creative"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/cys/index.rss" title:@"Cycle"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/evs/index.rss" title:@"Event"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/fns/index.rss" title:@"Financial"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/lgs/index.rss" title:@"Legal"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/lss/index.rss" title:@"Lessons"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/mas/index.rss" title:@"Marine"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/pas/index.rss" title:@"Pets"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/aos/index.rss" title:@"Automotive"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/fgs/index.rss" title:@"Farm & Garden"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/hss/index.rss" title:@"Household"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/lbs/index.rss" title:@"Labor/move"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/rts/index.rss" title:@"Real Estate"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/sks/index.rss" title:@"Skilled Trade"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/biz/index.rss" title:@"Buisniess Ads"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/ths/index.rss" title:@"Therapeutic"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/trv/index.rss" title:@"Travel/vac"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/wet/index.rss" title:@"Write/Ed/Tr8"];
}

- (void) forSaleTemplateArray{
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/sss/index.rss" title:@"All For Sale"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/ata/index.rss" title:@"Antiques"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/baa/index.rss" title:@"Baby & Kids"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/bar/index.rss" title:@"Barter"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/bia/index.rss" title:@"Bikes"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/boo/index.rss" title:@"Boats"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/bka/index.rss" title:@"Books"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/bfa/index.rss" title:@"Business"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/sya/index.rss" title:@"Computer"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/zip/index.rss" title:@"Free"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/foa/index.rss" title:@"General"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/hsa/index.rss" title:@"Household"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/jwa/index.rss" title:@"Jewelry"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/maa/index.rss" title:@"Materials"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/rva/index.rss" title:@"Rvs"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/sga/index.rss" title:@"Sporting"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/tia/index.rss" title:@"Tickets"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/tla/index.rss" title:@"Tools"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/wan/index.rss" title:@"Wanted"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/ppa/index.rss" title:@"Appliances"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/ara/index.rss" title:@"Arts & Crafts"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/pta/index.rss" title:@"Auto Parts"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/haa/index.rss" title:@"Beauty & Hlth"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/cta/index.rss" title:@"Cars & Trucks"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/ema/index.rss" title:@"CDs/DVD/VHS"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/moa/index.rss" title:@"Cell Phones"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/cla/index.rss" title:@"Clothes & Accessories"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/cba/index.rss" title:@"Collectibles"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/ela/index.rss" title:@"Electronics"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/gra/index.rss" title:@"Farm & Garden"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/fua/index.rss" title:@"Furniture"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/gms/index.rss" title:@"Garage Sale"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/mca/index.rss" title:@"Motorcycles"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/msa/index.rss" title:@"Musical Instruments"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/pha/index.rss" title:@"Photo & Video"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/taa/index.rss" title:@"Toys & Games"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/vga/index.rss" title:@"Video Gaming"];
}

- (void) housingTemplateArray{
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/hhh/index.rss" title:@"All Housing"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/apa/index.rss" title:@"Housing, Apartments"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/swp/index.rss" title:@"Housing Swap"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/hsw/index.rss" title:@"Housing Wanted"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/off/index.rss" title:@"Office, Commercial"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/prk/index.rss" title:@"Parking, Storage"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/rea/index.rss" title:@"Real Estate For Sale"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/roo/index.rss" title:@"Rooms, Shared"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/sub/index.rss" title:@"Sublets, Temporary"];
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/vac/index.rss" title:@"Vacation Rentals"];
}

- (void) eventsTemplateArray{
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/eve/index.rss" title:@"Events"];
}

- (void) resumesTemplateArray{
    [self feedTemplateWithURL:@"http://{#}.craigslit.jp/res/index.rss" title:@"Resumes"];
}

- (void) parttimeTemplateArray{
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/search/jjj?addFour=part-time/index.rss" title:@"Part Time"];
}

- (void) gigsTemplateArray{
    [self feedTemplateWithURL:@"http://{#}.craigslist.jp/ggg/index.rss" title:@"Gigs"];
}

#pragma mark - Accessors
- (NSMutableDictionary *) template{
    if (!_template) _template = [[NSMutableDictionary alloc] init];
    return _template;
}/*
- (CategoryWithFeedsTemplate *) community {
    if(!_community){
        NSMutableDictionary *categoryWithFeedsTemplate = [[NSMutableDictionary alloc] init];
        [categoryWithFeedsTemplate setObject:@"Community" forKey:@"Title"];
        
        //Add all of the feed templatates to the array
        
        NSMutableArray *feedTemplates = [[NSMutableArray alloc] init];
        [_template setObject:[feedTemplates copy] forKey:@"categoryTemplates"];
    }
    return _community;
}

- (CategoryWithFeedsTemplate *) jobs{
    if(!_community){
        NSMutableDictionary *categoryWithFeedsTemplate = [[NSMutableDictionary alloc] init];
        [categoryWithFeedsTemplate setObject:@"Community" forKey:@"Title"];
        
        //Add all of the feed templatates to the array
        
        NSMutableArray *feedTemplates = [[NSMutableArray alloc] init];
        [_template setObject:[feedTemplates copy] forKey:@"categoryTemplates"];
    }
    return _jobs;
}

- (CategoryWithFeedsTemplate *) personals{
    if(!_community){
        NSMutableDictionary *categoryWithFeedsTemplate = [[NSMutableDictionary alloc] init];
        [categoryWithFeedsTemplate setObject:@"Community" forKey:@"Title"];
        
        //Add all of the feed templatates to the array
        
        NSMutableArray *feedTemplates = [[NSMutableArray alloc] init];
        [_template setObject:[feedTemplates copy] forKey:@"categoryTemplates"];
    }
    return _personals;
}

- (CategoryWithFeedsTemplate *) services{
    if(!_community){
        NSMutableDictionary *categoryWithFeedsTemplate = [[NSMutableDictionary alloc] init];
        [categoryWithFeedsTemplate setObject:@"Community" forKey:@"Title"];
        
        //Add all of the feed templatates to the array
        
        NSMutableArray *feedTemplates = [[NSMutableArray alloc] init];
        [_template setObject:[feedTemplates copy] forKey:@"categoryTemplates"];
    }
    return _services;
}

- (CategoryWithFeedsTemplate *) housing{
    if(!_community){
        NSMutableDictionary *categoryWithFeedsTemplate = [[NSMutableDictionary alloc] init];
        [categoryWithFeedsTemplate setObject:@"Community" forKey:@"Title"];
        
        //Add all of the feed templatates to the array
        
        NSMutableArray *feedTemplates = [[NSMutableArray alloc] init];
        [_template setObject:[feedTemplates copy] forKey:@"categoryTemplates"];
    }
    return _housing;
}

- (CategoryWithFeedsTemplate *) forSale{
    if(!_community){
        NSMutableDictionary *categoryWithFeedsTemplate = [[NSMutableDictionary alloc] init];
        [categoryWithFeedsTemplate setObject:@"Community" forKey:@"Title"];
        
        //Add all of the feed templatates to the array
        
        NSMutableArray *feedTemplates = [[NSMutableArray alloc] init];
        [_template setObject:[feedTemplates copy] forKey:@"categoryTemplates"];
    }
    return _forSale;
}

- (CategoryWithFeedsTemplate *) events{
    if(!_community){
        NSMutableDictionary *categoryWithFeedsTemplate = [[NSMutableDictionary alloc] init];
        [categoryWithFeedsTemplate setObject:@"Community" forKey:@"Title"];
        
        //Add all of the feed templatates to the array
        
        NSMutableArray *feedTemplates = [[NSMutableArray alloc] init];
        [_template setObject:[feedTemplates copy] forKey:@"categoryTemplates"];
    }
    return _events;
}
*/
@end
