//
//  DWRetweetedStatusViewModel.h
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWStatusModel;
#import <Foundation/Foundation.h>

@interface DWRetweetedStatusViewModel : NSObject
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,strong) NSArray *pictures;
- (instancetype)initWithStatusModel:(DWStatusModel *)statusModel;
@end
