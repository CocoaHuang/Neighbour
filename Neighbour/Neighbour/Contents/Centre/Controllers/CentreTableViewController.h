//
//  CentreTableViewController.h
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CentreTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *sectionArr;
- (void)getData;

@end
