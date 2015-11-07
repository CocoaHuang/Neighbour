//
//  CentreTableViewCell.m
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "CentreTableViewCell.h"

@implementation CentreTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(BaseCellModel *)model
{
    _model = model;
    if ([NSStringFromClass([model class]) isEqualToString:@"ArrowCellModel"]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else {
        self.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

@end
