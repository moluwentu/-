//
//  TravelsTableViewCell.m
//  travel
//
//  Created by 叶慧伟 on 16/5/26.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "TravelsTableViewCell.h"

@interface TravelsTableViewCell()

@property (nonatomic, strong)UIImageView *mainImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIView *coverView;

@end

@implementation TravelsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self.contentView addSubview:self.mainImageView];
    [self.contentView addSubview:self.coverView];
    [self.contentView addSubview:self.titleLabel];
    
    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(4);
        make.bottom.equalTo(self.contentView).offset(-4);
        make.left.equalTo(self.contentView).offset(6);
        make.right.equalTo(self.contentView).offset(-6);
    }];
    
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).offset(-4);
        make.left.equalTo(self.contentView).offset(6);
        make.right.equalTo(self.contentView).offset(-6);
        make.height.equalTo(@(30));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverView).offset(8);
        make.centerY.equalTo(self.coverView);
    }];
}

- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}

- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    [self.mainImageView setImage:[UIImage imageNamed:imageStr]];
}

- (UIImageView *)mainImageView{
    if (_mainImageView == nil) {
        _mainImageView = [[UIImageView alloc]init];
        _mainImageView.layer.cornerRadius = 3;
        _mainImageView.clipsToBounds = YES;
//        _mainImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _mainImageView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UIView *)coverView{
    if (_coverView == nil) {
        _coverView = [[UIView alloc]init];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.3;
        _coverView.layer.cornerRadius = 3;
        _coverView.layer.masksToBounds = YES;
    }
    return _coverView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
