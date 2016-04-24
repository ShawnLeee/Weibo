//
//  DWStatusUserView.h
//  Weibo
//
//  Created by Daniel on 16/4/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWUser,DWComment;
#import <UIKit/UIKit.h>

@interface DWStatusUserView : UIView
- (void)configureWithUser:(DWUser *)user;
- (void)configureWithComment:(DWComment *)comment;
@end
