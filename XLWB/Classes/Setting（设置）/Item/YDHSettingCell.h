//
//  YDHSettingCell.h
//  XLWB
//
//  Created by 闫栋辉 on 14-5-7.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YDHSettingItem;
@interface YDHSettingCell : UITableViewCell

@property (nonatomic, strong) YDHSettingItem *item;

//@property (nonatomic, assign)
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
