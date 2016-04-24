//
//  DWUserInfo.h
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@interface DWUserInfo : JSONModel
@property (nonatomic,copy) NSString *userDescription;
@property (nonatomic,copy) NSString *profile_image_url;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger followers_count;
@property (nonatomic,assign) NSInteger friends_count;
@property (nonatomic,assign) NSInteger statuses_count;
@end
