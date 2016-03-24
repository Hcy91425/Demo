//
//  ViewController.m
//  RunLoopDemo
//
//  Created by Cyrus on 16/3/23.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)UILabel *timerLabel;
@property (nonatomic, strong)UIScrollView *mainScrollView;
@property (nonatomic, strong)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 150, 375, 400)];
    _mainScrollView.layer.borderColor = [[UIColor redColor] CGColor];
    _mainScrollView.layer.borderWidth = 4;
    _mainScrollView.contentSize = CGSizeMake(0, 1000);
    _mainScrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_mainScrollView];
    
    _timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 375, 50)];
    _timerLabel.text = @"0";
    _timerLabel.textAlignment = NSTextAlignmentCenter;
    _timerLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:_timerLabel];
    
    // 方案1
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
    // [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    /* 方案2
    dispatch_queue_t queue = dispatch_queue_create("com.cyrusdev.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] run]; // 一定要在注册timer之后让 RunLoop 跑起来
    });
     */
    
}

- (void)timerAction {
    static int count = 0;
    _timerLabel.text = [NSString stringWithFormat:@"%d", ++count];
}


@end
