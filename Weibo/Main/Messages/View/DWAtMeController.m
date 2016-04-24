//  DWAtMeController.m
//  Weibo
//
//  Created by Daniel on 16/4/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWMessageService.h"
#import "DWAtMeController.h"
#import "DWRepostParam.h"
#import "UIBarButtonItem+Config.h"
#import "DWCommentCell.h"






@interface DWAtMeController ()
@property (nonatomic,strong) NSMutableArray *comments;
@end

@implementation DWAtMeController
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
- (void)dealloc
{
    NSLog(@"%@ got dealloc",NSStringFromClass([self class]));
}
- (void)setupSelf
{
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
- (void)loadData
{
    __weak typeof(self) weakSelf = self;
    DWRepostParam *param = [[DWRepostParam alloc] init];
    [DWMessageService atMeMessageWithParam:param completion:^(NSArray *comments) {
        [weakSelf.comments addObjectsFromArray:comments];
        [weakSelf.tableView reloadData];
    }];
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.comments.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWComment *comment = self.comments[indexPath.row];
    DWCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DWCommentCell class]) forIndexPath:indexPath];
    [cell configureCommentCellWithModel:comment];
    return cell;
}
@end
