//
//  HeaderTableViewCell.m
//  travel
//
//  Created by 叶慧伟 on 16/5/30.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "HeaderTableViewCell.h"

@interface HeaderTableViewCell ()

@property (nonatomic, strong)UIImageView *headerImage;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *levelLabel;

@end

@implementation HeaderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self.contentView addSubview:self.headerImage];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.levelLabel];
    
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(8);
        make.width.height.equalTo(@80);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView).offset(-16);
        make.left.equalTo(self.headerImage.mas_right).offset(12);
    }];
    
    [self.levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView).offset(16);
        make.left.equalTo(self.headerImage.mas_right).offset(12);
    }];
}

- (UIImageView *)headerImage{
    if (_headerImage == nil) {
        _headerImage = [[UIImageView alloc]init];
        [_headerImage setImage:[UIImage imageNamed:@"123"]];
        
        _headerImage.layer.cornerRadius = 40;
        _headerImage.layer.masksToBounds = YES;
    }
    return _headerImage;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.text = @"跟我走，带你飞！";
    }
    return _nameLabel;
}

- (UILabel *)levelLabel{
    if (_levelLabel == nil) {
        _levelLabel = [[UILabel alloc]init];
        _levelLabel.text = @"level 5";
        _levelLabel.textColor = [UIColor redColor];
    }
    return _levelLabel;
}

@end
