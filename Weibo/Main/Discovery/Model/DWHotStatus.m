//
//  DWHotStatus.m
//  Weibo
//
//  Created by Daniel on 16/3/11.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <MJExtension/MJExtension.h>
#import "DWHotStatus.h"
#import "DWStatusBtnModel.h"

@implementation DWHotStatus
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"mblog_buttons":[DWStatusBtnModel class]};
}
@end
