//
//  DWSNavigationController.m
//  Weibo
//
//  Created by Daniel on 16/4/4.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWSNavigationController.h"

@interface DWSNavigationController ()

@end

@implementation DWSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [UIApplication sharedApplication].keyWindow.backgroundColor = [UIColor whiteColor];
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}


@end
