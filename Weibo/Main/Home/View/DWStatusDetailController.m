//
//  DWStatusDetailController.m
//  Weibo
//
//  Created by Daniel on 16/4/4.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWHomeService.h"
#import "DWStatusDetailParam.h"
#import "DWStatusDetailController.h"
#import "DWRepostParam.h"

@interface DWStatusDetailController ()
@property (nonatomic,strong) DWStatusDetailParam *detailParam;
@end

@implementation DWStatusDetailController
- (instancetype)initWithDetailParam:(DWStatusDetailParam *)detailParam
{
    if (self = [super init]) {
        _detailParam = detailParam;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_loadData];
}
- (void)p_loadData
{
    [[DWHomeService sharedService] statusDetailWithParam:_detailParam completion:^(__autoreleasing id *statues) {
        
    }];
    DWRepostParam *repostParam = [[DWRepostParam alloc] initWithId:[_detailParam.id longLongValue]];
    [[DWHomeService sharedService] repostsWithParam:repostParam completion:^(NSArray *reposts) {
        
    }];
    
}
- (void)dealloc
{
    NSLog(@"%@ dealloced",[self class]);
}
@end
