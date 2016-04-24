//
//  DWHttpTool.h
//  Weibo
//
//  Created by Daniel on 16/2/27.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWHttpTool : NSObject
+ (void)getWithURL:(NSString *)url
            params:(NSDictionary *)params
           success:(void (^)(id json))success
           failure:(void (^)(NSError *error))failure;
+ (void)postWithURL:(NSString *)url
            params:(NSDictionary *)params
           success:(void (^)(id json))success
           failure:(void (^)(NSError *error))failure;
@end
