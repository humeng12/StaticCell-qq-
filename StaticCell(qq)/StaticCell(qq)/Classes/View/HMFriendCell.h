//
//  HMFriendCell.h
//  StaticCell(qq)
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMFriend;

@interface HMFriendCell : UITableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView;
// friend是C++的关键字,不能用friend作为属性名
@property (nonatomic, strong) HMFriend *friendData;

@end
