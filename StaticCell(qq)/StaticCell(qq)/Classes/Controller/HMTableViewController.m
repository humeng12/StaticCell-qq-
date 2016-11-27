//
//  HMTableViewController.m
//  StaticCell(qq)
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "HMTableViewController.h"
#import "HMFriendGroup.h"
#import "HMFriend.h"
#import "HMHeaderView.h"
#import "HMFriendCell.h"

@interface HMTableViewController ()<HMHeaderViewDelegate>
@property (nonatomic, strong) NSArray *groups;

@end

@implementation HMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 每一行cell的高度
    self.tableView.rowHeight = 50;
    // 每一组头部控件的高度
    self.tableView.sectionHeaderHeight = 44;
}


- (NSArray *)groups
{
    if (_groups == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
        
        NSMutableArray *groupArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            HMFriendGroup *group = [HMFriendGroup groupWithDict:dict];
            [groupArray addObject:group];
        }
        
        _groups = groupArray;
    }
    return _groups;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}



#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    HMFriendGroup *group = self.groups[section];
    
    return (group.isOpened ? group.friends.count : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    HMFriendCell *cell = [HMFriendCell cellWithTableView:tableView];
    
    // 2.设置cell的数据
    HMFriendGroup *group = self.groups[indexPath.section];
    cell.friendData = group.friends[indexPath.row];
    
    return cell;
}



/**
 *  返回每一组需要显示的头部标题(字符出纳)
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 1.创建头部控件
    HMHeaderView *header = [HMHeaderView headerViewWithTableView:tableView];
    header.delegate = self;
    
    // 2.给header设置数据(给header传递模型)
    header.group = self.groups[section];
    
    return header;
}



#pragma mark - headerView的代理方法
/**
 *  点击了headerView上面的名字按钮时就会调用
 */
- (void)headerViewDidClickedNameView:(HMHeaderView *)headerView
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
