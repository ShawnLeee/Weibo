//
//  DWCommand.m
//  Weibo
//
//  Created by Daniel on 16/3/26.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWCommand.h"
@interface DWCommand ()
@property (nonatomic,copy) DWCommandComsumBlk consumHandler;
@end
@implementation DWCommand
- (instancetype)initWithComsumhandler:(DWCommandComsumBlk)consumHandler
{
    return  [self initWithComsumhandler:consumHandler cancelHandler:nil];
}
- (instancetype)initWithComsumhandler:(DWCommandComsumBlk)consumHandler cancelHandler:(DWCommandCancelBlk)cancelHandler
{
    if (self = [super init]) {
        _consumHandler = [consumHandler copy];
    }
    return self;
}
- (void)execute:(id)input
{
    _consumHandler(input,nil);
}
- (void)cancel
{
    
}
@end
