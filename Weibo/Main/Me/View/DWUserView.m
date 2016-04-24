//
//  DWUserView.m
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <UIImageView+WebCache.h>
#import "DWUserView.h"
#import "DWUserInfo.h"
@interface DWUserView ()
@property (nonatomic,weak) IBOutlet UIImageView *iconView;
@property (nonatomic,weak)  IBOutlet UILabel *userNameLabel;
@property (nonatomic,weak)  IBOutlet UILabel *userDescLabel;
@property (nonatomic,weak)  IBOutlet UIImageView *vipView;
@property (nonatomic,strong) DWUserInfo *userInfo;
@end
@implementation DWUserView
+ (DWUserView *)userViewWithInfo:(DWUserInfo *)userInfo
{
    DWUserView *userView = nil;
    userView =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DWUserView class]) owner:nil options:nil] lastObject];
    userView.userInfo = userInfo;
    return userView;
}
- (void)setUserInfo:(DWUserInfo *)userInfo
{
    _userInfo = userInfo;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:userInfo.profile_image_url]];
    self.userNameLabel.text = userInfo.name;
    self.userDescLabel.text = [NSString stringWithFormat:@"简介:%@",userInfo.userDescription];
}
- (void)awakeFromNib
{
    self.iconView.layer.cornerRadius = 25;
}
@end
