//
//  DWRepostParam.m
//  Weibo
//
//  Created by Daniel on 16/4/5.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWRepostParam.h"

@implementation DWRepostParam
- (instancetype)initWithId:(long long)statusId sinceId:(long long)sinceId max_id:(long long)maxId page:(long long)page
{
    if (self = [super init]) {
    }
    return self;
}
- (instancetype)initWithId:(long long)statusId
{
    if (self = [super init]) {
        _id = [NSNumber numberWithLongLong:statusId];
    }
    return self;
}
@end
