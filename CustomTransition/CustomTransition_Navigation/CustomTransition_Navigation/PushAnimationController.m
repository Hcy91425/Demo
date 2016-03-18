//
//  TranstionAnimator.m
//  CustomTransition_ViewController
//
//  Created by Cyrus😶 on 16/3/18.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "PushAnimationController.h"

@implementation PushAnimationController
// 转场的时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8;
}

// 转场动画实现
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 通过 key 取到 toVC
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 把 toVC 加入到 containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    // 一些动画要用的的数据
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // 动画过程
    toVC.view.frame = CGRectOffset(finalFrame, 0, -finalFrame.size.height);
    [UIView animateWithDuration:duration
                     animations:^{
                         toVC.view.frame = finalFrame;
                     }
                     completion:^(BOOL finished) {
                         // 结束后要通知系统
                         [transitionContext completeTransition:YES];
                     }];
}
@end
