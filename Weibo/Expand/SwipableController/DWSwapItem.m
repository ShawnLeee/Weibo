//
//  DWSwapItem.m
//  Weibo
//
//  Created by Daniel on 16/4/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "NSString+Size.h"
#import "DWSwapItem.h"
@interface DWSwapItem ()
@property (nonatomic,assign,readwrite) CGFloat titleWidth;
@end
@implementation DWSwapItem
- (void)setSwapTitle:(NSString *)swapTitle
{
    _swapTitle = [swapTitle copy];
}
- (CGSize)titleLabelSize
{
    CGSize size = [_swapTitle sizeForFont:[UIFont systemFontOfSize:_fontSize] maxH:20];
    return size;
}
@end
