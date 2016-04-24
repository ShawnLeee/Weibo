//
//  DWSwapItem.h
//  Weibo
//
//  Created by Daniel on 16/4/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

@interface DWSwapItem : NSObject
@property (nonatomic,copy) NSString *swapTitle;
@property (nonatomic,assign) CGFloat fontSize;
@property (nonatomic,assign,readonly) CGFloat titleWidth;
@end
