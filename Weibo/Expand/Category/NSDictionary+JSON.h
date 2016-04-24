//
//  NSDictionary+JSON.h
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)
+ (NSDictionary *)dictionaryWithLocalJSONFile:(NSString *)jsonFileName;
@end
