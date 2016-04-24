//
//  NSString+Size.h
//  SwipableViewController
//
//  Created by Daniel on 16/3/10.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
//@class UIFont;
@interface NSString (Size)
- (CGSize)sizeForFont:(UIFont *)font maxH:(CGFloat)maxH;
@end
