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
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
