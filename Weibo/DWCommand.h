//
//  DWCommand.h
//  Weibo
//
//  Created by Daniel on 16/3/26.
//  Copyright © 2016年 Daniel. All rights reserved.
//

typedef void (^DWCommandCompletionBlk)(id error,id content);
typedef void (^DWCommandComsumBlk)(id input,DWCommandCompletionBlk completionHandler);
typedef void (^DWCommandCancelBlk)();

#import <Foundation/Foundation.h>

@interface DWCommandResult : NSObject
@property (nonatomic,strong) NSError *error;
@property (nonatomic,strong) id content;
@end

@interface DWCommand : NSObject
@property (nonatomic,assign,readonly) BOOL executing;
@property (nonatomic,strong,readonly) DWCommandResult *result;
- (instancetype)initWithComsumhandler:(DWCommandComsumBlk)consumHandler;
- (instancetype)initWithComsumhandler:(DWCommandComsumBlk)consumHandler cancelHandler:(DWCommandCancelBlk)cancelHandler;

- (void)execute:(id)input;
- (void)cancel;
@end
