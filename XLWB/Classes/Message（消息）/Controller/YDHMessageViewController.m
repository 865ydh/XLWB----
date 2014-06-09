//
//  YDHMessageViewController.m
//  XLWB
//
//  Created by 闫栋辉 on 14-5-5.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import "YDHMessageViewController.h"

@interface YDHMessageViewController ()

@end

@implementation YDHMessageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"写私信" style:UIBarButtonItemStyleDone target:nil action:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:ID];
    }
    cell.textLabel.text = @"!!!!!!!";
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *VC = [[UIViewController alloc]init];
    VC.view.backgroundColor = [UIColor brownColor];
    [self.navigationController pushViewController:VC animated:YES];
    
}

@end
