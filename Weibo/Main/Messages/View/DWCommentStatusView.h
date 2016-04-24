//
//  DWCommentStatusView.h
//  Weibo
//
//  Created by Daniel on 16/4/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWStatusModel;
#import <UIKit/UIKit.h>

@interface DWCommentStatusView : UIView
- (void)configureWithStatusModel:(DWStatusModel *)statusModel;
@end
