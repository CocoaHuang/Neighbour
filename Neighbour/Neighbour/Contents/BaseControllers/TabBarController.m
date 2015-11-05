//
//  TabBarController.m
//  Neighbour
//
//  Created by apple on 15/11/3.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建Nav
    [self createNav];
}

- (void)createNav
{
    //加控制器
    [self addNavgationWithVcStr:@"LoginViewController" normalImg:@"item30x30@2x" selectImg:@"item30x30@2x"];
}

- (void)addNavgationWithVcStr:(NSString *)vcStr normalImg:(NSString *)normalStr selectImg:(NSString *)selectStr
{
    Class vc = NSClassFromString(vcStr);
    UIViewController *viewVC = [[vc alloc] init];
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:viewVC];
    //viewVC.title = @"看看";
    [viewVC.tabBarItem setImage:[UIImage imageNamed:normalStr]];
    UIImage *img = [[UIImage imageNamed:selectStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [viewVC.tabBarItem setSelectedImage:img];
    NSMutableArray *muArr = [NSMutableArray arrayWithArray:self.childViewControllers];
    [muArr addObject:nav];
    self.viewControllers = muArr;
}

@end
