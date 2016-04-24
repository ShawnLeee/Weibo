//
//  DWHotWeiboController.m
//  Weibo
//
//  Created by Daniel on 16/3/11.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWMBlog.h"
#import "DWHotStatus.h"
#import "DWDiscoveryService.h"
#import "DWHotWeiboController.h"
#import "DWMblogCell.h"
@interface DWHotWeiboController ()
@property (nonatomic,strong) NSArray *statuses;
@end
@implementation DWHotWeiboController
- (instancetype)initWithStatuses:(NSArray *)statuses
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _statuses = statuses;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _setupSelf];
}
- (void)_setupSelf
{
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DWMblogCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DWMblogCell class])];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWMblogCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DWMblogCell class]) forIndexPath:indexPath];
    DWHotStatus *status = self.statuses[indexPath.row];
    DWMBlog *mblog = status.mblog;
    cell.mblog = mblog;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}
@end
