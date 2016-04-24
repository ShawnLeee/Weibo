//
//  DWStatusUserView.m
//  Weibo
//
//  Created by Daniel on 16/4/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWComment.h"
#import "DWStatusUserView.h"
#import "DWUser.h"
#import <UIImageView+WebCache.h>
#import "UILabel+Config.h"
#import "UIButton+Config.h"
#define kNameLabelFontSize 16
#define kCreateLabelFontSize 12
#define kSourceLabelFontSize 12
#define kUserIconWidthAndHeight 35
#define HorizontalMargin 8
#define VerticalMargin 2
#define MoreButtonWH 20
#define NameLabelHeight 20
@interface DWStatusUserView()
@property (nonatomic,strong)  UIImageView *userIconView;
@property (nonatomic,strong)  UILabel     *nameLabel;
@property (nonatomic,strong)  UILabel     *createdLabel;
@property (nonatomic,strong)  UILabel     *sourceLabel;
@property (nonatomic,strong)  UIButton    *moreButton;

@property (nonatomic,strong) DWUser *user;
@end
@implementation DWStatusUserView
- (instancetype)init
{
    if (self = [super init]) {
        [self p_setupUIComponents];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self p_setupUIComponents];
    }
    return self;
}
- (void)p_setupUIComponents
{
    _userIconView = [[UIImageView alloc] init];
    _userIconView.contentMode = UIViewContentModeScaleAspectFit;
    _userIconView.layer.cornerRadius = kUserIconWidthAndHeight/2;
    _userIconView.clipsToBounds = YES;
    
    _nameLabel = [UILabel labelWithFontSize:kNameLabelFontSize textColor:[UIColor blackColor] alignment:NSTextAlignmentLeft];
    
    _createdLabel = [UILabel labelWithFontSize:kCreateLabelFontSize textColor:[UIColor lightGrayColor] alignment:NSTextAlignmentLeft];
    
    _sourceLabel =  [UILabel labelWithFontSize:kSourceLabelFontSize textColor:[UIColor lightGrayColor] alignment:NSTextAlignmentLeft];
    
    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreButton setNormalImage:@"timeline_icon_more" highlightImage:@"timeline_icon_more_highlighted"];
    
    [self addSubview:_userIconView];
    [self addSubview:_nameLabel];
    [self addSubview:_createdLabel];
    [self addSubview:_sourceLabel];
    [self addSubview:_moreButton];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    //Setup UIComponents Frame
    //iconView
    _userIconView.frame = CGRectMake(0, 0, kUserIconWidthAndHeight, kUserIconWidthAndHeight);
    
    //nameLabel
    CGFloat nameX = CGRectGetMaxX(_userIconView.frame) + HorizontalMargin;
    CGFloat nameY = _userIconView.frame.origin.y;
    CGFloat nameW = self.frame.size.width - nameX - HorizontalMargin - MoreButtonWH;
    CGFloat nameH = NameLabelHeight;
    _nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    //createLabel
    CGFloat createX = nameX;
    CGFloat createY = CGRectGetMaxY(_nameLabel.frame) + VerticalMargin;
    CGFloat createW = 80;
    CGFloat createH = 20;
    _createdLabel.frame = CGRectMake(createX, createY, createW, createH);
    
    //source
    CGFloat sourceX = CGRectGetMaxX(_createdLabel.frame) + HorizontalMargin/2;
    CGFloat sourceY = _createdLabel.frame.origin.y;
    CGFloat sourceW = self.frame.size.width - CGRectGetMaxX(_createdLabel.frame) - HorizontalMargin - MoreButtonWH;
    CGFloat sourceH = createH;
    _sourceLabel.frame = CGRectMake(sourceX, sourceY, sourceW, sourceH);
    
    //MoreButton
    CGFloat buttonX = CGRectGetMaxX(_nameLabel.frame) + HorizontalMargin;
    CGFloat buttonY = _nameLabel.frame.origin.y;
    CGFloat buttonW = MoreButtonWH;
    CGFloat buttonH = MoreButtonWH;
    _moreButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    
}
#pragma mark - Public Method
- (void)configureWithComment:(DWComment *)comment
{
    [self configureWithUser:comment.user];
    _createdLabel.text = comment.created_at;
    _sourceLabel.text = comment.source;
}
- (void)configureWithUser:(DWUser *)user
{
    self.user = user;
    
    [_userIconView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:nil];
    _nameLabel.text = user.screen_name;
    
}
@end
