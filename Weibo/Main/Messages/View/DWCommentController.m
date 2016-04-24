//
//  DWCommentController.m
//  Weibo
//
//  Created by Daniel on 16/4/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "UIBarButtonItem+Config.h"
#import "DWRepostParam.h"
#import "DWMessageService.h"
#import "DWCommentController.h"
#import "DWCommentCell.h"
@interface DWCommentController ()
@property (nonatomic,strong) NSMutableArray *comments;
@end

@implementation DWCommentController
- (NSMutableArray *)comments
{
    if (!_comments) {
        _comments = [NSMutableArray array];
    }
    return _comments;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSelf];
    [self loadData];
}
- (void)setupSelf
{
    self.tableView.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DWCommentCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DWCommentCell class])];
    [self setuNav];
}

- (void)setuNav
{
    UIBarButtonItem *backBarbutton = [UIBarButtonItem itemWithImage:@"navigationbar_back_withtext"
                                                     highlightImage:@"navigationbar_back_withtext_highlighted"
                                                              title:@"评论"
                                                             target:self
                                                             action:@selector(dismissSelf)];
    
    self.navigationItem.leftBarButtonItem = backBarbutton;
}
- (void)dismissSelf
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc
{
    NSLog(@"%@ got dealloc",NSStringFromClass([self class]));
}
- (void)loadData
{
    __weak typeof(self) weakSelf = self;
    DWRepostParam *param = [[DWRepostParam alloc] init];
    [DWMessageService byMeCommentsWithParam:param completion:^(NSArray *comments) {
        [weakSelf.comments addObjectsFromArray:comments];
        [weakSelf.tableView reloadData];
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.comments.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWComment *comment = self.comments[indexPath.row];
    DWCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DWCommentCell class]) forIndexPath:indexPath];
    [cell configureCommentCellWithModel:comment];
    return cell;
}
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    DWComment *comment = self.comments[indexPath.row];
//    DWCommentCell *commentCell = (DWCommentCell *)cell;
//    [commentCell configureCommentCellWithModel:comment];
//    
//}

#pragma mark - TableView Delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}
@end
