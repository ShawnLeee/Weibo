//
//  DWNetworkManager.m
//  Weibo
//
//  Created by Daniel on 16/2/27.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWNetworkManager.h"

#define DW_WEIBO_BASE_URL @"https://api.weibo.com/2/"

static NSString *const DWWeiboApiBaseURL = DW_WEIBO_BASE_URL;

@implementation DWNetworkManager
+ (instancetype)sharedManager
{
    static DWNetworkManager *_sharedManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[DWNetworkManager alloc] initWithBaseURL:[NSURL URLWithString: DWWeiboApiBaseURL]];
    });
    
    return _sharedManager;
}
@end
