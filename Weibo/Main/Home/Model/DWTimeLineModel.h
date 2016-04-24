//
//  DWTimeLineModel.h
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWStatusModel.h"
#import <JSONModel/JSONModel.h>

@interface DWTimeLineModel : JSONModel
@property (nonatomic,assign) BOOL hasvisible;
@property (nonatomic,assign) NSInteger interval;

@property (nonatomic,strong) NSArray<DWStatusModel> *statuses;
@end
