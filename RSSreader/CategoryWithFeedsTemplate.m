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

- (NSString *)domain{
    if(!_domain) _domain = [[NSString alloc] init];
    return _domain;
}

#pragma mark - Initializors
- (CategoryWithFeedsTemplate *) initWithTitle:(NSString *)title feedDomain:(NSString *)domain forCity:(NSString *)city{
    _city = [city lowercaseString];
    _domain = domain;
    
    
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
    feedURL = [feedURL stringByReplacingOccurrencesOfString:@"{cityName}" withString:self.city];
    feedURL = [feedURL stringByReplacingOccurrencesOfString:@"{domainName}" withString:self.domain];
    
    [tempDictionary setObject:feedURL forKey:@"feedURL"];
    
    [self.temporaryFeedArray addObject:tempDictionary];
    self.feedTemplates = [self.temporaryFeedArray copy];
    return tempDictionary;
}

- (void) jobsTemplateArray{
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/jjj/index.rss" title:@"All Jobs"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/acc/index.rss" title:@"Accounting & Finance"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/ofc/index.rss" title:@"Admin & Office"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/egr/index.rss" title:@"Architecture & Engineering"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/med/index.rss" title:@"Art, Media & Design"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/sci/index.rss" title:@"Biotech & Science"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/bus/index.rss" title:@"Business & Management"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/csr/index.rss" title:@"Customer Service"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/edu/index.rss" title:@"Education"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/fbh/index.rss" title:@"Food, Drink & Hospitality"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/lab/index.rss" title:@"General Labor"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/gov/index.rss" title:@"Government"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/hum/index.rss" title:@"Human Resources"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/eng/index.rss" title:@"Internet Engineers"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/lgl/index.rss" title:@"Legal & Paralegal"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/mnu/index.rss" title:@"Manufacturing"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/mar/index.rss" title:@"Marketing, PR & Advertising"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/hea/index.rss" title:@"Medical & Health"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/npo/index.rss" title:@"Nonprofit Sector"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/rej/index.rss" title:@"Real Estate"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/ret/index.rss" title:@"Retail & Wholesale"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/sls/index.rss" title:@"Sales & Biz Dev"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/spa/index.rss" title:@"Salon, Spas & Fitness"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/sec/index.rss" title:@"Security"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/trd/index.rss" title:@"Skilled Trade & Craft"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/sof/index.rss" title:@"Software, QA & DBA"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/sad/index.rss" title:@"Systems & Network"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/tch/index.rss" title:@"Technical Support"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/trp/index.rss" title:@"Transport"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/tfr/index.rss" title:@"TV, Film & Video"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/web/index.rss" title:@"Web & Information Design"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/wri/index.rss" title:@"Writing & Editing"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/etc/index.rss" title:@"Etc"];
}

- (void) communityTemplateArray{
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/ccc/index.rss" title:@"All Community"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/act/index.rss" title:@"Activities"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/ats/index.rss" title:@"Artists"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/kid/index.rss" title:@"Childcare"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/cls/index.rss" title:@"Classes"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/eve/index.rss" title:@"Events"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/com/index.rss" title:@"General"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/grp/index.rss" title:@"Groups"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/vnn/index.rss" title:@"Local & News"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/laf/index.rss" title:@"Lost+Found"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/muc/index.rss" title:@"Musicians"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/pet/index.rss" title:@"Pets"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/pol/index.rss" title:@"Politics"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/rid/index.rss" title:@"Rideshare"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/vol/index.rss" title:@"Volunteers"];
}

- (void) personalsTemplateArray{
    //TODO Strictly Platonic has more subcategories
    //currently just show all
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/stp/index.rss" title:@"Strictly Platonic"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/w4w/index.rss" title:@"Women Seek Women"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/w4m/index.rss" title:@"Women Seeking Men"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/m4w/index.rss" title:@"Men Seeking Women"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/m4m/index.rss" title:@"Men Seeking Men"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/msr/index.rss" title:@"Misc Romance"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/cas/index.rss" title:@"Casual Encounters"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/mis/index.rss" title:@"Missed Connections"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/rnr/index.rss" title:@"Rants and Raves"];
}

