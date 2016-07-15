//
//  SuggestViewController.m
//  travel
//
//  Created by 叶慧伟 on 16/5/25.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "SuggestViewController.h"
#import "SuggestView.h"
#import "SuggestDetailVC.h"

@interface SuggestViewController ()

@property (nonatomic, strong)UIImageView *backImageView;
@property (nonatomic, strong)SuggestView *suggestView;
@property (nonatomic, assign)CGRect originRect;

@end

@implementation SuggestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    
    [self setUI];
}

- (void)setUI{

    [self.view addSubview:self.backImageView];
    [self.view addSubview:self.suggestView];
    
    self.originRect = self.backImageView.frame;
}

- (UIImageView *)backImageView{
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-20, -20, kScreenWidth + 40, kScreenHeight + 40)];
        [_backImageView setImage:[UIImage imageNamed:@"timg.jpg"]];
    }
    return _backImageView;
}

- (SuggestView *)suggestView{
    if (_suggestView == nil) {
        _suggestView = [[SuggestView alloc]initWithFrame:CGRectMake(0, 400, kScreenWidth, 1000)];
        __weak typeof(self) weakself = self;
        _suggestView.moveBlock = ^(CGFloat offsetY){
            CGRect backImageRect = weakself.backImageView.frame;
            
//            if (weakself.suggestView.frame.origin.y < 500) {
//                CGRect topFrame = weakself.suggestView.frame;
//                topFrame.origin.y = 0;
//                weakself.suggestView.frame = topFrame;
//            }
            
            if (fabs(offsetY) > 80) {
                return ;
            }
            backImageRect = CGRectMake(weakself.originRect.origin.x + offsetY / 10, weakself.originRect.origin.y + offsetY / 10, weakself.originRect.size.width - offsetY / 5, weakself.originRect.size.height - offsetY / 5);
            weakself.backImageView.frame = backImageRect;
        };
        //tableview点击
        _suggestView.pushBlock = ^(NSIndexPath *indexpath){
            SuggestDetailVC *sugVC = [[SuggestDetailVC alloc]init];
            
            [weakself.navigationController pushViewController:sugVC animated:YES];
        };
        
    }
    return _suggestView;
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
