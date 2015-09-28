//
//  SearchUserViewController.m
//  BlueRhinoBMS
//
//  Created by qianye on 15/9/16.
//  Copyright (c) 2015年 qianye. All rights reserved.
//

#import "SearchUserViewController.h"

#import "UserClass.h"



@interface SearchUserViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@end

@implementation SearchUserViewController
{
    UITextField *_searchTextField;
    UITableView *_tableView;
    NSArray *_dataList;
//    UIButton *_searchBtn;
    NSArray *_allDataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"搜索我的客户";
    
    [self _initWithViews];
    
    // 加载数据
    [self _loadData];
    
}

#pragma mark - 初始化界面
- (void)_initWithViews
{
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(14, 10 + 64, kScreenWidth - 14 * 2, 44)];
    _searchTextField.placeholder = @"请输入要查找的手机号或姓名";
    _searchTextField.font = [UIFont systemFontOfSize:16];
    _searchTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _searchTextField.layer.borderWidth = 1;
    _searchTextField.delegate = self;
    _searchTextField.returnKeyType = UIReturnKeyDone;
    _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    _searchTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 22, 40)];
    [_searchTextField addTarget:self action:@selector(searchContextChange:) forControlEvents:UIControlEventAllEditingEvents];
    [self.view addSubview:_searchTextField];
    
    // 搜索结果
    _tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, _searchTextField.bottom + 10, kScreenWidth, kScreenHeight - 64 - 10 * 2 - 40) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView = nil;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
}

#pragma mark - 加载数据
- (void)_loadData
{
    UserClass *user1 = [[UserClass alloc] initWithName:@"小胖" phone:@"13501101797" isComplete:YES];
    UserClass *user2 = [[UserClass alloc] initWithName:@"小生生" phone:@"13810220405" isComplete:NO];
    UserClass *user3 = [[UserClass alloc] initWithName:@"大雄" phone:@"13521320327" isComplete:YES];
    UserClass *user4 = [[UserClass alloc] initWithName:@"木木" phone:@"18500157270" isComplete:YES];
    UserClass *user5 = [[UserClass alloc] initWithName:@"小乐" phone:@"13910220549" isComplete:YES];
    UserClass *user6 = [[UserClass alloc] initWithName:@"小银" phone:@"59428842" isComplete:YES];
    UserClass *user7 = [[UserClass alloc] initWithName:@"催话费的移动" phone:@"10086" isComplete:NO];
    UserClass *user8 = [[UserClass alloc] initWithName:@"电信" phone:@"10000" isComplete:NO];
    UserClass *user9 = [[UserClass alloc] initWithName:@"柯南" phone:@"110" isComplete:YES];
    _allDataList = @[user1,user2,user3,user4,user5,user6,user7,user8,user9];
    _dataList = _allDataList;
    [_tableView reloadData];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)searchContextChange:(UITextField *)textField
{
    NSString *predicateString = [NSString stringWithFormat:@"phone like '%@*' || name like '*%@*' || pinyinName like[cd] '%@*'",textField.text,textField.text,textField.text];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString];
    if (![_dataList isEqual:[_allDataList filteredArrayUsingPredicate:predicate]]) {
        _dataList = [_allDataList filteredArrayUsingPredicate:predicate];
        [_tableView reloadData];
    }
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if (![textField.text isEqualToString:@""] && [string isEqualToString:@""] && textField.text.length == 1) {
//        MyLog(@"当前内容为空");
//    }
//    return YES;
//}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataList.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *iden = @"user_cell";
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[SearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    cell.user = _dataList[indexPath.section];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

@end
