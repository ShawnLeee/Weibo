//
//  DWBaseService.h
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class RACSignal;

#import <Foundation/Foundation.h>

@interface DWBaseService : NSObject
- (RACSignal *)cardsDataWithJSONFileName:(NSString *)fileName;
@end
