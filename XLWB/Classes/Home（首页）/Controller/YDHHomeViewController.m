//
//  YDHHomeViewController.m
//  XLWB
//
//  Created by 闫栋辉 on 14-5-5.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import "YDHHomeViewController.h"
#import "YDHBadgeButton.h"
#import "UIBarButtonItem+YDH.h"
#import "YDHTitleButton.h"
@interface YDHHomeViewController ()
@end

@implementation YDHHomeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_friendsearch" hightIcon:@"navigationbar_friendsearch_highlighted" target:self action:@selector(findFriend)];
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_pop" hightIcon:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    //中间
    YDHTitleButton *titleButton = [YDHTitleButton titleButton];
    //默认背景图片
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    //文字
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    //尺寸
    titleButton.frame = CGRectMake(0, 0, 100, 40);
    //监听按钮点击
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleButton;
}

- (void)titleClick:(YDHTitleButton *)titleButton
{
    if (titleButton.currentImage == [UIImage imageWithName:@"navigationbar_arrow_up"]) {
        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    } else{
        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    }
}

- (void)findFriend
{
    IWLog(@"findFriend");
}
- (void)pop
{
    IWLog(@"pop");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"nimei";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *VC = [[UIViewController alloc]init];
    VC.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
