//
//  UILabel+Config.m
//  Weibo
//
//  Created by Daniel on 16/4/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "UILabel+Config.h"

@implementation UILabel (Config)

+ (UILabel *)labelWithFontSize:(CGFloat)fontSize textColor:(UIColor *)color alignment:(NSTextAlignment)alignment;
{
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = alignment;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}
+ (UILabel *)labelWithFontSize:(CGFloat)fontSize textColor:(UIColor *)color
{
    return [self labelWithFontSize:fontSize textColor:color alignment:NSTextAlignmentLeft];
}
@end
