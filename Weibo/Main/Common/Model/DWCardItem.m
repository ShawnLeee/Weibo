//
//  DWCard.m
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <MJExtension/MJExtension.h>
#import "DWCardItem.h"
#import "DWCard.h"
#import "DWMyPhoto.h"
@implementation DWCardItem
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"card_group" : [DWCard class],@"pics" :[DWMyPhoto class] };
}
@end
