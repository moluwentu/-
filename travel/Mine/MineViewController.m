//
//  MineViewController.m
//  travel
//
//  Created by 叶慧伟 on 16/5/25.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "MineViewController.h"
#import "DetailTableViewCell.h"
#import "MineHeaderView.h"
#import "MineSortCell.h"
#import "TravleMapVC.h"

static NSString *const MineSortCellID = @"MineSortCellID";
static NSString *const DetailTableViewCellID = @"DetailTableViewCellID";

#define headerHeight 220
#define minOffetY -150

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)MineHeaderView *headerView;
@property (nonatomic, strong)NSArray *imageArr;
@property (nonatomic, strong)NSArray *titleArr;

@end

@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setData];
    [self setUI];
}

- (void)setData{
    self.imageArr = @[@"旅游",@"旅游线路",@"行程",@"行李",@"旅游咨询"];
    self.titleArr = @[@"我的路线",@"我的游记",@"我的行程",@"我的行李",@"帮我咨询"];
}

- (void)setUI{
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:self.mainTableView];
    [self.mainTableView addSubview:self.headerView];
}

#pragma mark -- delegate --
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return self.imageArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MineSortCell *cell = [tableView dequeueReusableCellWithIdentifier:MineSortCellID forIndexPath:indexPath];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailTableViewCellID forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageStr = self.imageArr[indexPath.row];
        cell.nameStr = self.titleArr[indexPath.row];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 87;
    }else{
        return 50;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.row == 0) {
        TravleMapVC *mapVC = [[TravleMapVC alloc]init];
        mapVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mapVC animated:YES];
    }
}

#pragma mark --lazyload--
- (UITableView *)mainTableView{
    if (_mainTableView == nil) {
        _mainTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _mainTableView.contentInset = UIEdgeInsetsMake(headerHeight, 0, 0, 0);
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_mainTableView registerClass:[DetailTableViewCell class] forCellReuseIdentifier:DetailTableViewCellID];
        [_mainTableView registerClass:[MineSortCell class] forCellReuseIdentifier:MineSortCellID];
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.backgroundColor = [UIColor colorWithRed:236.0 / 255.0 green:236.0 / 255.0 blue:236.0 / 255.0 alpha:1];
    }
    return _mainTableView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat offsetX = (offsetY + headerHeight) / 2;
//    NSLog(@"%f",offsetY);
    if (offsetY < -headerHeight) {
        CGRect rect = self.headerView.frame;
        rect.origin.y = offsetY;
        rect.size.height = -offsetY;
        rect.origin.x = offsetX;
        rect.size.width = [UIScreen mainScreen].bounds.size.width + fabs(offsetX) * 2;
        self.headerView.frame = rect;
    }else if(offsetY > -headerHeight && offsetY <minOffetY){
        CGRect rect = self.headerView.frame;
        rect.origin.y = offsetY;
        rect.size.height = -offsetY;
        self.headerView.frame = rect;
    }
}

#pragma mark -- lazyload --
- (MineHeaderView *)headerView{
    if (_headerView == nil) {
        _headerView = [[MineHeaderView alloc]initWithFrame:CGRectMake(0, -headerHeight, [UIScreen mainScreen].bounds.size.width, headerHeight)];
    }
    return _headerView;
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
