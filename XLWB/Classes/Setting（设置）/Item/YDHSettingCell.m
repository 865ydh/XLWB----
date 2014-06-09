//
//  YDHSettingCell.m
//  XLWB
//
//  Created by 闫栋辉 on 14-5-7.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import "YDHSettingCell.h"
#import "YDHSettingItem.h"
@implementation YDHSettingCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    YDHSettingCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YDHSettingCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setItem:(YDHSettingItem *)item
{
    _item = item;
    
    self.imageView.image = [UIImage imageNamed:item.icon];
    self.textLabel.text = item.title;
}
@end
