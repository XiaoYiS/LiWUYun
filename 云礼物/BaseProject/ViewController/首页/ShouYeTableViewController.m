//
//  ShouYeTableViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShouYeTableViewController.h"
#import "ShouYeViewModel.h"
#import "ShouYeCell.h"

#import "ShouYeDetailViewController.h"
@interface ShouYeTableViewController ()

@property (strong,nonatomic) ShouYeViewModel *shouYeVM;
@end

@implementation ShouYeTableViewController

- (ShouYeViewModel *)shouYeVM{
    if (!_shouYeVM) {
        _shouYeVM = [[ShouYeViewModel alloc]initWithShouYeListType:_type.integerValue];
    }
    return _shouYeVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[ShouYeCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.shouYeVM refreshDataCompletionHandle:^(NSError *error) {
         
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.shouYeVM getMoreDataCompletionHandle:^(NSError *error) {
          
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.shouYeVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShouYeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"forIndexPath:indexPath];
    
    // Configure the cell...
  
    
    [cell.iconIV.imageView setImageWithURL:[self.shouYeVM coverImgForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"gif_introduce"]];
    cell.titleLb.text = [self.shouYeVM titlegForRow:indexPath.row];
    cell.likesCount.text = [self.shouYeVM likesCountForRow:indexPath.row];
    [cell handleButtonAction:^(NSString *str) {
        NSLog(@"=== %@",str);
        cell.likesCount.text = str;
    }];
    return cell;
}
kRemoveCellSeparator
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 265;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //弹出详情按钮
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ShouYeDetailViewController *vc = [[ShouYeDetailViewController alloc]initWithID:[self.shouYeVM IDForRow:indexPath.row]];
    vc.title = @"攻略详情";
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
