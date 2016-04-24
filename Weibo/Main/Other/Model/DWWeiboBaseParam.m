//
//  DWWeiboBaseParam.m
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWAccount.h"
#import "DWWeiboBaseParam.h"

@implementation DWWeiboBaseParam
- (NSString *)access_token
{
    if (!_access_token) {
        DWAccount *account = [DWAccount getAccount];
        _access_token = [[account access_token] copy];
    }
    return _access_token;
}
@end
