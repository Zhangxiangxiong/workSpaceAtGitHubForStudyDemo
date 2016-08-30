//
//  ViewController.m
//  HelloWorld_iOS
//
//  Created by zhangxiangxiong125960373 on 16/8/30.
//  Copyright © 2016年 com.ssm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
    customView.backgroundColor = [UIColor yellowColor];
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:customView];
    
    self.navigationItem.rightBarButtonItem = item;
    self.navigationItem.titleView = customView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
