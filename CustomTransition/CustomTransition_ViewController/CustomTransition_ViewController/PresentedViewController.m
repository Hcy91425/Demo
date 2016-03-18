//
//  PresentedViewController.m
//  CustomTransition_ViewController
//
//  Created by Cyrus😶 on 16/3/18.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.bounds = CGRectMake(0, 0, 200, 30);
    button.center = self.view.center;
    [button setTitle:@"dismiss view controller" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
