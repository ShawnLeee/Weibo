//
//  UILabel+Config.h
//  Weibo
//
//  Created by Daniel on 16/4/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Config)
+ (UILabel *)labelWithFontSize:(CGFloat)fontSize textColor:(UIColor *)color;
+ (UILabel *)labelWithFontSize:(CGFloat)fontSize textColor:(UIColor *)color alignment:(NSTextAlignment)alignment;
@end
