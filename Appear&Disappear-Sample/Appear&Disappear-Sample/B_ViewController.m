//
//  B_ViewController.m
//  Appear&Disappear-Sample
//
//  Created by Cyrus on 16/4/6.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "B_ViewController.h"

@interface B_ViewController ()

@end

@implementation B_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Second";
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    // 打印分割线
    UIButton *breakLineButton = [UIButton buttonWithType:UIButtonTypeSystem];
    breakLineButton.frame = CGRectMake(0, 0, 200, 30);
    breakLineButton.center = CGPointMake(self.view.center.x, self.view.center.y-100);
    [breakLineButton setTitle:@"Print Break Line" forState:UIControlStateNormal];
    [breakLineButton addTarget:self action:@selector(printBreakLine) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:breakLineButton];
    
    // Pop
    UIButton *popButton = [UIButton buttonWithType:UIButtonTypeSystem];
    popButton.frame = CGRectMake(0, 0, 200, 30);
    popButton.center = CGPointMake(self.view.center.x, self.view.center.y);
    [popButton setTitle:@"Pop" forState:UIControlStateNormal];
    [popButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popButton];
    
    // Dismiss
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeSystem];
    dismissButton.frame = CGRectMake(0, 0, 200, 30);
    dismissButton.center = CGPointMake(self.view.center.x, self.view.center.y+100);
    [dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissButton];
}

- (void)printBreakLine {
    printf("\n------------------------------------------------------------------------------------------------------------------------\n\n");}

- (void)pop {
   printf("\n---------------------------------------------------------POP---------------------------------------------------------\n\n");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismiss {
    printf("\n-------------------------------------------------------DISMISS---------------------------------------------------------\n\n");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"B  view will appear    %@",self);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"B  view did  appear    %@",self);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"B  view will disappear %@",self);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
    NSLog(@"B  view did  disappear %@", self);
}

@end
