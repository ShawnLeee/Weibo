//
//  NSString+Size.m
//  SwipableViewController
//
//  Created by Daniel on 16/3/10.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "NSString+Size.h"

@implementation NSString (Size)
- (CGSize)sizeForFont:(UIFont *)font maxH:(CGFloat)maxH
{
    NSDictionary *attributes = @{NSFontAttributeName : font};
    CGSize maxSize = CGSizeMake(MAXFLOAT, maxH);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}
@end
