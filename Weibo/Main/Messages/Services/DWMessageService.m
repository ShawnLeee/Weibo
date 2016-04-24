//
//  DWMessageService.m
//  Weibo
//
//  Created by Daniel on 16/4/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <MJExtension/MJExtension.h>
#import "DWHttpTool.h"
#import "DWWeiboMacros.h"
#import "DWMessageService.h"
#import "DWRepostParam.h"
#import "DWComment.h"

@implementation DWMessageService
+ (void)atMeMessageWithParam:(DWRepostParam *)param completion:(void (^)(NSArray *))completion
{
    [DWHttpTool getWithURL:MentionsCommnentsURL params:param.mj_keyValues success:^(id json) {
        if (completion) {
            NSArray *comments = [DWComment mj_objectArrayWithKeyValuesArray:json[@"comments"]];
            completion(comments);
        }
    } failure:^(NSError *error) {
        
    }];
}
+ (void)byMeCommentsWithParam:(DWRepostParam *)param completion:(void (^)(NSArray *))completion
{
    [DWHttpTool getWithURL:ToMeCommentsURL params:param.mj_keyValues success:^(id json) {
        if (completion) {
            NSArray *comments = [DWComment mj_objectArrayWithKeyValuesArray:json[@"comments"]];
            completion(comments);
        }
    } failure:^(NSError *error) {
        
    }];
}
@end
