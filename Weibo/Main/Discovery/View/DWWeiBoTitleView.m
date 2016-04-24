//
//  DWWeiBoTitleView.m
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWWeiboTitle.h"
#import "DWWeiBoTitleView.h"

@implementation DWWeiBoTitleView
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}
- (void)setWeiboTitle:(DWWeiboTitle *)weiboTitle
{
    _weiboTitle = weiboTitle;
    [self setTitle:weiboTitle.title_sub forState:UIControlStateNormal];
}

@end
