//
//  DWPicItemsCell.m
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <UIImageView+WebCache.h>
#import "DWCardPic.h"
#import "DWCard.h"
#import "DWPicItemsCell.h"
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kImageViewsCount 3
@interface DWPicItemsCell ()<UIScrollViewDelegate>
@property (nonatomic,weak)  UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *imageViews;
@end
@implementation DWPicItemsCell
- (NSMutableArray *)imageViews
{
    if (!_imageViews) {
        _imageViews = [NSMutableArray array];
    }
    return _imageViews;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self _setupCell];
    }
    return self;
}
- (void)_setupCell
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.contentSize = CGSizeMake(ScreenWidth * kImageViewsCount, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:scrollView];
    self.scrollView = scrollView;
    [self _addImageViews];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = self.contentView.bounds;
    CGFloat imageWidth = ScreenWidth;
    CGFloat imageHeight = self.contentView.bounds.size.height;
    CGRect frame = CGRectMake(0, 0, imageWidth, imageHeight);
    [self.imageViews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL * _Nonnull stop) {
        imageView.frame  = CGRectOffset(frame, ScreenWidth * idx, 0);
    }];
}
- (void)setCardModel:(DWCard *)cardModel
{
    _cardModel = cardModel;
    if (cardModel.pic_items.count > 0 && cardModel.pic_items.count <= kImageViewsCount) {
        [cardModel.pic_items enumerateObjectsUsingBlock:^(DWCardPic *cardPic, NSUInteger idx, BOOL * _Nonnull stop) {
            UIImageView *imageView = self.imageViews[idx];
            [imageView sd_setImageWithURL:[NSURL URLWithString:cardPic.pic_big]];
        }];
    }
}
- (void)_addImageViews
{
    for (int i = 0; i < kImageViewsCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.scrollView addSubview:imageView];
        [self.imageViews addObject:imageView];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == 0) {
        [scrollView scrollRectToVisible:CGRectMake(ScreenWidth * 2, 0, ScreenWidth, scrollView.frame.size.height) animated:NO];
    }else if(scrollView.contentOffset.x == ScreenWidth * kImageViewsCount - 1)
    {
        [scrollView scrollRectToVisible:CGRectMake(ScreenWidth, 0, ScreenWidth, scrollView.frame.size.height) animated:NO];
    }
    
}
@end
