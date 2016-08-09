//
//  MineSortCell.m
//  travel
//
//  Created by 叶慧伟 on 16/8/9.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "MineSortCell.h"
#import "SortCollectionCell.h"

static NSString *const SortCollectionCellID = @"SortCollectionCellID";

@interface MineSortCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *sortCollectionView;
@property (nonatomic, strong)NSArray *imageArr;
@property (nonatomic, strong)NSArray *titleArr;

@end

@implementation MineSortCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setData];
        [self setUI];
    }
    return self;
}

- (void)setData{
    self.imageArr = @[@"美食", @"shape_journey", @"签证", @"收藏"];
    self.titleArr = @[@"美食", @"想去", @"签证", @"收藏"];
}

- (void)setUI{
    
    self.backgroundColor = [UIColor colorWithRed:242.0 / 255.0 green:242.0 / 255.0 blue:242.0 / 255.0 alpha:1];
    [self addSubview:self.sortCollectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SortCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SortCollectionCellID forIndexPath:indexPath];
    cell.titleStr = self.titleArr[indexPath.item];
    cell.imageStr = self.imageArr[indexPath.item];
    return cell;
}

#pragma mark --lazyload--
- (UICollectionView *)sortCollectionView{
    if (_sortCollectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 4, 80);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        _sortCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80) collectionViewLayout:flowLayout];
        [_sortCollectionView registerClass:[SortCollectionCell class] forCellWithReuseIdentifier:SortCollectionCellID];
        _sortCollectionView.delegate = self;
        _sortCollectionView.dataSource = self;
    }
    return _sortCollectionView;
}

@end
