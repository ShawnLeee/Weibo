//
//  DWActionLog.h
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWActionLog : NSObject
@property (nonatomic,assign) NSInteger act_type;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *data;
@property (nonatomic,copy) NSString *module;
@end
