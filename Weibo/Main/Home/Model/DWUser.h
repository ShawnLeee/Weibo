//
//  DWUser.h
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <JSONModel/JSONModel.h>

@interface DWUser : JSONModel
/**
 *  字符串型的用户UID
 */
@property (nonatomic,copy) NSString *idstr;
/**
 *  用户昵称
 */
@property (nonatomic,copy) NSString *screen_name;
/**
 *  用户个人描述
 */
@property (nonatomic,copy) NSString *introduce;
/**
 *  用户头像地址（中图），50×50像素
 */
@property (nonatomic,copy) NSString *profile_image_url;
/**
 *  用户头像地址（高清），高清头像原图
 */
@property (nonatomic,copy) NSString *avatar_hd;
/**
 *  用户头像地址（大图），180×180像素
 */
@property (nonatomic,copy) NSString *avatar_large;
/**
 *  性别，m：男、f：女、n：未知
 */
@property (nonatomic,copy) NSString *gender;
/**
 *  粉丝数
 */
@property (nonatomic,assign) NSInteger followers_count;
/**
 *  关注数
 */
@property (nonatomic,assign) NSInteger friends_count;
/**
 *  微博数
 */
@property (nonatomic,assign) NSInteger statuses_count;
/**
 *  收藏数
 */
@property (nonatomic,assign) NSInteger favourites_count;
/**
 *  用户创建（注册）时间
 */
@property (nonatomic,copy) NSString *created_at;
@end
