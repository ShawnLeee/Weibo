//
//  DWTabBar.m
//  Weibo
//
//  Created by Daniel on 16/2/29.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWTabBar.h"
@interface DWTabBar ()
@property (nonatomic,weak) UIButton *composeBtn;
@end
@implementation DWTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIButton *)composeBtn
{
    if (!_composeBtn ) {
        UIButton *composeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateSelected];
        [composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateSelected];
        [self addSubview:composeBtn];
        _composeBtn = composeBtn;
    }
    return _composeBtn;
    
}
- (void)awakeFromNib
{
    self.tintColor = [UIColor orangeColor];
   
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnCount = 5;
    CGFloat w = self.bounds.size.width/btnCount;
    CGFloat h = self.bounds.size.height;
    CGRect frame = CGRectMake(0, 0, w, h);
    NSInteger index = 0;
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:[UIControl class]] && ![subview isKindOfClass:[UIButton class]]) {
            subview.frame = CGRectOffset(frame, index * w, 0);
            index++;
        }
        if (index == 2) {
            index++;
        }
    }
    self.composeBtn.frame = frame;
    self.composeBtn.center = CGPointMake(self.center.x, h * 0.5);
}
@end
