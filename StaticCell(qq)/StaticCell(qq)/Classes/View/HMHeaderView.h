//
//  HMHeaderView.h
//  StaticCell(qq)
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMFriendGroup, HMHeaderView;


@protocol HMHeaderViewDelegate <NSObject>
@optional
- (void)headerViewDidClickedNameView:(HMHeaderView *)headerView;
@end

@interface HMHeaderView : UITableViewHeaderFooterView


+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) HMFriendGroup *group;

@property (nonatomic, weak) id<HMHeaderViewDelegate> delegate;

@end
