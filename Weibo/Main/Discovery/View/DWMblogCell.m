//
//  DWMblogCell.m
//  Weibo
//
//  Created by Daniel on 16/3/11.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWHotweiboTag.h"
#import "DWMblogCell.h"
#import "DWMBlog.h"
#import "DWUser.h"
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
@interface DWMblogCell ()
@property (nonatomic,weak)  IBOutlet UIImageView *iconView;
@property (nonatomic,weak)  IBOutlet UILabel *nameLabel;
@property (nonatomic,weak)  IBOutlet UIButton *actBtn;
@property (nonatomic,weak)  IBOutlet UILabel *sourceLabel;
@property (nonatomic,weak)  IBOutlet UILabel *createdAtLabel;
@property (nonatomic,weak)  IBOutlet UILabel *blogLabel;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tagBtns;
@end
@implementation DWMblogCell
- (void)setMblog:(DWMBlog *)mblog
{
    _mblog = mblog;
    DWUser *user = mblog.user;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url]];
    _nameLabel.text = user.screen_name;
    _blogLabel.text = mblog.text;
    _sourceLabel.text = mblog.source;
    _createdAtLabel.text = mblog.created_at;
    [self _setHotWeiboTagButton];
}
- (void)_setHotWeiboTagButton
{
    [_mblog.hot_weibo_tags enumerateObjectsUsingBlock:^(DWHotweiboTag *hottag, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < _tagBtns.count) {
            UIButton *button = self.tagBtns[idx];
            [button setTitle:hottag.tag_name forState:UIControlStateNormal];
            [button sd_setImageWithURL:[NSURL URLWithString:hottag.url_type_pic] forState:UIControlStateNormal];
        }
        
    }];
    [self.tagBtns enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx >= _mblog.hot_weibo_tags.count) {
            button.hidden = YES;
        }else
        {
            button.hidden = NO;
        }
    }];
    [self.stackView layoutIfNeeded];
    [self layoutIfNeeded];
}
- (void)awakeFromNib
{
    _iconView.layer.cornerRadius = 18;
}
@end
