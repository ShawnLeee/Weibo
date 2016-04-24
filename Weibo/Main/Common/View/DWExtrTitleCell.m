//
//  DWExtrTitleCell.m
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWCard.h"
#import "DWExtrTitleCell.h"
@interface DWExtrTitleCell ()
@property (nonatomic,weak)  IBOutlet UILabel *descLabel;
@property (nonatomic,weak)  IBOutlet UILabel *extrLabel;
@end
@implementation DWExtrTitleCell
- (void)setCardModel:(DWCard *)cardModel
{
    _cardModel = cardModel;
    self.descLabel.text = cardModel.desc;
    self.extrLabel.text = cardModel.title_extra_text;
}


@end
