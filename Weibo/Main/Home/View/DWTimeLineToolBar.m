//
//  DWTimeLineToolBar.m
//  Weibo
//
//  Created by Daniel on 16/3/27.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWStatusViewModel.h"
#import "DWTimeLineToolBar.h"
#import "DWCommand.h"
@interface DWTimeLineToolBar ()
@property (nonatomic,weak)  IBOutlet UIButton  *retweetBtn;
@property (nonatomic,weak)  IBOutlet UIButton  *commentBtn;
@property (nonatomic,weak)  IBOutlet UIButton  *likeBtn;
@end
@implementation DWTimeLineToolBar
- (void)awakeFromNib
{
    _retweetBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    _commentBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    _likeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
}
- (void)setStatusViewModel:(DWStatusViewModel *)statusViewModel
{
    _statusViewModel = statusViewModel;
    [_retweetBtn setTitle:statusViewModel.reposts_count forState:UIControlStateNormal];
    [_commentBtn setTitle:statusViewModel.comments_count forState:UIControlStateNormal];
    [_likeBtn setTitle:statusViewModel.attitudes_count forState:UIControlStateNormal];
}
- (IBAction)likeBtnClicked
{
    [_statusViewModel.likeCommand execute:_statusViewModel.statusId];
}
@end
