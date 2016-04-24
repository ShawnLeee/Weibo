//
//  DWMyPhoto.h
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWMBlog;
#import <Foundation/Foundation.h>

@interface DWMyPhoto : NSObject
@property (nonatomic,copy) NSString *pic_small;
@property (nonatomic,copy) NSString *pic_middle;
@property (nonatomic,copy) NSString *pic_big;
@property (nonatomic,strong) DWMBlog *mblog;
@end
