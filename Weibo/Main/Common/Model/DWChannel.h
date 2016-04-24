//
//  DWChannel.h
//  Weibo
//
//  Created by Daniel on 16/3/10.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWChannel : NSObject
@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *scheme;
@property (nonatomic,copy) NSString *containerid;
@property (nonatomic,assign) NSInteger must_show;
@property (nonatomic,assign) NSInteger default_add;
@property (nonatomic,copy) NSString *type;
@end
