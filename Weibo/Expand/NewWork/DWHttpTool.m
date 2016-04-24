//
//  DWHttpTool.m
//  Weibo
//
//  Created by Daniel on 16/2/27.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWNetworkManager.h"
#import "DWHttpTool.h"

@implementation DWHttpTool
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    DWNetworkManager *dwnetworkerManager = [DWNetworkManager sharedManager];
    [dwnetworkerManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [dwnetworkerManager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    DWNetworkManager *dwnetworkerManager = [DWNetworkManager sharedManager];
    [dwnetworkerManager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
