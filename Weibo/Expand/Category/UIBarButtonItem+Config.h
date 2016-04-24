//
//  UIBarButtonItem+Config.h
//  Weibo
//
//  Created by Daniel on 16/4/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Config)
+ (UIBarButtonItem *)itemWithImage:(NSString *)image
                    highlightImage:(NSString *)hightlightImage
                             title:(NSString *)title
                            target:(id)target
                            action:(SEL)action;
@end
