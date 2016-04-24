//
//  DWHotweiboTag.h
//  Weibo
//
//  Created by Daniel on 16/3/11.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWHotweiboTag : NSObject
@property (nonatomic,copy) NSString *tag_name;
@property (nonatomic,copy) NSString *tag_scheme;
@property (nonatomic,assign) NSInteger tag_hidden;
@property (nonatomic,assign) NSInteger tag_type;
@property (nonatomic,copy) NSString *url_type_pic;

@end
