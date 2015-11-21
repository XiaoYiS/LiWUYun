//
//  ZTListDetailViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZTListDetailViewController.h"
#import "CategoriesViewController.h"

#import "ShouYeCell.h"
#import "CategoryDetailViewModel.h"
#import "ZTDetailHTMLViewController.h"


@interface ZTListDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) CategoryDetailViewModel *categoryVM;
@property (assign,nonatomic) NSInteger ID;
@property (strong,nonatomic) CategoriesViewController *vc;

@end

@implementation ZTListDetailViewController

- (CategoryDetailViewModel *)categoryVM{
    if (!_categoryVM) {
        _categoryVM = [[CategoryDetailViewModel alloc]initWithID:self.ID];
    }
    return _categoryVM;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[ShouYeCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.categoryVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.categoryVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.footer endRefreshingWithNoMoreData];
            }];
        }];
    }
    return _tableView;
}
- (CategoriesViewController *)vc{
    if (!_vc) {
        _vc = [CategoriesViewController standardCategoryContent];
    }
    return _vc;
}
- (id)initWithTitle:(NSString *)title Id:(NSInteger)ID{
    if (self = [super init]) {
        self.title = title;
        self.ID = ID;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [FactoryAdd addBackItemToVC:self];
    [self.tableView.header beginRefreshing];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 
    self.vc.customTabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.vc.customTabBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categoryVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShouYeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconIV.imageView setImageWithURL:[self.categoryVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"gif_introduce"]];
    cell.titleLb.text = [self.categoryVM titleForRow:indexPath.row];
    cell.likesCount.text = [self.categoryVM likesCountForRow:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 265;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZTDetailHTMLViewController *vc = [[ZTDetailHTMLViewController alloc]initWithURL:[self.categoryVM URLForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
    
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
