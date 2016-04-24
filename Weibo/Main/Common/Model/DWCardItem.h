//
//  DWCard.h
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,DWCardItemType)
{
    DWCardItemTypeGroup = 19,
    DWCardItemTypeCardGroup = 11,
};
@interface DWCardItem : NSObject
@property (nonatomic,assign) NSInteger card_type;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *desc_extr;
@property (nonatomic,assign) NSInteger display_arrow;
@property (nonatomic,assign) NSInteger show_type;
@property (nonatomic,copy) NSString *itemid;
@property (nonatomic,copy) NSString *openurl;
@property (nonatomic,strong) NSArray *card_group;
@property (nonatomic,strong) NSArray *pics;
@end
