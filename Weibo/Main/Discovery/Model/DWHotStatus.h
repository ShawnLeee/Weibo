//
//  DWHotStatus.h
//  Weibo
//
//  Created by Daniel on 16/3/11.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWMBlog;
#import <Foundation/Foundation.h>

@interface DWHotStatus : NSObject
@property (nonatomic,assign) NSInteger card_type;
@property (nonatomic,strong) DWMBlog *mblog;
@property (nonatomic,strong) NSArray *mblog_buttons;
@end
