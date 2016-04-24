//
//  DWUser.m
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWUser.h"

@implementation DWUser
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"description" : @"introduce"}];
}
@end
