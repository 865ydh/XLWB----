//
//  YDHTabBar.m
//  XLWB
//
//  Created by 闫栋辉 on 14-5-5.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import "YDHTabBar.h"
#import "YDHTabBarButton.h"
@interface YDHTabBar()

@property (nonatomic, weak) YDHTabBarButton *selectedButton;
@property (nonatomic, weak) UIButton *plusButton;
@property (nonatomic, strong) NSMutableArray *tabBarButtons;
@end
@implementation YDHTabBar

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!iOS7) {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
        
        UIButton *plusButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plusButton.bounds = CGRectMake(0, 0, plusButton.currentBackgroundImage.size.width, plusButton.currentBackgroundImage.size.height);
        [self addSubview:plusButton];
        self.plusButton = plusButton;
     
    }
    return self;
}

- (void)addTaBarButtonWithItem:(UITabBarItem *)item
{
    
    YDHTabBarButton *button = [[YDHTabBarButton alloc]init];
    [self addSubview:button];
    [self.tabBarButtons addObject:button];
    
    button.item = item;
//    [button setTitle:item.title forState:UIControlStateNormal];
//    [button setImage:item.image forState:UIControlStateNormal];
//    [button setImage:item.selectedImage forState:UIControlStateSelected];
    
    //监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    //默认选中第0个按钮
    if (self.tabBarButtons.count == 1 ) {
        [self buttonClick:button];
    }
}
//监听按钮点击
- (void)buttonClick:(YDHTabBarButton *)button
{
    //通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //加号按钮的位置
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    self.plusButton.center = CGPointMake(w * 0.5, h * 0.5);
    
    //按钮的frame
    CGFloat buttonW = w / self.subviews.count;
    CGFloat buttonY = 0;
    CGFloat buttonH = h;
    for (int index = 0; index <self.tabBarButtons.count; index++) {
        YDHTabBarButton *button = self.tabBarButtons[index];
        
        CGFloat buttonX = index * buttonW;
        if (index > 1) {
            buttonX += buttonW;
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = index;
    }
}

@end
