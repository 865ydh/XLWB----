//
//  YDHNewfeatureViewController.m
//  XLWB
//
//  Created by 闫栋辉 on 14-5-7.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import "YDHNewfeatureViewController.h"
#import "YDHTabBarViewController.h"
#define     YDHNewfeatureImageCount 3
@interface YDHNewfeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation YDHNewfeatureViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupScrollView];
    
    [self setupPageControl];
}

- (void)setupPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = YDHNewfeatureImageCount;
    CGFloat centX = self.view.frame.size.width * 0.5;
    CGFloat centY = self.view.frame.size.height - 30;
    pageControl.center = CGPointMake(centX, centY);
    pageControl.bounds = CGRectMake(0, 0, 100, 30);
    pageControl.userInteractionEnabled = NO;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
    pageControl.currentPageIndicatorTintColor = IWColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = IWColor(189, 189, 189);
}

- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    CGFloat imageW = scrollView.frame.size.width;
    CGFloat imageH = scrollView.frame.size.height;
    for (int index = 0; index<YDHNewfeatureImageCount; index ++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        
        NSString *name = [NSString stringWithFormat:@"new_feature_%d",index+1];
        imageView.image = [UIImage imageWithName:name];
        
        CGFloat imageX = index * imageW;
        imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
        
        [scrollView addSubview:imageView];
        
        if (index == YDHNewfeatureImageCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    //滚动的尺寸
    scrollView.contentSize = CGSizeMake(imageW * YDHNewfeatureImageCount, 0 );
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
}

- (void)setupLastImageView:(UIImageView *)imageView
{   //可以和用户交互
    imageView.userInteractionEnabled = YES;
    //开始按钮
    UIButton *startButton = [[UIButton alloc]init];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    //位置尺寸
    CGFloat centerX = imageView.frame.size.width * 0.5;
    CGFloat centerY = imageView.frame.size.height * 0.6;
    startButton.center = CGPointMake(centerX, centerY);
    startButton.bounds = (CGRect){CGPointZero, startButton.currentBackgroundImage.size};
    //最后一页的开始
    [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startButton];
    
    //添加分享功能
    UIButton *checkbox = [[UIButton alloc]init];
    checkbox.selected = YES;
    [checkbox setTitle:@"分享给大家" forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    checkbox.bounds = CGRectMake(0, 0, 200, 50);
    CGFloat checkCentX = centerX;
    CGFloat checkCentY = imageView.frame.size.height * 0.5;
    checkbox.center = CGPointMake(checkCentX, checkCentY);
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    checkbox.titleLabel.font = [UIFont systemFontOfSize:14];
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    
    checkbox.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [imageView addSubview:checkbox];
    
}

- (void)start
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    self.view.window.rootViewController = [[YDHTabBarViewController alloc]init];
}

- (void)checkboxClick:(UIButton *)checkbox
{
    checkbox.selected = !checkbox.isSelected;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{  //水平方向滚动的距离
    CGFloat offsetX = scrollView.contentOffset.x;
    //页码
    double pageDouble = offsetX / scrollView.frame.size.width;
    int pageInt = (int)(pageDouble + 0.5);
    self.pageControl.currentPage = pageInt;
}
@end
