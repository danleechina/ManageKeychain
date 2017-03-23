//
//  DLTableViewCell.m
//  ManageKeychain
//
//  Created by Dan.Lee on 2017/3/23.
//  Copyright © 2017年 Dan Lee. All rights reserved.
//

#import "DLTableViewCell.h"

@implementation DLTableViewCell

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect oldFrame = self.textLabel.frame;
    oldFrame.size.width = self.bounds.size.width - 100;
    self.textLabel.frame = oldFrame;
}

@end
