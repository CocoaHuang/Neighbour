//
//  CentreTableViewController.m
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "CentreTableViewController.h"
#import "BaseCellModel.h"
#import "CentreTableViewCell.h"

static NSString *cellName = @"centreCell";

@interface CentreTableViewController ()



@end

@implementation CentreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    [self.tableView registerClass:[CentreTableViewCell class] forCellReuseIdentifier:cellName];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
    }
    return self;
}


- (void)getData
{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return _sectionArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSArray *arr = _sectionArr[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CentreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    NSArray *data = _sectionArr[indexPath.section];
    BaseCellModel *model = data[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *data = _sectionArr[indexPath.section];
    BaseCellModel *model = data[indexPath.row];
    if (model.blockClick) {
        model.blockClick();
    }
}



@end
