//
//  SearchTableViewCell.h
//  BlueRhinoBMS
//
//  Created by qianye on 15/9/21.
//  Copyright © 2015年 qianye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"


#define kScreenHeight        [UIScreen mainScreen].bounds.size.height
#define kScreenWidth         [UIScreen mainScreen].bounds.size.width

@class UserClass;

@interface SearchTableViewCell : UITableViewCell

@property (strong ,nonatomic) UserClass *user;

@end
