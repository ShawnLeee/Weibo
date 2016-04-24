//
//  DWStatusViewModel.h
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWStatusModel,DWRetweetedStatusViewModel,DWCommand,DWStatusDetailParam;
#import <Foundation/Foundation.h>

@interface DWStatusViewModel : NSObject
/**
 * 	转发数
 */
@property (nonatomic,copy) NSString *reposts_count;
/**
 *  评论数
 */
@property (nonatomic,copy) NSString *comments_count;
/**
 *  表态数
 */
@property (nonatomic,copy) NSString *attitudes_count;

@property (nonatomic,strong) NSURL *userIconURL;
/**
 *  用户名
 */
@property (nonatomic,copy) NSString *userName;
/**
 *  用户图标
 */
@property (nonatomic,copy) NSString *userIcon;
/**
 *  微博创建时间
 */
@property (nonatomic,copy) NSString *createdTime;
/**
 *  微博来源
 */
@property (nonatomic,copy) NSString *source;
/**
 *  微博正文
 */
@property (nonatomic,copy) NSString *text;
/**
 *  微博配图
 */
@property (nonatomic,strong) NSArray *pictures;
/**
 *  转发微博
 */
@property (nonatomic,copy) NSString *statusId;
@property (nonatomic,strong) DWRetweetedStatusViewModel *retweetedStatusViewModel;
@property (nonatomic,strong) DWCommand *likeCommand;
- (instancetype)initWithStatusModel:(DWStatusModel *)statusModel;
- (DWStatusDetailParam *)statusDetailParam;
@end
