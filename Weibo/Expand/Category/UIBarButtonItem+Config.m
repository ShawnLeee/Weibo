//
//  UIBarButtonItem+Config.m
//  Weibo
//
//  Created by Daniel on 16/4/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "UIButton+Config.h"
#import "UIBarButtonItem+Config.h"

@implementation UIBarButtonItem (Config)
+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlightImage:(NSString *)hightlightImage title:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setNormalImage:image highlightImage:hightlightImage];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 60, 30);
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 63, 33)];
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, 14, 0);
    [backButtonView addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
}
@end
