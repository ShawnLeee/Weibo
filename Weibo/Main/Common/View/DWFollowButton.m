//
//  DWFollowButton.m
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#define kImageRatio (0.6)
#import "DWFollowButton.h"

@implementation DWFollowButton
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * kImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}
 -(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * (1- kImageRatio);
    CGFloat titleY = contentRect.size.height * kImageRatio;
    return CGRectMake(0, titleY, titleW, titleH);
}
@end
