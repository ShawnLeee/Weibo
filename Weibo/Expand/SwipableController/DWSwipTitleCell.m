//
//  DWSwipTitleCell.m
//  SwipableViewController
//
//  Created by Daniel on 16/3/10.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWSwipTitleCell.h"

@implementation DWSwipTitleCell

- (void)awakeFromNib {
}
- (void)setSelected:(BOOL)selected
{
    if (selected) {
        _titleLabel.textColor = [UIColor orangeColor];
    }else
    {
        _titleLabel.textColor = [UIColor lightGrayColor];
    }
    [super setSelected:selected];
    
}
@end
