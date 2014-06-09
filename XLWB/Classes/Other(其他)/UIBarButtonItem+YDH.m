//
//  UIBarButtonItem+YDH.m
//  XLWB
//
//  Created by 闫栋辉 on 14-5-6.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import "UIBarButtonItem+YDH.h"

@interface UIBarButtonItem()


@end
@implementation UIBarButtonItem (YDH)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon hightIcon:(NSString *)hightIcon target:(id)target action:(SEL)action
{
    //创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置按钮的背景图片
    [button setBackgroundImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName:hightIcon] forState:UIControlStateHighlighted];
    //尺寸
    button.frame = (CGRect){CGPointZero,button.currentBackgroundImage.size};
    //监听点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
    
}

@end
