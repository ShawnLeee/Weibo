//
//  DWMyPhotoCell.m
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#define kPadding 4
#import <UIImageView+WebCache.h>
#import "DWMyPhotoCell.h"
#import "DWCardItem.h"
#import "DWMyPhoto.h"
@interface DWMyPhotoCell ()
@property (strong, nonatomic) NSMutableArray *imageViews;
@end
@implementation DWMyPhotoCell
- (NSMutableArray *)imageViews
{
    if (!_imageViews) {
        _imageViews = [NSMutableArray array];
        for (int i = 0; i < 3; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [self.contentView addSubview:imageView];
            [_imageViews addObject:imageView];
        }
    }
    return _imageViews;
}
- (void)setCardItem:(DWCardItem *)cardItem
{
    _cardItem = cardItem;
    self.selectionStyle = UITableViewCellSeparatorStyleNone;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imageWidth = ([UIScreen mainScreen].bounds.size.width - 2 * kPadding)/3;
    CGRect frame = CGRectMake(0, 0, imageWidth, imageWidth);
    [self.imageViews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL * _Nonnull stop) {
        DWMyPhoto *myphoto = self.cardItem.pics[idx];
        imageView.frame = CGRectOffset(frame, idx * (imageWidth + kPadding), 0);
        [imageView sd_setImageWithURL:[NSURL URLWithString:myphoto.pic_big]];
    }];
}
@end
