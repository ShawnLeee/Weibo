//
//  DWCommentStatusView.m
//  Weibo
//
//  Created by Daniel on 16/4/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWStatusModel.h"
#import "DWCommentStatusView.h"
#import "DWUser.h"
#import <UIImageView+WebCache.h>
#import "DWPhoto.h"
@interface DWCommentStatusView()
@property (nonatomic,weak)  IBOutlet UILabel *nameLabel;
@property (nonatomic,weak)  IBOutlet UILabel *statusLabel;
@property (nonatomic,strong) DWStatusModel *statusModel;
@property (nonatomic,weak)  IBOutlet UIImageView *imageView;
@end
@implementation DWCommentStatusView
- (void)configureWithStatusModel:(DWStatusModel *)statusModel
{
    self.statusModel = statusModel;
    self.nameLabel.text =[NSString stringWithFormat:@"@%@",statusModel.user.screen_name];
    self.statusLabel.text = statusModel.text;
    if (statusModel.pic_urls.count > 0) {
        DWPhoto *photo = [statusModel.pic_urls firstObject];
        NSURL *firstImageURL = [NSURL URLWithString:photo.thumbnail_pic];
        [_imageView sd_setImageWithURL:firstImageURL placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    }
}
@end
