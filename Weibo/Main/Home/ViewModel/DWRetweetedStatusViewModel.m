//
//  DWRetweetedStatusViewModel.m
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWUser.h"
#import "DWStatusModel.h"
#import "DWRetweetedStatusViewModel.h"
@interface DWRetweetedStatusViewModel ()
@property (nonatomic,strong) DWStatusModel *statusModel;
@end
@implementation DWRetweetedStatusViewModel
- (instancetype)initWithStatusModel:(DWStatusModel *)statusModel
{
    if (self = [super init]) {
        self.statusModel = statusModel;
    }
    return self;
}
- (void)setStatusModel:(DWStatusModel *)statusModel
{
    _statusModel = statusModel;
    self.userName = statusModel.user.screen_name;
    self.text = statusModel.text;
    self.pictures = statusModel.pic_urls;
}
@end
