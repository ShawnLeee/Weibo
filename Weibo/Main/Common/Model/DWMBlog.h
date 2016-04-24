//
//  DWMBlog.h
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWUser;
#import <Foundation/Foundation.h>

@interface DWMBlog : NSObject
@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *mid;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *scheme;
@property (nonatomic,copy) NSString *created_at;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,assign) NSInteger favorited;
@property (nonatomic,strong) DWUser *user;
@property (nonatomic,assign) NSInteger reposts_count;
@property (nonatomic,assign) NSInteger comments_count;
@property (nonatomic,assign) NSInteger attitudes_count;
@property (nonatomic,assign) NSInteger isLongText;
@property (nonatomic,strong) NSArray *hot_weibo_tags;
@property (nonatomic,strong) NSArray *buttons;
@end
