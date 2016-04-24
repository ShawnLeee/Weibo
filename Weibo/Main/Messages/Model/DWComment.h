//
//  DWComment.h
//  Weibo
//
//  Created by Daniel on 16/4/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWUser,DWStatusModel;
#import <Foundation/Foundation.h>

@interface DWComment : NSObject
@property (nonatomic,strong) DWUser *user;
@property (nonatomic,strong) DWStatusModel *status;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,assign) NSInteger source_type;
@property (nonatomic,assign) NSInteger source_allowclick;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *created_at;
@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *idstr;
@property (nonatomic,copy) NSString *mid;

@end
