//
//  DWCardListInfo.m
//  Weibo
//
//  Created by Daniel on 16/3/10.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <MJExtension/MJExtension.h>
#import "DWCardListInfo.h"
#import "DWCardListHeadCard.h"
@implementation DWCardListInfo
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"cardlist_head_cards" :[DWCardListHeadCard class]};
}
@end
