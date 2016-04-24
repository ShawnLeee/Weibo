//
//  DWSwipableViewController.m
//  SwipableViewController
//
//  Created by Daniel on 16/3/10.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWSwipTitleCell.h"
#import "NSString+Size.h"
#import "DWSwipableViewController.h"
#define kIndicatorHeight 2
@interface DWSwipableViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic,weak) IBOutlet UICollectionView *titleCollectionView;
@property (nonatomic,weak) IBOutlet UICollectionView *vcCollectionView;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) NSArray *viewControllers;
@property (nonatomic,weak)  UIView *titleIndicator;
@end


@implementation DWSwipableViewController

- (NSArray *)viewControllers
{
    if (!_viewControllers) {
        _viewControllers = @[];
        _currentIndex = 0;
    }
    return _viewControllers;
}
- (instancetype)initWithViewControllers:(NSArray *)viewControllers
{
    if (self = [super init]) {
        _viewControllers = viewControllers;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupSelf];
}
- (void)_setupSelf
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.vcCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
    [self.titleCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DWSwipTitleCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([DWSwipTitleCell class])];
    CGSize firstLabelSize = [self titleLabelSizeForIndex:0];
    UIView *titleIndicator = [[UIView alloc] initWithFrame:CGRectMake(10, self.titleCollectionView.frame.size.height - kIndicatorHeight, firstLabelSize.width, kIndicatorHeight)];
    titleIndicator.backgroundColor = [UIColor orangeColor];
    [self.titleCollectionView addSubview:titleIndicator];
    self.titleIndicator = titleIndicator;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView isEqual:_vcCollectionView]) {
        return collectionView.bounds.size;
    }
    else
    {
        CGSize labelSize = [self titleLabelSizeForIndex:indexPath.row];
        CGFloat titleHeight = collectionView.bounds.size.height;
        return CGSizeMake(labelSize.width, titleHeight);
//        return CGSizeMake(60, collectionView.bounds.size.height);
    }
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if([collectionView isEqual:_vcCollectionView])
        self.currentIndex = indexPath.row;
}
#pragma mark - CollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _viewControllers.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView isEqual:_vcCollectionView]) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
        UIViewController *vc = self.viewControllers[indexPath.row];
        vc.view.frame = cell.contentView.bounds;
        [cell.contentView addSubview:vc.view];
        return cell;
    }else {
        UIViewController *vc = _viewControllers[indexPath.row];
        DWSwipTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DWSwipTitleCell class]) forIndexPath:indexPath];
        cell.titleLabel.text = vc.title;
        return cell;
    }
}
- (void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    [self titleViewSeletIndex:currentIndex];
}
- (void)titleViewSeletIndex:(NSInteger)index
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.titleCollectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    DWSwipTitleCell *cell = (DWSwipTitleCell *)[self.titleCollectionView cellForItemAtIndexPath:indexPath];
    [self changeIndicatorLocationWihtTitleCell:cell];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView isEqual:_titleCollectionView]) {
        [self vcViewSelectedIndexPath:indexPath];
    }
}
- (void)vcViewSelectedIndexPath:(NSIndexPath *)indexPath
{
    [self.vcCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}
- (void)changeIndicatorLocationWihtTitleCell:(DWSwipTitleCell *)cell
{
    if (!cell)
        return;
    CGFloat indicatorX = cell.frame.origin.x;
    CGFloat width = cell.frame.size.width;
    CGFloat indicatorY = cell.frame.size.height - kIndicatorHeight;
    [UIView animateWithDuration:0.5 animations:^{
        self.titleIndicator.frame = CGRectMake(indicatorX, indicatorY, width, kIndicatorHeight);
    }];
}
- (CGSize)titleLabelSizeForIndex:(NSInteger)index
{
    UIViewController *vc = self.viewControllers[index];
    CGSize size = [vc.title sizeForFont:[UIFont systemFontOfSize:16] maxH:20];
//    UILabel *label = [UILabel new];
//    label.font = [UIFont systemFontOfSize:16];
//    label.text = vc.title;
//    CGSize labelSize = [label sizeThatFits:size];
    return size;
//    return labelSize;
}
@end
