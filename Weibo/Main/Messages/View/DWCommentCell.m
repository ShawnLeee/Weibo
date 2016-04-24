//
//  DWCommentCell.m
//  Weibo
//
//  Created by Daniel on 16/4/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWComment.h"
#import "DWStatusUserView.h"
#import "DWCommentStatusView.h"
#import "DWCommentCell.h"

@interface DWCommentCell()
@property (nonatomic,weak)  IBOutlet DWStatusUserView *userView;
@property (nonatomic,weak)  IBOutlet DWCommentStatusView *commentStatusView;
@property (nonatomic,weak)  IBOutlet UILabel *commentTextLabel;
@property (nonatomic,strong) DWComment *comment;
@end
@implementation DWCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)configureCommentCellWithModel:(DWComment *)comment
{
    self.comment = comment;
    self.commentTextLabel.text = comment.text;
    [_userView configureWithComment:comment];
    [_commentStatusView configureWithStatusModel:comment.status];
    
}

@end
