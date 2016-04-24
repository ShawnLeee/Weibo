//
//  DWBaseService.m
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <MJExtension/MJExtension.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "DWCardItem.h"
#import "NSDictionary+JSON.h"
#import "DWBaseService.h"

@implementation DWBaseService
- (RACSignal *)cardsDataWithJSONFileName:(NSString *)fileName
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary *dict = [NSDictionary dictionaryWithLocalJSONFile:fileName];
        if (dict) {
            NSArray *cards = [DWCardItem mj_objectArrayWithKeyValuesArray:dict[@"cards"]];
            [subscriber sendNext:cards];
            [subscriber sendCompleted];
        }
        return nil;
    }];
}
@end
