//
//  DWTimeLineParam.h
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWWeiboBaseParam.h"

@interface DWTimeLineParam : DWWeiboBaseParam
@property (nonatomic,strong) NSNumber *since_id;
@property (nonatomic,strong) NSNumber *max_id;
@property (nonatomic,strong) NSNumber *count;
@property (nonatomic,strong) NSNumber *page;
@property (nonatomic,strong) NSNumber *base_app;
@property (nonatomic,strong) NSNumber *feature;
@property (nonatomic,strong) NSNumber *trim_user;
@end

