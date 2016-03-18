//
//  NavigationController.m
//  CustomTransition_Navigation
//
//  Created by Cyrus😶 on 16/3/18.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "NavigationController.h"
#import "FirstViewController.h"
#import "PushAnimationController.h"
#import "PopAnimationController.h"
#import "InteractionController.h"

@interface NavigationController ()<UINavigationControllerDelegate>
@property (nonatomic, strong)InteractionController *interactionController;
@end

@implementation NavigationController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.viewControllers = @[[FirstViewController new]];
        self.delegate = self;
        _interactionController = [InteractionController new];
    }
    return self;
}

// 重写 pop 方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [_interactionController prepareForViewController:viewController];
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate
// 返回 push 和 pop 的动画控制器
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return [PushAnimationController new];
    } else if (operation == UINavigationControllerOperationPop) {
        return [PopAnimationController new];
    } else {
        return nil;
    }
}

// 如果是 pop 动画，返回交互控制器
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if ([animationController isMemberOfClass:[PopAnimationController class]] ) {
        return _interactionController.isInteracting ? _interactionController : nil;
    } else {
        return nil;
    }
}
@end
