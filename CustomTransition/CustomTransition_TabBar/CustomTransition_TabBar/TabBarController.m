//
//  TabBarController.m
//  CustomTransition_TabBar
//
//  Created by Cyrus😶 on 16/3/18.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "TabBarController.h"
#import "AnimationController.h"

@interface TabBarController ()<UITabBarControllerDelegate>

@end

@implementation TabBarController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.delegate = self;
        
        UIViewController *vc1 = [UIViewController new];
        vc1.view.backgroundColor = [UIColor whiteColor];
        vc1.title = @"VC1";
        
        UIViewController *vc2 = [UIViewController new];
        vc2.view.backgroundColor = [UIColor lightGrayColor];
        vc2.title = @"VC2";
        
        UIViewController *vc3 = [UIViewController new];
        vc3.view.backgroundColor = [UIColor yellowColor];
        vc3.title = @"VC3";
        
        UIViewController *vc4 = [UIViewController new];
        vc4.view.backgroundColor = [UIColor brownColor];
        vc4.title = @"VC4";
        
        self.viewControllers = @[vc1, vc2, vc3, vc4];
    }
    return self;
}

#pragma mark - UITabBarControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [AnimationController new];
}
@end
