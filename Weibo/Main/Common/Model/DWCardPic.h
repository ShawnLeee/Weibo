//
//  DWCardPic.h
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWActionLog;
#import <Foundation/Foundation.h>

@interface DWCardPic : NSObject
@property (nonatomic,copy) NSString *pic;
@property (nonatomic,copy) NSString *scheme;
@property (nonatomic,copy) NSString *content1;
@property (nonatomic,copy) NSString *pic_big;
@property (nonatomic,strong) DWActionLog *actionlog;
@end
