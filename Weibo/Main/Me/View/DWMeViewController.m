//
//  DWMeViewController.m
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "DWMeService.h"
#import "DWMeViewController.h"
#import "DWCardModelHeader.h"
#import "DWCardCell.h"
#import "DWUserInfo.h"
#import "DWUserView.h"
@interface DWMeViewController ()
@property (nonatomic,strong) NSArray *meItems;
@end

@implementation DWMeViewController
- (NSArray *)meItems
{
    if (!_meItems) {
        _meItems = [@[] mutableCopy];
    }
    return _meItems;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupSelf];
    [self _loadData];
}
- (void)_setupSelf
{
    self.title = @"我";
}
- (void)_loadData
{
    @weakify(self)
    [[[DWMeService sharedService] cardsDataWithJSONFileName:@"me.json"]
        subscribeNext:^(NSArray *items) {
            @strongify(self)
            self.meItems = items;
            [self.tableView reloadData];
    }];
    
    DWUserInfo *userInfo = [[DWMeService sharedService] userInfo];
    DWUserView *userView = [DWUserView userViewWithInfo:userInfo];
    self.tableView.tableHeaderView = userView;
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.meItems.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DWCardItem *cardItem = self.meItems[section];
    return cardItem.card_group.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWCardItem *cardItem = self.meItems[indexPath.section];
    DWCard *cardModel = cardItem.card_group[indexPath.row];
    UITableViewCell *cell = [DWCardCell cellWithTableView:tableView cardModel:cardModel];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] initWithFrame:CGRectZero];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWCardItem *item = self.meItems[indexPath.section];
    DWCard *card = item.card_group[indexPath.row];
    UIViewController *desVC = [[DWMeService sharedService] destinatioinControllerWithCard:card];
    [self.navigationController pushViewController:desVC animated:YES];
}
@end
