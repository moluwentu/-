//
//  XTNavController.m
//  travel
//
//  Created by 叶慧伟 on 2017/7/26.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "XTNavController.h"

@interface XTNavController ()<UIGestureRecognizerDelegate>

@end

@implementation XTNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;
}

+ (void)initialize{
    UINavigationBar *nav = [UINavigationBar appearance];
    [nav setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    [nav setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    nav.translucent = NO;
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
   if (self.childViewControllers.count > 0) {
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGestureClick:)];
    [viewController.view removeGestureRecognizer:swipeGesture];
    [viewController.view addGestureRecognizer:swipeGesture];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"NavBack"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    viewController.navigationItem.leftBarButtonItem = leftBtn;
    
    viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (void)swipeGestureClick:(id)sender{
    [self popViewControllerAnimated:YES];
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
