//
//  HMFriendGroup.h
//  StaticCell(qq)
//
//  Created by 胡猛 on 2016/11/27.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMFriendGroup : NSObject

@property (nonatomic, copy) NSString *name;
/**
 *  数组中装的都是HMFriend模型
 */
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, assign) int online;

/**
 *  标识这组是否需要展开,  YES : 展开 ,  NO : 关闭
 */
@property (nonatomic, assign, getter = isOpened) BOOL opened;

+ (instancetype)groupWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
