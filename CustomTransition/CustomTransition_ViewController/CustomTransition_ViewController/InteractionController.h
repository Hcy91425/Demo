//
//  PercentDrivenInteractiveTransition.h
//  CustomTransition_ViewController
//
//  Created by Cyrus😶 on 16/3/18.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InteractionController : UIPercentDrivenInteractiveTransition
// 标记是否是交互转场
@property (nonatomic, readonly, getter=isInteracting)BOOL interacting;
// 一些初始化工作
- (void)prepareForViewController:(UIViewController *)viewController;
@end
