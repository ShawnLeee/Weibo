//
//  DWPhotosView.m
//  Weibo
//
//  Created by Daniel on 16/4/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#define HWStatusPhotoMargin 6
#define HWStatusPhotoWH  ([UIScreen mainScreen].bounds.size.width - 20 - 2 * HWStatusPhotoMargin)/3
#define HWStatusPhotoMaxCol(count) ((count==4)?2:3)
#import "DWPhotosView.h"
#import "DWPhotoView.h"
#import "UIView+Extension.h"
@interface DWPhotosView()
@end
@implementation DWPhotosView
- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    NSUInteger photosCount = photos.count;
    while (self.subviews.count < photosCount) {
        DWPhotoView *photoView = [[DWPhotoView alloc] init];
        [self addSubview:photoView];
    }
    // 遍历所有的图片控件，设置图片
    for (int i = 0; i<self.subviews.count; i++) {
        DWPhotoView *photoView = self.subviews[i];
        
        if (i < photosCount) { // 显示
            photoView.photo = photos[i];
            photoView.hidden = NO;
        } else { // 隐藏
            photoView.hidden = YES;
        }
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置图片的尺寸和位置
    NSUInteger photosCount = self.photos.count;
    int maxCol = HWStatusPhotoMaxCol(photosCount);
    for (int i = 0; i<photosCount; i++) {
        DWPhotoView *photoView = self.subviews[i];
        
        int col = i % maxCol;
        photoView.x = col * (HWStatusPhotoWH + HWStatusPhotoMargin);
        
        int row = i / maxCol;
        photoView.y = row * (HWStatusPhotoWH + HWStatusPhotoMargin);
        photoView.width = HWStatusPhotoWH;
        photoView.height = HWStatusPhotoWH;
    }
}
+ (CGSize)sizeWithCount:(NSUInteger)count
{
    // 最大列数（一行最多有多少列）
    int maxCols = HWStatusPhotoMaxCol(count);
    
    NSUInteger cols = (count >= maxCols)? maxCols : count;
    CGFloat photosW = cols * HWStatusPhotoWH + (cols - 1) * HWStatusPhotoMargin;
    
    // 行数
    NSUInteger rows = (count + maxCols - 1) / maxCols;
    CGFloat photosH = rows * HWStatusPhotoWH + (rows - 1) * HWStatusPhotoMargin;
    
    return CGSizeMake(photosW, photosH);
}
@end
