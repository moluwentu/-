//
//  SortCollectionCell.m
//  travel
//
//  Created by 叶慧伟 on 16/8/9.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "SortCollectionCell.h"

@interface SortCollectionCell ()

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *label;

@end

@implementation SortCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.imageView];
    [self addSubview:self.label];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-10);
        make.width.height.equalTo(@40);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.imageView.mas_bottom);
    }];
}

- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    [self.imageView setImage:[UIImage imageNamed:imageStr]];
}

- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.label.text = titleStr;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

- (UILabel *)label{
    if (_label == nil) {
        _label = [[UILabel alloc]init];
        _label.font = [UIFont systemFontOfSize:15];
        _label.textColor = [UIColor darkGrayColor];
    }
    return _label;
}

@end
