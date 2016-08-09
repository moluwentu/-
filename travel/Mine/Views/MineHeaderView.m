//
//  MineHeaderView.m
//  travel
//
//  Created by 叶慧伟 on 16/8/9.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "MineHeaderView.h"

#define WIDTH 100

@interface MineHeaderView ()

@property (nonatomic, strong)UIImageView *headerImageView;
@property (nonatomic, strong)UIImageView *backImageView;
@property (nonatomic, strong)CALayer *headerLayer;

@end

@implementation MineHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self addSubview:self.backImageView];
    [self addSubview:self.headerImageView];
    UIBlurEffect *effet = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effetView = [[UIVisualEffectView alloc]initWithEffect:effet];
    effetView.alpha = 0.9;
    [self.backImageView addSubview:effetView];
    
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.height.equalTo(@WIDTH);
    }];
    
    [effetView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (UIImageView *)headerImageView{
    if (_headerImageView == nil) {
        _headerImageView = [[UIImageView alloc]init];
        [_headerImageView setImage:[UIImage imageNamed:@"header"]];
        _headerImageView.layer.cornerRadius = WIDTH / 2;
        _headerImageView.clipsToBounds = YES;
    }
    return _headerImageView;
}

- (UIImageView *)backImageView{
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc]init];
        [_backImageView setImage:[UIImage imageNamed:@"beach"]];
    }
    return _backImageView;
}

@end
