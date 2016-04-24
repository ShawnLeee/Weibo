//
//  DWHomeService.m
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "DWRepostParam.h"
#import "DWStatusDetailParam.h"
#import "DWHomeService.h"
#import "DWHttpTool.h"
#import "DWTimeLineParam.h"
#import <MJExtension/MJExtension.h>
#import "DWWeiboMacros.h"
#import <JSONModel/JSONModel.h>
#import "DWTimeLineModel.h"
#import "DWStatusViewModel.h"
#import "DWCommentParam.h"
@implementation DWHomeService
+ (instancetype)sharedService
{
    static DWHomeService *__homeService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __homeService = [[DWHomeService alloc] init];
    });
    return __homeService;
}
- (RACSignal *)statuesSignalWithParam:(DWTimeLineParam *)timeLineParam
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [DWHttpTool getWithURL:StatusesHomeTimelineURL params:timeLineParam.mj_keyValues success:^(id json) {
            NSError *error = nil;
            DWTimeLineModel *timeLineModel = [[DWTimeLineModel alloc] initWithDictionary:json error:&error];
            NSMutableArray *viewModels = [self statusViewModelsWithTimeLineModel:timeLineModel];
            [subscriber sendNext:viewModels];
        } failure:^(NSError *error) {
            
        }];
        return nil;
    }];
}
- (void)statusesWithParam:(DWTimeLineParam *)timeLineParam completion:(void (^)(NSArray *))completion
{
    [DWHttpTool getWithURL:StatusesHomeTimelineURL params:timeLineParam.mj_keyValues success:^(id json) {
        NSError *error = nil;
        DWTimeLineModel *timeLineModel = [[DWTimeLineModel alloc] initWithDictionary:json error:&error];
        NSMutableArray *viewModels = [self statusViewModelsWithTimeLineModel:timeLineModel];
        if (completion) {
            completion(viewModels);
        }
    } failure:^(NSError *error) {
            
    }];
}
- (RACSignal *)commentStatustWithParam:(DWCommentParam *)commentParam
{
    return  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [DWHttpTool postWithURL:CreateCommentsURL params:commentParam.mj_keyValues success:^(id json) {
            
        } failure:^(NSError *error) {
            
        }];
        return  nil;
    }];
}
- (NSMutableArray *)statusViewModelsWithTimeLineModel:(DWTimeLineModel *)timeLineModel
{
    NSMutableArray *viewModels = [NSMutableArray array];
    [timeLineModel.statuses enumerateObjectsUsingBlock:^(DWStatusModel *statusModel, NSUInteger idx, BOOL * _Nonnull stop) {
        DWStatusViewModel *viewModel = [[DWStatusViewModel alloc] initWithStatusModel:statusModel];
        [viewModels addObject:viewModel];
    }];
    return viewModels;
}
- (void)statusDetailWithParam:(DWStatusDetailParam *)detailParam completion:(void (^)(__autoreleasing id *))completion
{
    [DWHttpTool getWithURL:StatusesShowURL params:detailParam.mj_keyValues success:^(id json) {
        
        } failure:^(NSError *error) {
            
        }];
}
- (void)repostsWithParam:(DWRepostParam *)repostParam completion:(void (^)(NSArray *))completion
{
    [DWHttpTool getWithURL:StatusesRepostTimelineURL params:repostParam.mj_keyValues success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
    NSDictionary *params = @{@"pwd": @"123",@"userName":@"sx"};
    [DWHttpTool postWithURL:@"http://127.0.0.1:8884/login" params:params success:^(id json) {
        
    } failure:^(NSError *error) {
        
    }];
}
@end















