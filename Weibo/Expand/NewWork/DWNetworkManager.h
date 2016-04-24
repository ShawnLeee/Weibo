//
//  DWNetworkManager.h
//  Weibo
//
//  Created by Daniel on 16/2/27.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>


@interface DWNetworkManager : AFHTTPRequestOperationManager
+(instancetype)sharedManager;

@end
