
//  DWStatusView.m
//  Weibo
//
//  Created by Daniel on 16/3/7.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWStatusView.h"
#import "DWStatusViewModel.h"
#import <UIImageView+WebCache.h>
#import "DWPhotosView.h"
@interface DWStatusView()
@property (nonatomic,weak) IBOutlet UIImageView *avartarView;
@property (nonatomic,weak) IBOutlet UILabel *nameLabel;
@property (nonatomic,weak)  IBOutlet UIImageView *vipIcon;
@property (nonatomic,weak)  IBOutlet UILabel *timeLabel;
@property (nonatomic,weak)  IBOutlet UILabel *sourceLabel;
@property (nonatomic,weak)  IBOutlet UILabel *textLabel;
@property (nonatomic,weak) IBOutlet DWPhotosView *photosView;

@property (nonatomic,strong) IBOutlet NSLayoutConstraint *pheightCons;
@property (nonatomic,strong) IBOutlet NSLayoutConstraint *pTopCons;
@property (nonatomic,strong) IBOutlet NSLayoutConstraint *pBottomCons;

@end
@implementation DWStatusView
- (void)awakeFromNib
{
    self.avartarView.layer.cornerRadius = 20;
    
}
- (void)setStatusViewModel:(DWStatusViewModel *)statusViewModel
{
    _statusViewModel = statusViewModel;
    self.nameLabel.text = statusViewModel.userName;
    [self.avartarView sd_setImageWithURL:statusViewModel.userIconURL placeholderImage:[UIImage imageNamed:@"avatar_default"]];
    self.timeLabel.text = statusViewModel.createdTime;
    self.sourceLabel.text = statusViewModel.source;
    self.textLabel.text = statusViewModel.text;
    _photosView.photos = statusViewModel.pictures;
    if (statusViewModel.pictures.count > 0) {
        [NSLayoutConstraint activateConstraints:@[_pheightCons,_pTopCons,_pBottomCons]];
        _pheightCons.constant = [DWPhotosView sizeWithCount:statusViewModel.pictures.count].height;
    }else
    {
        [NSLayoutConstraint deactivateConstraints:@[_pheightCons,_pTopCons,_pBottomCons]];
    }
}

- (IBAction)statusMoreBtnClicked
{
    
}
@end
