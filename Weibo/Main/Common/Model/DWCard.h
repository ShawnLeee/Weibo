//
//  DWCard.h
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWUser;
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,DWCardType) {
    DWCardTypePics = 22,//多张图片浏览
    DWCardTypeTitles = 17,//热门话题
    DWCardTypeSingleTitle = 4,//图片，标题，子标题
    DWCardTypeDiscoure = 32,//图片，标题，子标题，AccessoryView
    DWCardTypeTitleAndSubtile = 42,
    DWCardTypeFollower = 10,
};

@interface DWCard : NSObject
@property (nonatomic,assign) DWCardType card_type;
@property (nonatomic,copy) NSString *card_type_name;
@property (nonatomic,copy) NSString *card_id;
@property (nonatomic,copy) NSString *col;
@property (nonatomic,assign) NSInteger width;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,assign) NSInteger flow_gap;
@property (nonatomic,assign) NSInteger auto_flow;
@property (nonatomic,copy) NSString *openurl;
@property (nonatomic,strong) NSArray *pic_items;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *desc1;
@property (nonatomic,copy) NSString *desc2;
@property (nonatomic,copy) NSString *desc_extr;
@property (nonatomic,copy) NSString *pic;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *scheme;
@property (nonatomic,copy) NSString *has_button;
@property (nonatomic,copy) NSString *itemid;
@property (nonatomic,copy) NSString *unread_id;
@property (nonatomic,assign) NSInteger highlight_state;
@property (nonatomic,assign) NSInteger bold;
@property (nonatomic,strong) NSArray *group;
@property (nonatomic,assign) NSInteger display_arrow;
@property (nonatomic,copy) NSString *title_extra_text;
@property (nonatomic,strong) DWUser *user;
@end
