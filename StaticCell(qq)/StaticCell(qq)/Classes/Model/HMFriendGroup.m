//
//  HMFriendGroup.m
//  StaticCell(qq)
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "HMFriendGroup.h"
#import "HMFriend.h"

@implementation HMFriendGroup


+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 1.注入所有属性
        [self setValuesForKeysWithDictionary:dict];
        
        // 2.特殊处理friends属性
        NSMutableArray *friendArray = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            HMFriend *friend = [HMFriend friendWithDict:dict];
            [friendArray addObject:friend];
        }
        self.friends = friendArray;
    }
    return self;
}

@end
