//
//  MineViewController.m
//  travel
//
//  Created by 叶慧伟 on 16/5/25.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "MineViewController.h"
#import "HeaderTableViewCell.h"
#import "DetailTableViewCell.h"

static NSString *const HeaderTableViewCellID = @"HeaderTableViewCellID";
static NSString *const DetailTableViewCellID = @"DetailTableViewCellID";

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)NSArray *imageArr;
@property (nonatomic, strong)NSArray *titleArr;

@end

@implementation MineViewController

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
    [self.view addSubview:self.mainTableView];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.imageArr.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 20;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HeaderTableViewCellID forIndexPath:indexPath];
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
        return 104;
    }else{
        return 47;
    }
}

- (UITableView *)mainTableView{
    if (_mainTableView == nil) {
        _mainTableView = [[UITableView alloc]init];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_mainTableView registerClass:[HeaderTableViewCell class] forCellReuseIdentifier:HeaderTableViewCellID];
        [_mainTableView registerClass:[DetailTableViewCell class] forCellReuseIdentifier:DetailTableViewCellID];
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.backgroundColor = [UIColor colorWithRed:236.0 / 255.0 green:236.0 / 255.0 blue:236.0 / 255.0 alpha:1];
    }
    return _mainTableView;
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
