//
//  YDHDiscoverViewController.m
//  XLWB
//
//  Created by 闫栋辉 on 14-5-5.
//  Copyright (c) 2014年 闫栋辉. All rights reserved.
//

#import "YDHDiscoverViewController.h"
#import "YDHSearchBar.h"
@interface YDHDiscoverViewController ()

@end

@implementation YDHDiscoverViewController

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
    
    YDHSearchBar *searchBar = [YDHSearchBar searchBar];
    //尺寸
    searchBar.frame = CGRectMake(0, 0, 300, 30);
    //设置中间的标题内容
    self.navigationItem.titleView = searchBar;

     }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 0;
}


@end
