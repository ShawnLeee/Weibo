//
//  DWDiscoveryService.h
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWBaseService.h"
#import <UIKit/UIKit.h>
@class DWHotWeibo,DWCard;
@interface DWDiscoveryService : DWBaseService
+ (DWDiscoveryService *)sharedService;
- (DWHotWeibo *)getHotWeibo;
- (UIViewController *)destinationVCForCard:(DWCard *)card;

@end
