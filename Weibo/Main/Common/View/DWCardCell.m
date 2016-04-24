//
//  DWCardCell.m
//  Weibo
//
//  Created by Daniel on 16/3/8.
//  Copyright © 2016年 Daniel. All rights reserved.
//
#import "DWCard.h"
#import "DWCardCell.h"
#import "DWSingleTitleCell.h"
#import "DWMultiTitleCell.h"
#import "DWPicItemsCell.h"
#import "DWFollowerCell.h"
#import "DWExtrTitleCell.h"
@implementation DWCardCell
+ (UITableViewCell *)cellWithTableView:(UITableView *)tableView cardModel:(DWCard *)card
{
    [self _registerCellsWithTableView:tableView];
    switch (card.card_type) {
        case DWCardTypeSingleTitle:
        {
            DWSingleTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DWSingleTitleCell class])];
            cell.cardModel = card;
            return cell;
            break;
        }
        case DWCardTypePics:
        {
            
            DWPicItemsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DWPicItemsCell class])];
            cell.cardModel = card;
            return cell;
            break;
        }
        case DWCardTypeTitles:
        {
            
            DWMultiTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DWMultiTitleCell class])];
            cell.cardModel = card;
            return cell;
            break;
        }
        case DWCardTypeDiscoure:
        {
            DWSingleTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DWSingleTitleCell class])];
            cell.cardModel = card;
            return cell;
            break;
        }
        case DWCardTypeFollower:
        {
            DWFollowerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DWFollowerCell class])];
            cell.cardModel = card;
            return cell;
        }
        case DWCardTypeTitleAndSubtile:
        {
            DWExtrTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DWExtrTitleCell class])];
            cell.cardModel = card;
            return cell;
        }
        default:
        {
            return [[UITableViewCell alloc] init];
        }
    }
}
+ (void)_registerCellsWithTableView:(UITableView *)tableView
{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DWSingleTitleCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DWSingleTitleCell class])];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DWMultiTitleCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DWMultiTitleCell class])];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DWPicItemsCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DWPicItemsCell class])];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DWFollowerCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DWFollowerCell class])];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DWExtrTitleCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DWExtrTitleCell class])];
    
//    });
}
@end
