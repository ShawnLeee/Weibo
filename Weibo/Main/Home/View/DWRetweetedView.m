//
//  DWRetweetedView.m
//  Weibo
//
//  Created by Daniel on 16/3/7.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWRetweetedView.h"
#import "DWRetweetedStatusViewModel.h"
#import "DWPhotosView.h"

@interface DWRetweetedView()
@property (nonatomic,weak)  IBOutlet UILabel *textLabel;
@property (nonatomic,strong)  IBOutlet NSLayoutConstraint *topSpaceConstraint;
@property (nonatomic,strong)  IBOutlet NSLayoutConstraint *bottomSpaceConstraint;
@property (nonatomic,strong) IBOutlet NSLayoutConstraint *photosHeightConstraint;
@property (nonatomic,strong) IBOutlet NSLayoutConstraint *ptopCons;
@property (nonatomic,strong) IBOutlet NSLayoutConstraint *pbottomCons;
@property (nonatomic,weak)  IBOutlet DWPhotosView *photosView;
@end
@implementation DWRetweetedView
-(void)setStatusViewModel:(DWRetweetedStatusViewModel *)statusViewModel
{
    if (!statusViewModel) {
        [NSLayoutConstraint deactivateConstraints:@[self.topSpaceConstraint,self.bottomSpaceConstraint]];
    }else
    {
        [NSLayoutConstraint activateConstraints:@[self.topSpaceConstraint,self.bottomSpaceConstraint]];
    }
    _statusViewModel = statusViewModel;
    self.textLabel.text = statusViewModel.text;
    
    _photosView.photos = statusViewModel.pictures;
    if (statusViewModel.pictures.count <=0) {
        [NSLayoutConstraint deactivateConstraints:@[_photosHeightConstraint,_ptopCons,_pbottomCons]];
    }else
    {
        [NSLayoutConstraint activateConstraints:@[_photosHeightConstraint,_ptopCons,_pbottomCons]];
        _photosHeightConstraint.constant = [DWPhotosView sizeWithCount:statusViewModel.pictures.count].height;
    }
    
}
@end
