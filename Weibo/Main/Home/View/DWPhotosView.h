//
//  DWPhotosView.h
//  Weibo
//
//  Created by Daniel on 16/4/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWPhotosView : UIView
@property (nonatomic,strong) NSArray *photos;
+ (CGSize)sizeWithCount:(NSUInteger)count;
@end
