//
//  DWDiscoveryService.m
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWHotWeiboController.h"
#import "DWSwipableViewController.h"
#import "DWChannel.h"
#import <MJExtension/MJExtension.h>
#import "DWCardListInfo.h"
#import "DWCardListHeadCard.h"
#import "DWHotWeibo.h"
#import "DWDiscoveryService.h"
#import "NSDictionary+JSON.h"
@implementation DWDiscoveryService
+ (DWDiscoveryService *)sharedService
{
    static DWDiscoveryService *_sharedService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedService = [[DWDiscoveryService alloc] init];
    });
    return _sharedService;
}
- (DWHotWeibo *)getHotWeibo
{
    NSDictionary *dict = [NSDictionary dictionaryWithLocalJSONFile:@"hotweibo.json"];
    DWHotWeibo *hotweibo = [DWHotWeibo mj_objectWithKeyValues:dict];
    return hotweibo;
}
- (UIViewController *)destinationVCForCard:(DWCard *)card
{
    if ( true) {
        return [self createHotVC];
    }
}
- (UIViewController *)createHotVC
{
    NSMutableArray *vcs = [NSMutableArray array];
    DWHotWeibo *hotweibo = [self getHotWeibo];
    NSArray *channels = [[hotweibo.cardlistInfo.cardlist_head_cards firstObject] channel_list];
    [channels enumerateObjectsUsingBlock:^(DWChannel *channel, NSUInteger idx, BOOL * _Nonnull stop) {
        if (channel.default_add) {
            DWHotWeiboController *vc = [[DWHotWeiboController alloc] initWithStatuses:hotweibo.cards];
            vc.title = channel.name;
            [vcs addObject:vc];
        }
    }];
    DWSwipableViewController *hotvc = [[DWSwipableViewController alloc] initWithViewControllers:vcs];
    return hotvc;
}
@end
