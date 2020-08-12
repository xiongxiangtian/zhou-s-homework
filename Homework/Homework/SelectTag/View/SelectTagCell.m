//
//  SelectTagCell.m
//  Homework
//
//  Created by xihou damowang on 2020/8/11.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "SelectTagCell.h"

@implementation SelectTagCell

+ (instancetype)cellWithTablView:(UITableView *)tableView {
    static NSString *SELECTTAGCELL = @"SELECTTAGCELL";
    SelectTagCell *cell = [[SelectTagCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SELECTTAGCELL];
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self setupView];
    return self;
}

- (void)setupView {
    
}

@end
