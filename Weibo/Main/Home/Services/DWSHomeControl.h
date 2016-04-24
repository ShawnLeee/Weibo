//
//  DWSHomeControl.h
//  Weibo
//
//  Created by Daniel on 16/4/19.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWStatusViewModel;
#import <Foundation/Foundation.h>
typedef void (^CompletionHandler)();

@interface DWSHomeControl : NSObject

@property (nonatomic,strong,readonly) NSMutableArray<DWStatusViewModel *> *statuses;

- (void)loadNewStatuses:(CompletionHandler)completion;

- (void)loadMoreStatuses:(CompletionHandler)completion;

@end
