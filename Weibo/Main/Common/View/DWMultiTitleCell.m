//
//  DWMultiTitleCell.m
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWWeiBoTitleView.h"
#import "DWMultiTitleCell.h"
#import "DWCard.h"
#import "DWWeiboTitle.h"
@interface DWMultiTitleCell ()
@property (strong, nonatomic) IBOutletCollection(DWWeiBoTitleView) NSArray *titleViews;
@end
@implementation DWMultiTitleCell
- (void)setCardModel:(DWCard *)cardModel
{
    _cardModel = cardModel;
    if (cardModel.group.count > 0 && cardModel.group.count <= self.titleViews.count) {
        [cardModel.group enumerateObjectsUsingBlock:^(DWWeiboTitle  *weiboTitle, NSUInteger idx, BOOL * _Nonnull stop) {
            DWWeiBoTitleView *titleView = self.titleViews[idx];
            titleView.weiboTitle = weiboTitle;
        }];
    }
}
@end
