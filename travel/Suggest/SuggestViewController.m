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
    
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)setUI{

    [self.view addSubview:self.backImageView];
    
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view);
    }];
    [self.view addSubview:self.suggestView];
    
    self.originRect = self.backImageView.frame;
}

- (UIImageView *)backImageView{
    if (_backImageView == nil) {
        //WithFrame:CGRectMake(-20, -20, kScreenWidth + 40, kScreenHeight + 40)
        _backImageView = [[UIImageView alloc]init];
        [_backImageView setImage:[UIImage imageNamed:@"timg.jpg"]];
    }
    return _backImageView;
}

- (SuggestView *)suggestView{
    if (_suggestView == nil) {
        _suggestView = [[SuggestView alloc]initWithFrame:CGRectMake(0, 400, kScreenWidth, 1000)];
        __weak typeof(self) weakself = self;
        _suggestView.moveBlock = ^(CGFloat offsetY){
            
            if (0 < (offsetY / 5)) {
                return ;
            }
            
            [weakself.backImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(weakself.view);
                make.width.equalTo(@([UIScreen mainScreen].bounds.size.width - offsetY / 5));
                make.height.equalTo(@([UIScreen mainScreen].bounds.size.height - offsetY / 5));

            }];
        };
        //tableview点击
        _suggestView.pushBlock = ^(NSIndexPath *indexpath){
#pragma mark --TODO--推荐详情
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
