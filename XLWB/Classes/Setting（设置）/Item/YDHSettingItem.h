//
//  YDHSettingItem.h
//  XLWB
//
//  Created by 闫栋辉 on 14-5-7.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^YDHSettingItemOption)();

@interface YDHSettingItem : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) YDHSettingItemOption option;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

+ (instancetype)itemWithTitle:(NSString *)title;
@end
