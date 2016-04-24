//
//  DWCardCell.h
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DWCard;

@interface DWCardCell : NSObject
+ (UITableViewCell *)cellWithTableView:(UITableView *)tableView cardModel:(DWCard *)card;
@end
