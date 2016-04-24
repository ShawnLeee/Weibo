//
//  DWUserView.h
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DWUserInfo;
@interface DWUserView : UIView
+ (DWUserView *)userViewWithInfo:(DWUserInfo *)userInfo;
@end