- (void) servicesTemplateArray{
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/bbb/index.rss" title:@"All Services"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/bts/index.rss" title:@"Beauty"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/cps/index.rss" title:@"Computer"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/crs/index.rss" title:@"Creative"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/cys/index.rss" title:@"Cycle"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/evs/index.rss" title:@"Event"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/fns/index.rss" title:@"Financial"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/lgs/index.rss" title:@"Legal"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/lss/index.rss" title:@"Lessons"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/mas/index.rss" title:@"Marine"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/pas/index.rss" title:@"Pets"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/aos/index.rss" title:@"Automotive"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/fgs/index.rss" title:@"Farm & Garden"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/hss/index.rss" title:@"Household"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/lbs/index.rss" title:@"Labor/move"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/rts/index.rss" title:@"Real Estate"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/sks/index.rss" title:@"Skilled Trade"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/biz/index.rss" title:@"Buisniess Ads"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/ths/index.rss" title:@"Therapeutic"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/trv/index.rss" title:@"Travel/vac"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/wet/index.rss" title:@"Write/Ed/Tr8"];
}

- (void) forSaleTemplateArray{
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/sss/index.rss" title:@"All For Sale"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/ata/index.rss" title:@"Antiques"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/baa/index.rss" title:@"Baby & Kids"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/bar/index.rss" title:@"Barter"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/bia/index.rss" title:@"Bikes"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/boo/index.rss" title:@"Boats"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/bka/index.rss" title:@"Books"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/bfa/index.rss" title:@"Business"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/sya/index.rss" title:@"Computer"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/zip/index.rss" title:@"Free"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/foa/index.rss" title:@"General"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/hsa/index.rss" title:@"Household"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/jwa/index.rss" title:@"Jewelry"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/maa/index.rss" title:@"Materials"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/rva/index.rss" title:@"Rvs"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/sga/index.rss" title:@"Sporting"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/tia/index.rss" title:@"Tickets"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/tla/index.rss" title:@"Tools"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/wan/index.rss" title:@"Wanted"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/ppa/index.rss" title:@"Appliances"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/ara/index.rss" title:@"Arts & Crafts"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/pta/index.rss" title:@"Auto Parts"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/haa/index.rss" title:@"Beauty & Hlth"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/cta/index.rss" title:@"Cars & Trucks"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/ema/index.rss" title:@"CDs/DVD/VHS"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/moa/index.rss" title:@"Cell Phones"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/cla/index.rss" title:@"Clothes & Accessories"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/cba/index.rss" title:@"Collectibles"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/ela/index.rss" title:@"Electronics"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/gra/index.rss" title:@"Farm & Garden"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/fua/index.rss" title:@"Furniture"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/gms/index.rss" title:@"Garage Sale"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/mca/index.rss" title:@"Motorcycles"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/msa/index.rss" title:@"Musical Instruments"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/pha/index.rss" title:@"Photo & Video"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/taa/index.rss" title:@"Toys & Games"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/vga/index.rss" title:@"Video Gaming"];
}

- (void) housingTemplateArray{
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/hhh/index.rss" title:@"All Housing"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/apa/index.rss" title:@"Housing, Apartments"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/swp/index.rss" title:@"Housing Swap"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/hsw/index.rss" title:@"Housing Wanted"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/off/index.rss" title:@"Office, Commercial"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/prk/index.rss" title:@"Parking, Storage"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/rea/index.rss" title:@"Real Estate For Sale"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/roo/index.rss" title:@"Rooms, Shared"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/sub/index.rss" title:@"Sublets, Temporary"];
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/vac/index.rss" title:@"Vacation Rentals"];
}

- (void) eventsTemplateArray{
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/eve/index.rss" title:@"Events"];
}

- (void) resumesTemplateArray{
    [self feedTemplateWithURL:@"http://{cityName}.craigslit.jp/res/index.rss" title:@"Resumes"];
}

- (void) parttimeTemplateArray{
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/search/jjj?addFour=part-time/index.rss" title:@"Part Time"];
}

- (void) gigsTemplateArray{
    [self feedTemplateWithURL:@"http://{cityName}.{domainName}/ggg/index.rss" title:@"Gigs"];
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
