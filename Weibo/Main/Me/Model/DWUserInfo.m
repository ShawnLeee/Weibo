//
//  DWUserInfo.m
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWUserInfo.h"

@implementation DWUserInfo
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"description" : @"userDescription"}];
}
@end
