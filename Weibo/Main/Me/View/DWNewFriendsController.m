//
//  DWNewFriendsController.m
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWCardCell.h"
#import "DWCardModelHeader.h"
#import "DWMeService.h"
#import "DWNewFriendsController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface DWNewFriendsController ()
@property (nonatomic,strong) NSArray *cards;
@end

@implementation DWNewFriendsController
- (NSArray *)cards
{
    if (!_cards) {
        _cards = @[];
    }
    return _cards;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupSelf];
    [self _loadData];
    
}
- (void)_setupSelf
{
    self.title = @"新的好友";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
}
- (void)_loadData
{
    @weakify(self)
    [[[DWMeService sharedService] cardsDataWithJSONFileName:@"newfriends.json"] subscribeNext:^(NSArray *cards) {
        @strongify(self)
        self.cards = cards;
        [self.tableView reloadData];
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cards.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DWCardItem *item = self.cards[section];
    return item.card_group.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWCardItem *item = self.cards[indexPath.section];
    DWCard *card = item.card_group[indexPath.row];
    UITableViewCell *cell = [DWCardCell cellWithTableView:tableView cardModel:card];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWCardItem *item = self.cards[indexPath.section];
    DWCard *card = item.card_group[indexPath.row];
    switch (card.card_type) {
        case DWCardTypeFollower:
            return 88;
            break;
        case DWCardTypeTitleAndSubtile:
            return 30;
            break;
        default:
            return 44;
            break;
    }
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
- (void)dealloc
{
    
}
@end
