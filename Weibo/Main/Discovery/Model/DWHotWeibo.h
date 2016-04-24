//
//  DWHotWeibo.h
//  Weibo
//
//  Created by Daniel on 16/3/10.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWCardListInfo,DWHotStatus;
#import <Foundation/Foundation.h>

@interface DWHotWeibo : NSObject
@property (nonatomic,strong) DWCardListInfo *cardlistInfo;
@property (nonatomic,strong) NSArray *cards;
@end
