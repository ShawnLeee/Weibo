//
//  DWStatusModel.m
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <MJExtension/MJExtension.h>
#import "DWStatusModel.h"
#import "DWPhoto.h"
@implementation DWStatusModel
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id" : @"statusId"}];
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"pic_urls": [DWPhoto class]};
}
@end
