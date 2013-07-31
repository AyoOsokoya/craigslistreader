//
//  ColorStripTableViewCell.m
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 7/26/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import "ColorStripTableViewCell.h"

@implementation ColorStripTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Accessors
//Assign a custom color to the cell
- (void)setCellTypeColorIndicatorColor:(UIColor *)color{
    self.cellTypeColorIndicator.backgroundColor = color;
}

- (void)setCellTypeColorIndicatorByCategoryName:(NSString *)categoryName{
    self.cellTypeColorIndicator.backgroundColor = [ColorStripTableViewCell colorForCategory:categoryName];
}

+ (UIColor *)colorForCategory:(NSString *)categoryName{
    UIColor *color = [[UIColor alloc] init];
    
    if([categoryName isEqualToString:@"Community"]) {
        color = [UIColor colorWithHue:0.1 saturation:0.5 brightness:1 alpha:1];
    } else if([categoryName isEqualToString:@"Peronsals"]){
        color = [UIColor colorWithHue:0.2 saturation:0.5 brightness:1 alpha:1];
    } else if([categoryName isEqualToString:@"Services"]){
        color = [UIColor colorWithHue:0.3 saturation:0.5 brightness:1 alpha:1];
    } else if([categoryName isEqualToString:@"Housing"]){
        color = [UIColor colorWithHue:0.5 saturation:0.5 brightness:1 alpha:1];
    } else if([categoryName isEqualToString:@"For Sale"]){
        color = [UIColor colorWithHue:0.5 saturation:0.5 brightness:1 alpha:1];
    } else if([categoryName isEqualToString:@"Resumes"]){
        color = [UIColor colorWithHue:0.6 saturation:0.5 brightness:1 alpha:1];
    } else if([categoryName isEqualToString:@"Jobs"]){
        color = [UIColor colorWithHue:0.7 saturation:0.5 brightness:1 alpha:1];
    } else if([categoryName isEqualToString:@"Gigs"]){
        color = [UIColor colorWithHue:0.8 saturation:0.5 brightness:1 alpha:1];
    } else if([categoryName isEqualToString:@"Events"]){
        color = [UIColor colorWithHue:0.9 saturation:0.5 brightness:1 alpha:1];
    } else {
        color = [UIColor colorWithHue:1 saturation:1 brightness:0 alpha:0.5];
        
    }
    
    return color;
}

@end
