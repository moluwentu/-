//
//  TranvelAnimaCell.m
//  travel
//
//  Created by 叶慧伟 on 16/7/15.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "TranvelAnimaCell.h"

@interface TranvelAnimaCell()

@property (nonatomic, strong)UIImageView *mainImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIView *coverView;

@end

@implementation TranvelAnimaCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    self.clipsToBounds = YES;
    
    [self.contentView addSubview:self.mainImageView];
    [self.contentView addSubview:self.coverView];
    [self.contentView addSubview:self.titleLabel];
    
    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self).offset(-20);
        make.bottom.equalTo(self).offset(40);
    }];
    
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.equalTo(@(30));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverView).offset(8);
        make.centerY.equalTo(self.coverView);
    }];

}

- (void)cellOnTable:(UITableView *)tableView didScrollow:(UIView *)view{
    //修改image的frame
    CGRect rect = [tableView convertRect:self.frame toView:view];
    //图片离屏幕中心的差距
    float distanceCenter = CGRectGetHeight(view.frame) / 2 - CGRectGetMinY(rect);
    //获取图片超出的部分
    float difference = CGRectGetHeight(self.mainImageView.frame) - CGRectGetHeight(self.frame);
    //移动图片
    float imageMove = (distanceCenter / CGRectGetHeight(view.frame)) * difference;
    CGRect orignRect = self.mainImageView.frame;
    orignRect.origin.y = imageMove - (difference / 2);
    self.mainImageView.frame = orignRect;
}

#pragma mark --setter
- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    [self.mainImageView setImage:[UIImage imageNamed:imageStr]];
}

- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}

#pragma mark --lazyload
- (UIImageView *)mainImageView{
    if (_mainImageView == nil) {
        _mainImageView = [[UIImageView alloc]init];
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
    }
    return _coverView;
}


@end
