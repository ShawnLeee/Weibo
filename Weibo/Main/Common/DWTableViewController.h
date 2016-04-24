//
//  DWTableViewController.h
//  Weibo
//
//  Created by Daniel on 16/3/12.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWTableViewController : UITableViewController
- (void)dws_refresh:(void (^)())completion;
@end
