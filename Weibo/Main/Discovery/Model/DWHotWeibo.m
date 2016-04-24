//
//  DWHotWeibo.m
//  Weibo
//
//  Created by Daniel on 16/3/10.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <MJExtension/MJExtension.h>
#import "DWHotWeibo.h"
#import "DWHotStatus.h"
@implementation DWHotWeibo
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"cards" : [DWHotStatus class]};
}
@end
