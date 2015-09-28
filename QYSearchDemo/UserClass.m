//
//  UserClass.m
//  BlueRhinoBMS
//
//  Created by qianye on 15/9/19.
//  Copyright © 2015年 qianye. All rights reserved.
//

#import "UserClass.h"

@implementation UserClass

- (instancetype)initWithName:(NSString *)name phone:(NSString *)phone isComplete:(BOOL)isComplete
{
    if (self = [super init]) {
        self.name = name;
        self.phone = phone;
        self.isComplete = isComplete;
        NSMutableString *ms = [[NSMutableString alloc] initWithString:name];
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
            
        }
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
            self.pinyinName = ms;
        }
    }
    return self;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"姓名：%@--拼音名：%@--手机号：%@--信息是否完善：%d",_name,_pinyinName,_phone,_isComplete];
}

@end
