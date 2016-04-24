//
//  UIButton+Config.h
//  Weibo
//
//  Created by Daniel on 16/4/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Config)
- (void)setNormalImage:(NSString *)normal highlightImage:(NSString *)highlight selectedImage:(NSString *)selectedImage;
- (void)setNormalImage:(NSString *)normal highlightImage:(NSString *)highlight;
@end
