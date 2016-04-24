//
//  DWStatusViewModel.m
//  Weibo
//
//  Created by Daniel on 16/3/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWHomeService.h"
#import "DWCommand.h"
#import "NSDate+Extension.h"
#import "DWStatusModel.h"
#import "DWStatusViewModel.h"
#import "DWUser.h"
#import "DWRetweetedStatusViewModel.h"
#import "DWCommentParam.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "DWStatusDetailParam.h"
@interface DWStatusViewModel ()
@property (nonatomic,strong) DWStatusModel *statusModel;
@end
@implementation DWStatusViewModel
- (instancetype)initWithStatusModel:(DWStatusModel *)statusModel
{
    if (self = [super init]) {
        _statusModel = statusModel;
        [self setupWithStatusModel:statusModel];
        [self setupCommand];
    }
    return self;
}
- (DWStatusDetailParam *)statusDetailParam
{
    DWStatusDetailParam *detailParam = [[DWStatusDetailParam alloc] init];
    detailParam.id = self.statusId;
    return detailParam;
}
- (void)setupCommand
{
    
    self.likeCommand = [[DWCommand alloc] initWithComsumhandler:^(id input, DWCommandCompletionBlk completionHandler) {
        DWCommentParam *param = [DWCommentParam new];
        param.id = (NSString *)input;
        param.comment = @"nice";
        [[[DWHomeService sharedService] commentStatustWithParam:param]
        subscribeNext:^(id x) {
            
        }];
    }];
}
- (void)setupWithStatusModel:(DWStatusModel *)statusModel
{
   
    self.userName = statusModel.user.screen_name;
    
    self.userIcon = statusModel.user.avatar_hd;
    self.userIconURL = [NSURL URLWithString:self.userIcon];
    self.createdTime = statusModel.created_at;
    self.source = statusModel.source;
    self.text = statusModel.text;
    self.pictures = statusModel.pic_urls;
    self.statusId = statusModel.idstr;
    self.reposts_count =[NSString stringWithFormat:@"%ld",statusModel.reposts_count];
    self.comments_count = [NSString stringWithFormat:@"%ld",statusModel.comments_count];
    self.attitudes_count = [NSString stringWithFormat:@"%ld",statusModel.attitudes_count];
    
    if (statusModel.retweeted_status) {
        self.retweetedStatusViewModel = [[DWRetweetedStatusViewModel alloc] initWithStatusModel:statusModel.retweeted_status];
    }
}
- (NSString *)source
{
    if (_source.length > 0) {
        NSString *regex = @">.*?<";
        NSRange range = [self.statusModel.source rangeOfString:regex options:NSRegularExpressionSearch];
        NSRange newRange = NSMakeRange(range.location + 1, range.length - 2);
        NSString *newSource = [self.statusModel.source substringWithRange:newRange];
        
        return [NSString stringWithFormat:@"来自 %@",newSource] ;
    }else
    {
        return nil;
    }
    
}
- (NSString *)createdTime
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 如果是真机调试，转换这种欧美时间，需要设置locale
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    // 设置日期格式（声明字符串里面每个数字和单词的含义）
    // E:星期几
    // M:月份
    // d:几号(这个月的第几天)
    // H:24小时制的小时
    // m:分钟
    // s:秒
    // y:年
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    //    _created_at = @"Tue Sep 30 17:06:25 +0600 2014";
    
    // 微博的创建日期
    NSDate *createDate = [fmt dateFromString:_createdTime];
    // 当前时间
    NSDate *now = [NSDate date];
    
    // 日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSCalendarUnit枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:createDate toDate:now options:0];
    
    if ([createDate isThisYear]) { // 今年
        if ([createDate isYesterday]) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:createDate];
        } else if ([createDate isToday]) { // 今天
            if (cmps.hour >= 1) {
                return [NSString stringWithFormat:@"%d小时前", (int)cmps.hour];
            } else if (cmps.minute >= 1) {
                return [NSString stringWithFormat:@"%d分钟前", (int)cmps.minute];
            } else {
                return @"刚刚";
            }
        } else { // 今年的其他日子
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:createDate];
        }
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:createDate];
    }
}
@end
