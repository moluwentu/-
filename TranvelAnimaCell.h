//
//  TranvelAnimaCell.h
//  travel
//
//  Created by 叶慧伟 on 16/7/15.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TranvelAnimaCell : UITableViewCell

@property (nonatomic, strong)NSString *imageStr;
@property (nonatomic, strong)NSString *titleStr;

- (void)cellOnTable:(UITableView *)tableView didScrollow:(UIView *)view;

@end
