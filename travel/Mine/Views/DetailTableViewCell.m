//
//  DetailTableViewCell.m
//  travel
//
//  Created by 叶慧伟 on 16/5/30.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "DetailTableViewCell.h"

@interface DetailTableViewCell ()

@property (nonatomic, strong)UIImageView *titleImage;
@property (nonatomic, strong)UILabel *mainLabel;
@property (nonatomic, strong)UIView *lineView;

@end

@implementation DetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self.contentView addSubview:self.titleImage];
    [self.contentView addSubview:self.mainLabel];
    [self.contentView addSubview:self.lineView];
    
    [self.titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(@35);
    }];
    
    [self.mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.titleImage.mas_right).offset(12);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleImage.mas_right);
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@0.5);
        make.right.equalTo(self.contentView);
    }];
}

- (void)setNameStr:(NSString *)nameStr{
    _nameStr = nameStr;
    self.mainLabel.text = nameStr;
}

- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    [self.titleImage setImage:[UIImage imageNamed:imageStr]];
}

- (UIImageView *)titleImage{
    if (_titleImage == nil) {
        _titleImage = [[UIImageView alloc]init];
    }
    return _titleImage;
}

- (UILabel *)mainLabel{
    if (_mainLabel == nil) {
        _mainLabel = [[UILabel alloc]init];
    }
    return _mainLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}

@end
