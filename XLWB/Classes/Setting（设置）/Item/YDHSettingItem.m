//
//  YDHSettingItem.m
//  XLWB
//
//  Created by 闫栋辉 on 14-5-7.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import "YDHSettingItem.h"

@interface YDHSettingItem ()
@end
@implementation YDHSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    YDHSettingItem *item = [[self alloc]init];
    item.icon = icon;
    item.title = title;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}
@end
