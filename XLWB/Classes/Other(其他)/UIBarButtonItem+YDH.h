//
//  UIBarButtonItem+YDH.h
//  XLWB
//
//  Created by 闫栋辉 on 14-5-6.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YDH)
//快速创建一个item对象
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon hightIcon:(NSString *)hightIcon target:(id)target action:(SEL)action;
@end
