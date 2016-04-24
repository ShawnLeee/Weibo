//
//  NSDictionary+JSON.m
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)
+ (NSDictionary *)dictionaryWithLocalJSONFile:(NSString *)jsonFileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:jsonFileName ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        return nil;
    }
    
    return dict;
}
@end
