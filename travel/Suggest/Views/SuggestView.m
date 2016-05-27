//
//  SuggestView.m
//  travel
//
//  Created by 叶慧伟 on 16/5/25.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "SuggestView.h"
#import "TravelsTableViewCell.h"

static NSString *const travelsTableViewCellID = @"travelsTableViewCellID";

@interface SuggestView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign)CGPoint originCenter;
@property (nonatomic, assign)CGRect originFrame;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)NSArray *titleArr;
@property (nonatomic, strong)NSArray *imageArr;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UILabel *secondLabel;

@end

@implementation SuggestView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.titleArr = @[@"欧洲古堡游", @"亲近自然的旅行", @"乐园游"];
        self.imageArr = @[@"推荐1.jpg",@"推荐2.jpg",@"推荐3.jpg"];
        
        self.originFrame = frame;
        self.userInteractionEnabled = YES;
        UIPanGestureRecognizer *panGrs = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panned:)];
        [self addGestureRecognizer:panGrs];
        
        [self setlay];
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self addSubview:self.titleLabel];
    [self addSubview:self.mainTableView];
    [self addSubview:self.secondLabel];
    [self addSubview:self.lineView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(@70);
    }];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.titleLabel).offset(80);
    }];
    
    [self.secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel).offset(45);
        make.centerX.equalTo(self);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel).offset(35);
        make.centerX.equalTo(self);
        make.height.equalTo(@1);
        make.width.equalTo(self.secondLabel);
    }];
}

- (void)panned:(UIPanGestureRecognizer *)panGes{
    
    switch (panGes.state) {
        case UIGestureRecognizerStateBegan:{
            self.originCenter = self.center;
        }
            break;
        case UIGestureRecognizerStateChanged:{
            CGFloat panTransY = [panGes translationInView:self].y;

            if (self.moveBlock) {
                self.moveBlock(panTransY);
            }
            NSLog(@"%zd",panTransY);
            CGPoint panCenter = self.center;
            panCenter.y = panTransY + self.originCenter.y;
            self.center = panCenter;
        }
            
        case UIGestureRecognizerStateEnded:{
            [self endPan];
        }
        default:
            break;
    }
}

- (void)endPan{
    if (self.frame.origin.y > [UIScreen mainScreen].bounds.size.height - 100) {
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = self.originFrame;
        }];
    }
}

- (void)setlay{
    CGSize finalSize = self.frame.size;
    CGFloat layerHeight = 70;
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, layerHeight)];
    [path addLineToPoint:CGPointMake(0, finalSize.height)];
    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height)];
    [path addLineToPoint:CGPointMake(finalSize.width, layerHeight)];
    [path addQuadCurveToPoint:CGPointMake(0,layerHeight) controlPoint:CGPointMake(finalSize.width / 2, 0)];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:layer];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TravelsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:travelsTableViewCellID forIndexPath:indexPath];
    cell.titleStr = self.titleArr[indexPath.row];
    cell.imageStr = self.imageArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"精品旅行";
        _titleLabel.font = [UIFont systemFontOfSize:25];
//        _titleLabel
    }
    return _titleLabel;
}

- (UILabel *)secondLabel{
    if (_secondLabel == nil) {
        _secondLabel = [[UILabel alloc]init];
        _secondLabel.text = @"发现·本周精选";
        _secondLabel.font = [UIFont systemFontOfSize:20];
        _secondLabel.textColor = [UIColor darkGrayColor];
    }
    return _secondLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}

- (UITableView *)mainTableView{
    if (_mainTableView == nil) {
        _mainTableView = [[UITableView alloc]init];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_mainTableView registerClass:[TravelsTableViewCell class] forCellReuseIdentifier:travelsTableViewCellID];
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.bounces = NO;
    }
    return _mainTableView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
