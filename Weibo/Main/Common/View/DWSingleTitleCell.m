//
//  DWSingleTitleCell.m
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWCard.h"
#import "DWSingleTitleCell.h"
#import <UIImageView+WebCache.h>
@interface DWSingleTitleCell()
@property (weak, nonatomic) IBOutlet UIImageView *aView;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *descExtrLabel;

@property (nonatomic,assign) BOOL showArrow;
@end

@implementation DWSingleTitleCell
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _showArrow = NO;
    }
    return self;
}
- (void)setCardModel:(DWCard *)cardModel
{
    _cardModel = cardModel;
    NSURL *picURL = [NSURL URLWithString:cardModel.pic];
    [self.picImageView sd_setImageWithURL:picURL placeholderImage:nil];
    self.descLabel.text = cardModel.desc;
    self.descExtrLabel.text = cardModel.desc_extr;
    switch (cardModel.card_type) {
        case DWCardTypeDiscoure:
            self.descLabel.text = cardModel.desc1;
            break;
        default:
            break;
    }
    self.showArrow = (cardModel.display_arrow == 1);
}
- (void)setShowArrow:(BOOL)showArrow
{
    _showArrow = showArrow;
    if (_showArrow) {
        _aView.hidden = NO;
    }else
    {
        _aView.hidden = YES;
    }
}
@end
