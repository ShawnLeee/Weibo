//
//  DWMeService.h
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWUserInfo,DWCard;
#import "DWBaseService.h"
#import <UIKit/UIKit.h>

@interface DWMeService : DWBaseService
+ (DWMeService *)sharedService;
- (DWUserInfo *)userInfo;
- (UIViewController *)destinatioinControllerWithCard:(DWCard *)card;
@end
