//
//  MainViewController.m
//  travel
//
//  Created by 叶慧伟 on 16/5/25.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "MainViewController.h"
#import "MineViewController.h"
#import "SuggestViewController.h"
#import "TourismViewController.h"
#import "TravelsViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewControllers];
}

- (void)setUpComposeBtn{

}

- (void)addChildViewControllers{
    [self addChildViewController:[SuggestViewController new] titleStr:@"推荐" image:@"悠闲"];
    [self addChildViewController:[TourismViewController new] titleStr:@"走着" image:@"景点"];
    [self addChildViewController:[TravelsViewController new] titleStr:@"游记" image:@"游记"];
    [self addChildViewController:[MineViewController new] titleStr:@"我的" image:@"人文"];
}

- (void)addChildViewController:(UIViewController *)vc titleStr:(NSString *)title image:(NSString *)imageName{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
