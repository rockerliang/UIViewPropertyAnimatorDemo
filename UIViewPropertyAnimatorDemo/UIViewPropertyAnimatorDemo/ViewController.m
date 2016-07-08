//
//  ViewController.m
//  UIViewPropertyAnimatorDemo
//
//  Created by Rocker on 16/7/8.
//  Copyright © 2016年 Rocker. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.testView];
    
    
    //初始化属性动画器
    self.viewProperty = [[UIViewPropertyAnimator alloc] initWithDuration:4.f curve:UIViewAnimationCurveLinear animations:^{
        self.testView.frame = CGRectMake(200, 200, 200, 200);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)beginAnimation:(id)sender {
    [self.viewProperty startAnimation];
}

- (IBAction)pauseAnimation:(id)sender {
    [self.viewProperty pauseAnimation];
}

- (IBAction)continueAnimation:(id)sender {
    UISpringTimingParameters *param = [[UISpringTimingParameters alloc] initWithDampingRatio:0.1];
    [self.viewProperty continueAnimationWithTimingParameters:param durationFactor:1];
}

- (IBAction)stopAnimation:(id)sender {
    [self.viewProperty stopAnimation:true];
    
    //    __block ViewController *weakself = self;
    //    [self.viewProperty addAnimations:^{
    //        weakself.testView.frame = CGRectMake(100, 100, 100, 100);
    //    } delayFactor:1.f];
}

@end


