//
//  TravelsViewController.m
//  travel
//
//  Created by 叶慧伟 on 16/5/25.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "TravelsViewController.h"
#import "TranvelAnimaCell.h"
#import <MJRefresh.h>

static NSString *TranvelAnimaCellID = @"TranvelAnimaCellID";

@interface TravelsViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)NSArray *titleDataArr;
@property (nonatomic, strong)NSArray *imageDataArr;
@property (nonatomic, strong)MJRefreshNormalHeader *headerFresh;

@end

@implementation TravelsViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self scrollViewDidScroll:[UIScrollView new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    [self getData];
    [self setUI];
}

- (void)setUI{
    self.mainTableView.mj_header = self.headerFresh;
    
    [self.view addSubview:self.mainTableView];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
        make.top.equalTo(self.view).offset(-20);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (void)getData{
    self.titleDataArr = @[@"拉斯维加斯-鸡尾酒虾",@"澳洲大龙虾",@"心的方向",@"日本水豆腐",@"沙爹",@"和果子",@"奥地利市中电车"];
    self.imageDataArr = @[@"youji1.jpg", @"youji2.jpg",@"youji7.jpg", @"youji3.jpg", @"youji4.jpg", @"youji5.jpg", @"youji6.jpg"];
}

- (void)refreashData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.mainTableView.mj_header endRefreshingWithCompletionBlock:^{
             NSLog(@"hehe");
        }];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TranvelAnimaCell *cell = [tableView dequeueReusableCellWithIdentifier:TranvelAnimaCellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageStr = self.imageDataArr[indexPath.item];
    cell.titleStr = self.titleDataArr[indexPath.item];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//获取可视视图
    NSArray *visCells = [self.mainTableView visibleCells];
    
    for (TranvelAnimaCell *cell in visCells) {
        [cell cellOnTable:self.mainTableView didScrollow:self.view];
    }
}

- (UITableView *)mainTableView{
    if (_mainTableView == nil) {
        _mainTableView = [[UITableView alloc]init];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_mainTableView registerClass:[TranvelAnimaCell class] forCellReuseIdentifier:TranvelAnimaCellID];
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.rowHeight = 200;
        
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

- (MJRefreshNormalHeader *)headerFresh{
    if (_headerFresh == nil) {
        _headerFresh = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreashData)];
        _headerFresh.lastUpdatedTimeLabel.hidden = YES;
        [_headerFresh setTitle:@"下拉加载" forState:MJRefreshStateIdle];
        [_headerFresh setTitle:@"松开加载~" forState:MJRefreshStatePulling];
        [_headerFresh setTitle:@"加载中 ..." forState:MJRefreshStateRefreshing];
        [_headerFresh setTitle:@"加载完成" forState:MJRefreshStateWillRefresh];
    }
    return _headerFresh;
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
