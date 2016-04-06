//
//  A_ViewController.m
//  Appear&Disappear-Sample
//
//  Created by Cyrus on 16/4/6.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "A_ViewController.h"
#import "B_ViewController.h"

@interface A_ViewController ()

@end

@implementation A_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"First";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 打印分割线
    UIButton *breakLineButton = [UIButton buttonWithType:UIButtonTypeSystem];
    breakLineButton.frame = CGRectMake(0, 0, 200, 30);
    breakLineButton.center = CGPointMake(self.view.center.x, self.view.center.y-100);
    [breakLineButton setTitle:@"Print Break Line" forState:UIControlStateNormal];
    [breakLineButton addTarget:self action:@selector(printBreakLine) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:breakLineButton];
    
    // Push
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeSystem];
    pushButton.frame = CGRectMake(0, 0, 200, 30);
    pushButton.center = CGPointMake(self.view.center.x, self.view.center.y-50);
    [pushButton setTitle:@"Push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    // Normal Present
    UIButton *normalPresentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    normalPresentButton.frame = CGRectMake(0, 0, 200, 30);
    normalPresentButton.center = CGPointMake(self.view.center.x, self.view.center.y+50);
    [normalPresentButton setTitle:@"Normal Present" forState:UIControlStateNormal];
    [normalPresentButton addTarget:self action:@selector(normalPresent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:normalPresentButton];
    
    // Custom Present
    UIButton *customPresentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    customPresentButton.frame = CGRectMake(0, 0, 200, 30);
    customPresentButton.center = CGPointMake(self.view.center.x, self.view.center.y+100);
    [customPresentButton setTitle:@"Custom Present" forState:UIControlStateNormal];
    [customPresentButton addTarget:self action:@selector(customPresent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customPresentButton];
}

- (void)printBreakLine {
    printf("\n----------------------------------------------------------------------------------------------------------------------\n\n");
}

- (void)push {
    printf("\n---------------------------------------------------------PUSH---------------------------------------------------------\n\n");
    B_ViewController *secVC = [B_ViewController new];
    [self.navigationController pushViewController:secVC animated:YES];
}

- (void)normalPresent {
    printf("\n------------------------------------------------------NormalPresent-----------------------------------------------------\n\n");
    B_ViewController *secVC = [B_ViewController new];
    [self presentViewController:secVC animated:YES completion:nil];
}

- (void)customPresent {
    printf("\n------------------------------------------------------CustomPresent-----------------------------------------------------\n\n");
    B_ViewController *secVC = [B_ViewController new];
    secVC.view.alpha = 0.8;
    // 这两种转场方式都不会对 fromViewController 的 view 进行操作
    secVC.modalPresentationStyle = UIModalPresentationCustom;
    
    // secVC.modalPresentationStyle = UIModalPresentationOverFullScreen;

    [self presentViewController:secVC animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"A  view will appear    %@",self);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"A  view did  appear    %@",self);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"A  view will disappear %@",self);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
    NSLog(@"A  view did  disappear %@",self);
}
@end
