//
//  ColorStripTableViewCell.h
//  C List Tokyo
//
//  Created by Ayodeji Osokoya on 7/26/13.
//  Copyright (c) 2013 inspireology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorStripTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *cellTypeColorIndicator;
@property (weak, nonatomic) IBOutlet UILabel *feedItemTitle;
@property (weak, nonatomic) IBOutlet UILabel *itemSummary;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)setCellTypeColorIndicatorColor:(UIColor *)color;
- (void)setCellTypeColorIndicatorByCategoryName:(NSString *)categoryName;
+ (UIColor *)colorForCategory:(NSString *)categoryName;
@end
