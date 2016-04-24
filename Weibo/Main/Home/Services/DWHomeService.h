//
//  DWHomeService.h
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class RACSignal,DWTimeLineParam,DWCommentParam,DWStatusDetailParam,DWRepostParam;
#import <Foundation/Foundation.h>

@interface DWHomeService : NSObject
+ (instancetype)sharedService;
- (RACSignal *)statuesSignalWithParam:(DWTimeLineParam *)timeLineParam;
- (RACSignal *)commentStatustWithParam:(DWCommentParam *)commentParam;
- (void)statusesWithParam:(DWTimeLineParam *)timeLineParam completion:(void (^)(NSArray *statues))completion;
- (void)statusDetailWithParam:(DWStatusDetailParam *)detailParam completion:(void (^)(id *statues))completion;
- (void)repostsWithParam:(DWRepostParam *)repostParam completion:(void (^)(NSArray *reposts))completion;
@end
