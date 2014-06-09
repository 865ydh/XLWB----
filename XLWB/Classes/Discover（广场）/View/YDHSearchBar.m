//
//  YDHSearchBar.m
//  XLWB
//
//  Created by 闫栋辉 on 14-5-7.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import "YDHSearchBar.h"
@interface YDHSearchBar()

@end
@implementation YDHSearchBar
+ (instancetype)searchBar
{
    return [[self alloc]init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //背景图片
        self.background = [UIImage resizedImageWithName:@"searchbar_textfield_background"];
        //左边的放大镜
        UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        iconView.contentMode = UIViewContentModeCenter;
        self.leftView = iconView;
        self.leftViewMode = UITextFieldViewModeAlways;
        //字体大小
        self.font = [UIFont systemFontOfSize:13];
        //大删除
        self.clearButtonMode = UITextFieldViewModeAlways;
        //框里的提醒文字
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索"attributes:attrs];
        //键盘右下角的样式
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = YES;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //放大镜的尺寸
    self.leftView.frame = CGRectMake(0, 0, 30, self.frame.size.height);
}

@end
