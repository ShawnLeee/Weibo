//
//  DWStatusCell.h
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWStatusViewModel;
#import <UIKit/UIKit.h>

@interface DWStatusCell : UITableViewCell
@property (nonatomic,strong) DWStatusViewModel *statusViewModel;
@end
