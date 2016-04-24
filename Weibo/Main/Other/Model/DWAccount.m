//
//  DWAccount.m
//  Weibo
//
//  Created by Daniel on 16/2/29.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWAccount.h"
#define DWAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

@implementation DWAccount
+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    NSError *error = nil;
    DWAccount *account = [[DWAccount alloc] initWithDictionary:dict error:&error];
    return account;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.remind_in forKey:@"remind_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.remind_in = [aDecoder decodeObjectForKey:@"remind_in"];
    }
    return self;
}

- (void)save
{
    [NSKeyedArchiver archiveRootObject:self toFile:DWAccountPath];
}

+ (instancetype)getAccount
{
    DWAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:DWAccountPath];
    return account;
}
@end
