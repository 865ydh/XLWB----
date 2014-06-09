//
//  YDHTabBar.h
//  XLWB
//
//  Created by 闫栋辉 on 14-5-5.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YDHTabBar ;

@protocol  YDHTabBarDelegate <NSObject>

@optional

- (void)tabBar:(YDHTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;


@end
@interface YDHTabBar : UIView

- (void) addTaBarButtonWithItem:(UITabBarItem *)item;
@property (nonatomic, weak)id<YDHTabBarDelegate> delegate;
@end
