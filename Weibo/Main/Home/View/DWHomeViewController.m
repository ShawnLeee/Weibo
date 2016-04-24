 //
//  DWHomeViewController.m
//  Weibo
//
//  Created by Daniel on 16/2/27.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWStatusViewModel.h"
#import "DWStatusDetailController.h"
#import "DWHomeService.h"
#import "DWHomeViewController.h"
#import "DWTimeLineParam.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "DWStatusCell.h"
#import "DWSHomeControl.h"
@interface DWHomeViewController ()
@property (nonatomic,strong) DWSHomeControl *homeControl;
@end
@implementation DWHomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_setupTableView];
    
    [self p_setupHomeControl];
}
- (void)p_setupHomeControl
{
    self.homeControl = [DWSHomeControl new];
    
    __weak typeof(self) wSelf = self;
    
    [self.homeControl loadNewStatuses:^{
        [wSelf.tableView reloadData];
    }];
    
}
- (void)dws_refresh:(void (^)())completion
{
    __weak typeof(self) weakSelf = self;
    [self.homeControl loadNewStatuses:^{
        [weakSelf.tableView reloadData];
        completion();
    }];
}

- (void)p_setupTableView
{
    self.title = @"首页";
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DWStatusCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DWStatusCell class])];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.homeControl.statuses.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DWStatusCell class]) forIndexPath:indexPath];
    cell.statusViewModel = self.homeControl.statuses[indexPath.row];
    return cell;
}
#pragma mark - TableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWStatusViewModel *viewModel = self.homeControl.statuses[indexPath.row];
    DWStatusDetailParam *detailParam = [viewModel statusDetailParam];
    DWStatusDetailController *detailVC = [[DWStatusDetailController alloc] initWithDetailParam:detailParam];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == (self.homeControl.statuses.count - 1)) {
        __weak typeof(self) weakSelf = self;
        [self.homeControl loadMoreStatuses:^{
            [weakSelf.tableView reloadData];
        }];
    }
}
@end
