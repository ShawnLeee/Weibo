//
//  DWSHomeControl.m
//  Weibo
//
//  Created by Daniel on 16/4/19.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <MJExtension/MJExtension.h>
#import "DWStatusViewModel.h"
#import "DWSHomeControl.h"
#import "DWTimeLineParam.h"
#import "DWHttpTool.h"
#import "DWTimeLineModel.h"
#import "DWWeiboMacros.h"
@interface DWSHomeControl()

@property (nonatomic,strong,readwrite) NSMutableArray<DWStatusViewModel *> *statuses;

@end
@implementation DWSHomeControl
- (NSMutableArray<DWStatusViewModel *> *)statuses
{
    if (!_statuses) {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}

- (void)loadStatusWithParam:(DWTimeLineParam *)timeLineParam completion:(void (^)(NSArray *newViewModels))completion
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
- (void)loadNewStatuses:(CompletionHandler)completion
{
    DWTimeLineParam *param = [DWTimeLineParam new];
    
    
    if (self.statuses.count > 0) {
        DWStatusViewModel *firstViewModel = [self.statuses firstObject];
        NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        param.since_id = [numberFormatter numberFromString:firstViewModel.statusId];
    }
    
    [self loadStatusWithParam:param completion:^(NSArray *newViewModels) {
        
        if (self.statuses.count > 0) {
            NSMutableArray *tmp = [NSMutableArray new];
            [tmp addObjectsFromArray:newViewModels];
            [tmp addObjectsFromArray:self.statuses];
            self.statuses = tmp;
        }else
        {
            [self.statuses addObjectsFromArray:newViewModels];
        }
        
        completion();
        
    }];
}
- (void)loadMoreStatuses:(CompletionHandler)completion
{
    DWTimeLineParam *param = [DWTimeLineParam new];
    if (self.statuses.count > 0) {
        DWStatusViewModel *lastViewModel = [self.statuses lastObject];
        NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        param.max_id = [numberFormatter numberFromString:lastViewModel.statusId];
    }
    
    [self loadStatusWithParam:param completion:^(NSArray *newViewModels) {
        [self.statuses addObjectsFromArray:newViewModels];
        completion();
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
@end
