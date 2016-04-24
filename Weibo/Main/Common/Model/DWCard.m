//
//  DWCard.m
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWCardPic.h"
#import "DWCard.h"
#import <MJExtension/MJExtension.h>
#import "DWWeiboTitle.h"
#import "DWMyPhoto.h"
@implementation DWCard
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"pic_items" : [DWCardPic class],@"group" : [DWWeiboTitle class]};
}
@end
