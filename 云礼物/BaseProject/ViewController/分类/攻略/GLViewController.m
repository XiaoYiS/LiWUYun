//
//  GLViewController.m
//  BaseProject
//
//  Created by apple-jd12 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GLViewController.h"
#import "PLContraintViewController.h"
#import "FGContrsintViewController.h"
#import "DXContrsintViewController.h"
#import "CHContrsintViewController.h"
@interface GLViewController ()
@property (strong,nonatomic) NSArray *arr;

@end

@implementation GLViewController

- (NSArray *)arr{
    if (!_arr) {
        _arr = @[@"品类",@"对象",@"场合",@"风格"];
    }
    return _arr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.tableFooterView = [UIView new];
    self.title = @"攻略";
    [FactoryAdd addMenuItemToVC:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"Cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:@"ImageError"];
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}
kRemoveCellSeparator

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //"品类",@"对象",@"场合",@"风格"
    if (indexPath.row == 0) {
        PLContraintViewController *plVC = [PLContraintViewController standardPLContentNav];
        plVC.title = self.arr[indexPath.row];
        plVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:plVC animated:YES];
    }
    if (indexPath.row == 1) {
        DXContrsintViewController *dxVC = [DXContrsintViewController standardDXContentNav];
        dxVC.title = self.arr[indexPath.row];
        dxVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dxVC animated:YES];
    }
    if (indexPath.row == 2) {
        CHContrsintViewController *chVC = [CHContrsintViewController standardCHContentNav];
        chVC.title = self.arr[indexPath.row];
        chVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:chVC animated:YES];
    }
    if (indexPath.row == 3) {
        FGContrsintViewController *fgVC = [FGContrsintViewController standardFGContentNav];
        fgVC.title = self.arr[indexPath.row];
        fgVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fgVC animated:YES];
    }
    
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
