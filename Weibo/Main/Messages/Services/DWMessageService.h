//
//  DWMessageService.h
//  Weibo
//
//  Created by Daniel on 16/4/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWRepostParam;
#import <Foundation/Foundation.h>

@interface DWMessageService : NSObject
/**
 *  获取@我的微博列表
 *
 *  @param param      请求参数
 *  @param completion 回调
 */
+ (void)atMeMessageWithParam:(DWRepostParam *)param completion:(void (^)(NSArray *comments))completion;
/**
 *  获取我发出的评论
 *
 */
+ (void)byMeCommentsWithParam:(DWRepostParam *)param completion:(void (^)(NSArray *comments))completion;
@end
