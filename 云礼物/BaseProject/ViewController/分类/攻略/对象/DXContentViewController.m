//
//  DXContentViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DXContentViewController.h"
#import "ShouYeCell.h"
#import "GLDXViewModel.h"
#import "DXDetailViewController.h"
@interface DXContentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) GLDXViewModel *dxVM;

@end

@implementation DXContentViewController

- (GLDXViewModel *)dxVM{
    if (!_dxVM) {
        _dxVM = [[GLDXViewModel alloc]initWithdxType:self.type.integerValue];
    }
    return _dxVM;
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
            [self.dxVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.dxVM getMoreDataCompletionHandle:^(NSError *error) {
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
    // Do any additional setup after loading the view.
    [self.tableView.header beginRefreshing];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dxVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShouYeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconIV.imageView setImageWithURL:[self.dxVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"gif_introduce"]];
    cell.titleLb.text = [self.dxVM titleForRow:indexPath.row];
    cell.likesCount.text = [self.dxVM likesCountForRow:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 265;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //跳转
        DXDetailViewController *vc = [[DXDetailViewController alloc]initWithURL:[self.dxVM URLForRow:indexPath.row]];
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
