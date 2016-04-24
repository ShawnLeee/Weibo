//
//  DWPhotoView.m
//  Weibo
//
//  Created by Daniel on 16/4/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWPhoto.h"
#import "DWPhotoView.h"
#import <UIImageView+WebCache.h>
#import "UIView+Extension.h"
@interface DWPhotoView()
@property (nonatomic,weak)  UIImageView *gifView;
@end
@implementation DWPhotoView
- (UIImageView *)gifView
{
    if (!_gifView) {
        UIImage *image = [UIImage imageNamed:@"timeline_image_gif"];
        UIImageView *gifView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:gifView];
        self.gifView = gifView;
    }
    return _gifView;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 内容模式
        self.contentMode = UIViewContentModeScaleAspectFill;
        // 超出边框的内容都剪掉
        self.clipsToBounds = YES;
    }
    return self;
}
- (void)setPhoto:(DWPhoto *)photo
{
    _photo = photo;
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    self.gifView.hidden = ![photo.thumbnail_pic.lowercaseString hasSuffix:@"gif"];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.x = self.width - self.gifView.width;
    self.gifView.y = self.height - self.gifView.height;
}
@end
