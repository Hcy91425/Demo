//
//  ViewController.m
//  CustomTransition_ViewController
//
//  Created by Cyrus😶 on 16/3/18.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "PresentingViewController.h"
#import "PresentedViewController.h"
#import "AnimationController.h"
#import "InteractionController.h"

@interface PresentingViewController ()<UIViewControllerTransitioningDelegate>
// 动画控制器
@property (nonatomic, strong)id<UIViewControllerAnimatedTransitioning> animationController;
// 交互控制器
@property (nonatomic, strong)InteractionController *interactiveTransition;
@end

@implementation PresentingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.bounds = CGRectMake(0, 0, 200, 30);
    button.center = self.view.center;
    [button setTitle:@"present view controller" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // 初始化动画控制器
    _animationController = [AnimationController new];
    // 初始化交互控制器
    _interactiveTransition = [InteractionController new];
}

- (void)buttonClicked {
    PresentedViewController *presentedVC = [PresentedViewController new];
    // 设置 presented view controller 的转场代理
    presentedVC.transitioningDelegate = self;
    // 添加交互
    [_interactiveTransition prepareForViewController:presentedVC];
    [self presentViewController:presentedVC animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate 
// 返回 present 动画控制器
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return _animationController;
}

// 返回 dismiss 动画控制器
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return _animationController;
}

// 返回 dismiss 的交互控制器
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return _interactiveTransition.isInteracting ? _interactiveTransition : nil;
}



@end
