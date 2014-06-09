//
//  YDHTabBarViewController.m
//  XLWB
//
//  Created by 闫栋辉 on 14-5-5.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import "YDHTabBarViewController.h"
#import "YDHMeTableViewController.h"
#import "YDHMessageViewController.h"
#import "YDHHomeViewController.h"
#import "YDHDiscoverViewController.h"
#import "UIImage+YDH.h"
#import "YDHTabBar.h"
#import "YDHNavigationController.h"
@interface YDHTabBarViewController ()<YDHTabBarDelegate>
@property (nonatomic, weak)YDHTabBar *customTabBar;
@end

@implementation YDHTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //初始化tabbar
    [self setupTabbar];
    //初始化子控制器
    [self setupAllChildViewControllers];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //删除系统自带的UItabbarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
//初始化tabbar
- (void)setupTabbar
{
    YDHTabBar *customTabBar = [[YDHTabBar alloc]init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
//    customTabBar.backgroundColor = [UIColor redColor];
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}
//监听tabbar按钮的改变
- (void)tabBar:(YDHTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}
//初始化自控制器
- (void)setupAllChildViewControllers
{
    YDHHomeViewController *home = [[YDHHomeViewController alloc]init];
    home.tabBarItem.badgeValue = @"1";
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    YDHMessageViewController *message = [[YDHMessageViewController alloc]init];
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    YDHMeTableViewController *me = [[YDHMeTableViewController alloc]init];
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    YDHDiscoverViewController *discover = [[YDHDiscoverViewController alloc]init];
    [self setupChildViewController:discover title:@"广场" imageName:@"tabbar_discover"  selectedImageName:@"tabbar_discover_selected"];
}

//初始化每个子控制器
- (void)setupChildViewController:(UIViewController *)ChildVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{   //设置导航栏
    ChildVc.title = title;
    //图标
    ChildVc.tabBarItem.image = [UIImage imageWithName:imageName];
    //选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        ChildVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        ChildVc.tabBarItem.selectedImage = selectedImage;
    }
    //包装一个导航栏
   YDHNavigationController *nav = [[YDHNavigationController alloc]initWithRootViewController:ChildVc];
    [self addChildViewController:nav];
    //添加tabbar内部的按钮
    [self.customTabBar addTaBarButtonWithItem:ChildVc.tabBarItem];
}

@end
