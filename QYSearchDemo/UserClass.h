//
//  UserClass.h
//  BlueRhinoBMS
//
//  Created by qianye on 15/9/19.
//  Copyright © 2015年 qianye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserClass : NSObject

@property (copy, nonatomic) NSString *name;

@property (copy, nonatomic) NSString *pinyinName;

@property (copy, nonatomic) NSString *phone;

@property (assign, nonatomic) BOOL isComplete;


// 初始化方法
- (instancetype)initWithName:(NSString *)name phone:(NSString *)phone isComplete:(BOOL)isComplete;
@end
