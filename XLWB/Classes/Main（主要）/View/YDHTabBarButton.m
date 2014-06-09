//
//  YDHTabBarButton.m
//  XLWB
//
//  Created by 闫栋辉 on 14-5-5.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

//图标比例
#define YDHTabBarButtonImageRatio 0.6
//按钮默认文字颜色
#define YDHTabBarButtonTitleColor (iOS7 ? [UIColor blackColor] : [UIColor whiteColor])
//选中文字颜色
#define YDHTabBarButtonTitleSelectedColor (iOS7 ? IWColor(234, 103, 7) : IWColor(248, 139, 0))

#import "YDHTabBarButton.h"
#import "YDHBadgeButton.h"

@interface YDHTabBarButton ()
//右上角提醒数字
@property (nonatomic, weak) YDHBadgeButton *badgeButton;

@end

@implementation YDHTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        //文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        //默认文字颜色
        [self setTitleColor:YDHTabBarButtonTitleColor forState:UIControlStateNormal];
        //选中文字颜色
        [self setTitleColor:YDHTabBarButtonTitleSelectedColor forState:UIControlStateSelected];
        if (!iOS7) { // 非iOS7下,设置按钮选中时的背景
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        //添加右上角提醒数字
        YDHBadgeButton *badgeButton = [[YDHBadgeButton alloc]init];
        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
        
    }
    return self;
}

//图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageY = contentRect.size.height * YDHTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageY);
}

//文字的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height *YDHTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
- (void)setItem:(UITabBarItem *)item
{
//    [self setTitle:item.title forState:UIControlStateNormal];
//    [self setImage:item.image forState:UIControlStateNormal];
//    [self setImage:item.selectedImage forState:UIControlStateSelected];
//    if (self.item.badgeValue) {
//        self.badgeButton.hidden = NO;
//        [self.badgeButton setTitle:self.item.badgeValue forState:UIControlStateNormal];
//        
//    }else{
//        self.badgeButton.hidden = YES;
//    }
    _item = item;
    
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    }

- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}
//去掉高亮
- (void)setHighlighted:(BOOL)highlighted
{
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    self.badgeButton.badgeValue = self.item.badgeValue;
    
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width - 10;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame =badgeF;
    

}
@end
