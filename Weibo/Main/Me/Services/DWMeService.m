//
//  DWMeService.m
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWMeService.h"
#import "DWUserInfo.h"
#import "NSDictionary+JSON.h"
#import "DWCard.h"
#import "DWNewFriendsController.h"
#import "DWMyPhotoController.h"
@implementation DWMeService
+ (DWMeService *)sharedService
{
    static DWMeService *_sharedService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedService = [[DWMeService alloc] init];
    });
    return _sharedService;
}
- (DWUserInfo *)userInfo
{
    
    NSDictionary *dict = [NSDictionary dictionaryWithLocalJSONFile:@"me.json"];
    NSError *error = nil;
    DWUserInfo *userInfo = [[DWUserInfo alloc] initWithDictionary:dict[@"userInfo"] error:&error];
    return userInfo;
}
- (UIViewController *)destinatioinControllerWithCard:(DWCard *)card
{
    if ([card.desc1 isEqualToString:@"新的好友"]) {
        DWNewFriendsController *newVC = [[DWNewFriendsController alloc] init];
        return newVC;
    }
    if ([card.desc isEqualToString:@"我的相册"]) {
        DWMyPhotoController *myphotoVC = [[DWMyPhotoController alloc] init];
        return myphotoVC;
    }
    return [UIViewController new];
}
@end
