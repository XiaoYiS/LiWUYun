//
//  LWViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LWViewController.h"

#import "LiWuCell.h"
#import "LiWuViewModel.h"

@interface LWViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) LiWuViewModel *lwVM;

@end

@implementation LWViewController

- (LiWuViewModel *)lwVM{
    if (!_lwVM) {
        _lwVM = [LiWuViewModel new];
    }
    return _lwVM;
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
        [_tableView registerClass:[LiWuCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.lwVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.lwVM getMoreDataCompletionHandle:^(NSError *error) {
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
    self.title = @"礼物预览";
    [FactoryAdd addMenuItemToVC:self];
    [self.tableView.header beginRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.lwVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LiWuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconIV.imageView setImageWithURL:[self.lwVM picURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"gif_introduce"]];
    cell.titleLb.text = [self.lwVM titleForRow:indexPath.row];
    cell.timeLb.text = [self.lwVM addTimeForRow:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 265;
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
