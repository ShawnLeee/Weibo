//
//  DWAccount.h
//  Weibo
//
//  Created by Daniel on 16/2/29.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <JSONModel.h>
@interface DWAccount : JSONModel <NSCoding>
@property (nonatomic,copy) NSString *access_token;
@property (nonatomic,copy) NSString *expires_in;
@property (nonatomic,copy) NSString *remind_in;
@property (nonatomic,copy) NSString *uid;

+ (instancetype)accountWithDict:(NSDictionary *)dict;

/**
 *  存储账号信息
 */
- (void)save;
/**
 *  取出存储的账号信息
 *
 *  @return 账号
 */
+ (instancetype)getAccount;

@end
