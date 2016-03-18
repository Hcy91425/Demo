//
//  ViewController.m
//  CustomTransition_Navigation
//
//  Created by Cyrus😶 on 16/3/18.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"First View Controller";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.bounds = CGRectMake(0, 0, 200, 30);
    button.center = self.view.center;
    [button setTitle:@"Push view controller" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked {
    SecondViewController *secVC = [SecondViewController new];
    [self.navigationController pushViewController:secVC animated:YES];
}

@end
