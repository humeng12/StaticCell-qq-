//
//  HMFriendCell.m
//  StaticCell(qq)
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "HMFriendCell.h"
#import "HMFriend.h"

@implementation HMFriendCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"friend";
    HMFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HMFriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setFriendData:(HMFriend *)friendData
{
    _friendData = friendData;
    
    self.imageView.image = [UIImage imageNamed:friendData.icon];
    self.textLabel.text = friendData.name;
    self.textLabel.textColor = friendData.isVip ? [UIColor redColor] : [UIColor blackColor];
    self.detailTextLabel.text = friendData.intro;
}

@end
