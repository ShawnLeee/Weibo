//
//  DWPhoto.h
//  Weibo
//
//  Created by Daniel on 16/4/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol DWPhoto
@end

@interface DWPhoto : JSONModel
@property (nonatomic,copy) NSString *thumbnail_pic;
@end
