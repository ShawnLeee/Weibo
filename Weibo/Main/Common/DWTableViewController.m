//
//  DWTableViewController.m
//  Weibo
//
//  Created by Daniel on 16/3/12.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "DWTableViewController.h"

@interface DWTableViewController ()
@property (nonatomic,assign) BOOL refreshing;
@end

@implementation DWTableViewController
- (instancetype)init
{
    if (self = [super init]) {
        _refreshing = NO;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onPullRefresh) forControlEvents:UIControlEventValueChanged];
}
- (void)setRefreshing:(BOOL)refreshing
{
    _refreshing = refreshing;
    if (_refreshing) {
        [self.refreshControl beginRefreshing];
        self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Loading..."];
    }else
    {
        [self.refreshControl endRefreshing];
        self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    }
}
- (void)dws_refresh:(void (^)())completion
{
    [NSException raise:@"子类必须实现该方法" format:@""];
}
- (void)onPullRefresh
{
   self.refreshing = YES;
   [self dws_refresh:^{
       self.refreshing = NO;
   }];
}
@end
