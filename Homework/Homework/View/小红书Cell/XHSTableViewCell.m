//
//  XHSTableViewCell.m
//  Homework
//
//  Created by xihou damowang on 2020/8/9.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "XHSTableViewCell.h"

@implementation XHSTableViewCell

+ (instancetype)cellWithTableview:(UITableView *)tableView {
    static NSString *XTCELL = @"xiaohongshutableviewcell";
    XHSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:XTCELL];
    
    if (!cell) {
        cell = [[XHSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:XTCELL];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
}

@end
