//
//  SearchTableViewCell.m
//  BlueRhinoBMS
//
//  Created by qianye on 15/9/21.
//  Copyright © 2015年 qianye. All rights reserved.
//

#import "SearchTableViewCell.h"

#import "UserClass.h"


@implementation SearchTableViewCell
{
    UILabel *_completeLabel;
    UILabel *_nameLabel;
    UILabel *_phoneLable;
}

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _completeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _completeLabel.textColor = [UIColor redColor];
        _completeLabel.text = @"【未】";
        _completeLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_completeLabel];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_nameLabel];
        
        _phoneLable = [[UILabel alloc] initWithFrame:CGRectZero];
        _phoneLable.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_phoneLable];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    if (_user.isComplete) {
        _completeLabel.hidden = NO;
        _completeLabel.frame = CGRectMake(0, (40 - 21) / 2.0, 50, 21);
    }else {
        _completeLabel.hidden = YES;
        _completeLabel.frame = CGRectMake(0, (40 - 21) / 2.0, 10, 21);
    }
    
    _nameLabel.frame = CGRectMake(_completeLabel.right, _completeLabel.top, 62, 21);
    _nameLabel.text = _user.name;
    [_nameLabel sizeToFit];
    if (_nameLabel.width >= 62) {
        _nameLabel.width = 62;
    }
    
    _phoneLable.frame = CGRectMake(_nameLabel.right, _nameLabel.top, kScreenWidth - _nameLabel.right - 14, 21);
    _phoneLable.text = [NSString stringWithFormat:@"-%@",_user.phone];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
