//
//  TravelsViewController.m
//  travel
//
//  Created by 叶慧伟 on 16/5/25.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "TravelsViewController.h"
#import "TravelsTableViewCell.h"

static NSString *travelsTableViewCellID = @"travelsTableViewCellID";

@interface TravelsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)NSArray *titleDataArr;
@property (nonatomic, strong)NSArray *imageDataArr;

@end

@implementation TravelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getData];
    [self setUI];
}

- (void)setUI{
    [self.view addSubview:self.mainTableView];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)tabViewMove:(UIPanGestureRecognizer *)ges{
    switch (ges.state) {
        case UIGestureRecognizerStateBegan:{
//            CGPoint starPoint = [ges locationInView:self.view];
        }
            break;
            
        default:
            break;
    }
}

- (void)getData{
    self.titleDataArr = @[@"拉斯维加斯-鸡尾酒虾",@"澳洲大龙虾",@"日本水豆腐",@"沙爹",@"和果子",@"奥地利市中电车"];
    self.imageDataArr = @[@"youji1.jpg", @"youji2.jpg", @"youji3.jpg", @"youji4.jpg", @"youji5.jpg", @"youji6.jpg"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TravelsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:travelsTableViewCellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageStr = self.imageDataArr[indexPath.item];
    cell.titleStr = self.titleDataArr[indexPath.item];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}

- (UITableView *)mainTableView{
    if (_mainTableView == nil) {
        _mainTableView = [[UITableView alloc]init];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_mainTableView registerClass:[TravelsTableViewCell class] forCellReuseIdentifier:travelsTableViewCellID];
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        
//        UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(tabViewMove:)];
//        [_mainTableView addGestureRecognizer:ges];
        
    }
    return _mainTableView;
}

- (NSArray *)titleDataArr{
    if (_titleDataArr == nil) {
        _titleDataArr = [NSArray array];
    }
    return _titleDataArr;
}

- (NSArray *)imageDataArr{
    if (_imageDataArr == nil) {
        _imageDataArr = [NSArray array];
    }
    return _imageDataArr;
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
