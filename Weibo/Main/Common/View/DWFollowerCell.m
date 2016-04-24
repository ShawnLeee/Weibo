//
//  DWFollowerCell.m
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWUser.h"
#import <UIImageView+WebCache.h>
#import "DWFollowButton.h"
#import "DWFollowerCell.h"
@interface DWFollowerCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *desc1Label;
@property (weak, nonatomic) IBOutlet UILabel *desc2Label;
@property (weak, nonatomic) IBOutlet DWFollowButton *followBtn;

@end
@implementation DWFollowerCell
- (void)setCardModel:(DWCard *)cardModel
{
    DWUser *user = cardModel.user;
    _cardModel = cardModel;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url]];
    _nameLabel.text = user.screen_name;
    _desc1Label.text = cardModel.desc1;
    _desc2Label.text = cardModel.desc2;
}
- (void)awakeFromNib
{
    _iconView.layer.cornerRadius = 32;
}
@end
