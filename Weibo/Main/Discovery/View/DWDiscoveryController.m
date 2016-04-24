//
//  DWDiscoveryController.m
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWDiscoveryService.h"
#import "DWDiscoveryController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "DWCard.h"
#import "DWCardCell.h"
#import "DWCardItem.h"
@interface DWDiscoveryController ()<UITableViewDelegate>
@property (nonatomic,strong) NSArray *discoveryItems;
@end

@implementation DWDiscoveryController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupSelf];
    [self _loadData];
}
- (void)_setupSelf
{
    self.title = @"发现";
}
- (void)_loadData
{
    @weakify(self)
    [[[DWDiscoveryService sharedService] cardsDataWithJSONFileName:@"discovery.json"]
    subscribeNext:^(NSArray *items) {
        @strongify(self)
        self.discoveryItems = items;
        [self.tableView reloadData];
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.discoveryItems.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DWCardItem *cardItem = self.discoveryItems[section];
    return cardItem.card_group.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWCardItem *cardItem = self.discoveryItems[indexPath.section];
    DWCard *card = cardItem.card_group[indexPath.row];
    UITableViewCell *cell = [DWCardCell cellWithTableView:tableView cardModel:card];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWCardItem *cardItem = self.discoveryItems[indexPath.section];
    DWCard *card = cardItem.card_group[indexPath.row];
    switch (card.card_type) {
        case DWCardTypeTitles:
            return 88;
            break;
        case  DWCardTypePics:
            return 108;
            break;
        case DWCardTypeSingleTitle:
            return 44;
            break;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWCardItem *cardItem = self.discoveryItems[indexPath.section];
    DWCard *card = cardItem.card_group[indexPath.row];
    UIViewController *destVC = [[DWDiscoveryService sharedService] destinationVCForCard:card];
    [self.navigationController pushViewController:destVC animated:YES];
}
@end
