//
//  ZTViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZTViewController.h"
#import "CategoryCell.h"
#import "ListDetailViewModel.h"
#import "ZTListDetailViewController.h"
#import "ShowResoultTableViewController.h"
@interface ZTViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchBarDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSArray *listArr;
@property (strong,nonatomic) ListDetailViewModel *listVM;
//记录搜索框
@property (strong,nonatomic) UISearchController *searchController;
//展示结果的表视图控制器
@property (strong,nonatomic) ShowResoultTableViewController *showResoultVC;
@end

@implementation ZTViewController

- (ListDetailViewModel *)listVM{
    if (!_listVM) {
        _listVM = [ListDetailViewModel new];
    }
    return _listVM;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[CategoryCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.listVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.listVM getMoreDataCompletionHandle:^(NSError *error) {
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
    [FactoryAdd addMenuItemToVC:self];
    self.title = @"专题";
    [self.tableView.header beginRefreshing];
    //搜索功能
    self.showResoultVC = [ShowResoultTableViewController new];
    //创建搜索控制器
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:self.showResoultVC];
    [self.searchController.searchBar sizeToFit];//搜索框的尺寸合适
    self.tableView.tableHeaderView = self.searchController.searchBar;
    //设置更新代理对象
    self.searchController.searchResultsUpdater = self;
    //视图切换
    self.definesPresentationContext = YES;
    //为了点击其他按钮野可以搜索，设置代理
    self.searchController.searchBar.delegate = self;
}
#pragma mark - UISearchResultsUpdating协议
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    //获取输入的文字内容
    NSString *searchText = searchController.searchBar.text;
    //与数据的对应
    NSMutableArray *resoultArray = [NSMutableArray array];
    for (ListDataCollectionsModel *model in self.listVM.dataArr) {
        NSRange range = [model.title rangeOfString:searchText];
        if (range.length > 0) {
            [resoultArray addObject:model];
        }
    }
        self.showResoultVC.resoultArray= resoultArray;
    //跟新视图县hi内容
    [self.showResoultVC.tableView reloadData];
}
#pragma mark - UISearchBarDelegate协议
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    [self updateSearchResultsForSearchController:self.searchController];
    
}
#pragma mark - UITableViewDelegate协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.listVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    [cell.iconIV.imageView setImageWithURL:[self.listVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"gif_introduce"]];
    cell.titleLb.text = [self.listVM titleForRow:indexPath.row];
    cell.subtitle.text = [self.listVM subTitleForRow:indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ZTListDetailViewController *vc = [[ZTListDetailViewController alloc]initWithTitle:[self.listVM titleForRow:indexPath.row] Id:[self.listVM IdForRow:indexPath.row]];
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
