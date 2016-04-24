//
//  DWStatusCell.m
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWStatusViewModel.h"
#import "DWStatusCell.h"
#import "DWStatusView.h"
#import "DWRetweetedView.h"
#import "DWTimeLineToolBar.h"
@interface DWStatusCell ()
@property (weak, nonatomic) IBOutlet DWRetweetedView *retweetedView;
@property (weak, nonatomic) IBOutlet DWStatusView *statusView;
@property (nonatomic,weak)  IBOutlet DWTimeLineToolBar *timeLineBar;
@end
@implementation DWStatusCell
- (void)setStatusViewModel:(DWStatusViewModel *)statusViewModel
{
    _statusViewModel = statusViewModel;
    self.statusView.statusViewModel = statusViewModel;
    self.retweetedView.statusViewModel = statusViewModel.retweetedStatusViewModel;
    _timeLineBar.statusViewModel = statusViewModel;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
