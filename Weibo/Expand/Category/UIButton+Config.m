//
//  UIButton+Config.m
//  Weibo
//
//  Created by Daniel on 16/4/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "UIButton+Config.h"

@implementation UIButton (Config)
- (void)setNormalImage:(NSString *)normal highlightImage:(NSString *)highlight selectedImage:(NSString *)selectedImage
{
    if (normal) {
        [self setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    }
    if (highlight) {
        [self setImage:[UIImage imageNamed:highlight] forState:UIControlStateHighlighted];
    }
    if (selectedImage) {
        [self setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    }
}
- (void)setNormalImage:(NSString *)normal highlightImage:(NSString *)highlight
{
    [self setNormalImage:normal highlightImage:highlight selectedImage:nil];
}
@end
