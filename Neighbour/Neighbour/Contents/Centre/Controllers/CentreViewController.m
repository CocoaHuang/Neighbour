//
//  CentreViewController.m
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "CentreViewController.h"
#import "ArrowCellModel.h"
#import "SubCellModel.h"

@interface CentreViewController ()

@end

@implementation CentreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)getData
{
    NSMutableArray *sectionArr = [NSMutableArray array];
    NSMutableArray *dataArr = [NSMutableArray array];
    BaseCellModel *model1 = [ArrowCellModel createModelWithIcon:nil title:@"看看" subTitle:nil vcStr:nil];

    BaseCellModel *model2 = [ArrowCellModel createModelWithIcon:nil title:@"看看" subTitle:nil vcStr:nil];
    BaseCellModel *model3 = [ArrowCellModel createModelWithIcon:nil title:@"看看" subTitle:nil vcStr:nil];
    [dataArr addObject:model1];
    [dataArr addObject:model2];
    [dataArr addObject:model3];
    [sectionArr addObject:dataArr];
    
    
    NSMutableArray *dataArr1 = [NSMutableArray array];
    BaseCellModel *model4 = [SubCellModel createModelWithIcon:nil title:@"看看" subTitle:nil vcStr:nil];
    
    BaseCellModel *model5 = [ArrowCellModel createModelWithIcon:nil title:@"看看" subTitle:nil vcStr:nil];
    BaseCellModel *model6 = [SubCellModel createModelWithIcon:nil title:@"看看" subTitle:nil vcStr:nil];
    [dataArr1 addObject:model4];
    [dataArr1 addObject:model5];
    [dataArr1 addObject:model6];
    [sectionArr addObject:dataArr1];
    self.sectionArr = sectionArr;
}



@end
