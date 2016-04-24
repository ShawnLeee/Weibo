//
//  DWCommentCell.h
//  Weibo
//
//  Created by Daniel on 16/4/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//
@class DWComment;
#import <UIKit/UIKit.h>

@interface DWCommentCell : UITableViewCell
- (void)configureCommentCellWithModel:(DWComment *)comment;
@end
