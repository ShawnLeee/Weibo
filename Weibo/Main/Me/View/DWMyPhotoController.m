//
//  DWMyPhotoController.m
//  Weibo
//
//  Created by Daniel on 16/3/9.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWMeService.h"
#import "DWMyPhotoController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "DWMyPhotoCell.h"

@interface DWMyPhotoController ()
@property (nonatomic,strong) NSArray *cards;
@end
@implementation DWMyPhotoController
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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[DWMyPhotoCell class] forCellReuseIdentifier:NSStringFromClass([DWMyPhotoCell class])];
}
- (void)_loadData
{
    @weakify(self)
    [[[DWMeService sharedService] cardsDataWithJSONFileName:@"myphoto.json"]
    subscribeNext:^(NSArray *cards) {
        @strongify(self)
        self.cards = cards;
        [self.tableView reloadData];
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cards.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWMyPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DWMyPhotoCell class])];
    cell.cardItem = self.cards[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ([UIScreen mainScreen].bounds.size.width)/3;
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
@end
