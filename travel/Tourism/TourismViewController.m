//
//  TourismViewController.m
//  travel
//
//  Created by 叶慧伟 on 16/5/25.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "TourismViewController.h"
#import "CHPopUpMenu.h"

@interface TourismViewController ()

@property (nonatomic, strong)UIImageView *travelImageView;
@property (nonatomic, strong)UIImageView *bottomImageView;
@property (nonatomic, strong)UIImageView *leftImageView;

@end

@implementation TourismViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
}

- (void)setUI{
    [self.navigationController setNavigationBarHidden:YES];
//    [self.view addSubview:self.bottomImageView];
//    [self.view addSubview:self.leftImageView];
    [self.view addSubview:self.travelImageView];
    [self setSuggest];
}

- (void)setSuggest{
    NSArray *icons = @[[UIImage imageNamed:@"亚洲"], [UIImage imageNamed:@"欧洲"], [UIImage imageNamed:@"北美"], [UIImage imageNamed:@"南美"], [UIImage imageNamed:@"大洋洲"], [UIImage imageNamed:@"非洲"]];
    CHPopUpMenu *popMenu = [[CHPopUpMenu alloc]initWithFrame:CGRectMake(kScreenWidth / 2 + 15, kScreenHeight * 2 / 3 - 40, 200, 200) direction:-M_PI iconArray:icons];
    if (isIphone5) {
        popMenu.frame = CGRectMake(kScreenWidth / 2, kScreenHeight * 2 / 3 - 60, 200, 200);
    }
    popMenu.travelBlock = ^(UIButton *travleView){
//        NSLog(@"%ld",(long)travleView.tag);
        switch (travleView.tag) {
            case 0:
                [self.travelImageView setImage:[UIImage imageNamed:@"亚.jpg"]];
                break;
            case 1:
                [self.travelImageView setImage:[UIImage imageNamed:@"欧.jpg"]];
                break;
            case 2:
                [self.travelImageView setImage:[UIImage imageNamed:@"北.jpg"]];
                break;
            case 3:
                [self.travelImageView setImage:[UIImage imageNamed:@"南.jpg"]];
                break;
            case 4:
                [self.travelImageView setImage:[UIImage imageNamed:@"奥.jpg"]];
                break;
            case 5:
                [self.travelImageView setImage:[UIImage imageNamed:@"非.jpg"]];
                break;
            default:
                break;
        }
        
        //增加简单的转场动画
        CATransition *ca = [CATransition animation];
        ca.type = @"fade";
        ca.subtype = kCATransitionFromRight;
        ca.duration = 1.0;
        ca.startProgress = 0;
        [self.travelImageView.layer addAnimation:ca forKey:nil];
    };
    
    [self.view addSubview:popMenu];
}

- (UIImageView *)travelImageView{
    if (_travelImageView == nil) {
        _travelImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight * 2 / 3 - 30)];
         [_travelImageView setImage:[UIImage imageNamed:@"亚.jpg"]];
        _travelImageView.backgroundColor = [UIColor clearColor];
        //给上方图片画弧
        CGSize finalSize = _travelImageView.frame.size;
        CGFloat layerHeight = 90;
        CAShapeLayer *layer = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        [path moveToPoint:CGPointMake(0, finalSize.height + 1)];
        [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height + 1)];
        [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height + 1 - layerHeight)];
        [path addQuadCurveToPoint:CGPointMake(0,finalSize.height + 1) controlPoint:CGPointMake(kScreenWidth / 2, finalSize.height)];
        layer.path = path.CGPath;
        layer.fillColor = [UIColor whiteColor].CGColor;
        [_travelImageView.layer addSublayer:layer];
    }
    return _travelImageView;
}

- (UIImageView *)bottomImageView{
    if (_bottomImageView == nil) {
        _bottomImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 344, kScreenWidth, 300)];
        [_bottomImageView setImage:[UIImage imageNamed:@"bottomImage"]];
    }
    return _bottomImageView;
}

- (UIImageView *)leftImageView{
    if (_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [_leftImageView setImage:[UIImage imageNamed:@"beach.jpg"]];
    }
    return _leftImageView;
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
