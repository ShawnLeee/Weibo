//
//  DWStatusModel.h
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWUser;
@protocol DWStatusModel
@end

#import "DWPhoto.h"
#import <JSONModel/JSONModel.h>
@interface DWStatusModel : JSONModel
/**
 *  微博创建时间
 */
@property (nonatomic,copy) NSString *created_at;
/**
 *  微博ID
 */
@property (nonatomic,assign) NSInteger statusId;
/**
 *  微博MID
 */
@property (nonatomic,assign) NSInteger mid;
/**
 *  字符串型的微博ID
 */
@property (nonatomic,copy) NSString *idstr;
/**
 *  微博信息内容
 */
@property (nonatomic,copy) NSString *text;
/**
 *  微博来源
 */
@property (nonatomic,copy) NSString *source;
/**
 *  缩略图片地址，没有时不返回此字段
 */
@property (nonatomic,copy) NSString<Optional> *thumbnail_pic;
/**
 *  中等尺寸图片地址，没有时不返回此字段
 */
@property (nonatomic,copy) NSString<Optional> *bmiddle_pic;
/**
 *  原始图片地址，没有时不返回此字段
 */
@property (nonatomic,copy) NSString<Optional> *original_pic;
/**
 *  微博作者的用户信息字段
 */
@property (nonatomic,strong) DWUser *user;
/**
 *  被转发的原微博信息字段，当该微博为转发微博时返回
 */
@property (nonatomic,strong) DWStatusModel<Optional> *retweeted_status;
/**
 * 	转发数
 */
@property (nonatomic,assign) NSInteger reposts_count;
/**
 *  评论数
 */
@property (nonatomic,assign) NSInteger comments_count;
/**
 *  表态数
 */
@property (nonatomic,assign) NSInteger attitudes_count;
/**
 * 微博配图地址。多图时返回多图链接。无配图返回“[]”
 */
@property (nonatomic, strong) NSArray<DWPhoto> *pic_urls;
@end
