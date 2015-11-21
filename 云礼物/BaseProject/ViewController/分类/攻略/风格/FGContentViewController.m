//
//  FGContentViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FGContentViewController.h"
#import "ShouYeCell.h"
#import "FGDetailViewController.h"
#import "GLFGViewModel.h"
@interface FGContentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) GLFGViewModel *fgVM;

@end

@implementation FGContentViewController

- (GLFGViewModel *)fgVM{
    if (!_fgVM) {
        _fgVM = [[GLFGViewModel alloc]initWithfgType:self.type.integerValue];
    }
    return _fgVM;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //        _tableView.estimatedRowHeight = 90;
        [self.view addSubview:_tableView];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[ShouYeCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.fgVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.fgVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.footer endRefreshing];
            }];
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.header beginRefreshing];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.fgVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShouYeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconIV.imageView setImageWithURL:[self.fgVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"gif_introduce"]];
    cell.titleLb.text = [self.fgVM titleForRow:indexPath.row];
    cell.likesCount.text = [self.fgVM likesCountForRow:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 265;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //跳转
    FGDetailViewController *vc = [[FGDetailViewController alloc]initWithURL:[self.fgVM URLForRow:indexPath.row]];
    //    DXDetailViewController *vc = [[DXDetailViewController alloc]initWithURLStr:[self.dxVM urlForRow:indexPath.row]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
