//
//  DWRepostParam.h
//  Weibo
//
//  Created by Daniel on 16/4/5.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWWeiboBaseParam.h"

@interface DWRepostParam : DWWeiboBaseParam
@property (nonatomic,strong) NSNumber *id;
@property (nonatomic,strong) NSNumber *since_id;
@property (nonatomic,strong) NSNumber *max_id;
@property (nonatomic,strong) NSNumber *count;
@property (nonatomic,strong) NSNumber *page;
@property (nonatomic,strong) NSNumber *filter_by_author;
- (instancetype)initWithId:(long long)statusId;
- (instancetype)initWithId:(long long)statusId
                   sinceId:(long long)sinceId
                    max_id:(long long)maxId
                      page:(long long)page;

@end
