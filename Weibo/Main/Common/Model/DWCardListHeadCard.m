//
//  DWCardListHeadCard.m
//  Weibo
//
//  Created by Daniel on 16/3/10.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <MJExtension/MJExtension.h>
#import "DWCardListHeadCard.h"
#import "DWChannel.h"
@implementation DWCardListHeadCard
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"channel_list" :[DWChannel class]};
}
@end
