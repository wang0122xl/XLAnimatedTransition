//
//  NextViewController.m
//  XLAnimatedTransitionDemo
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 jason.wang. All rights reserved.
//

#import "NextViewController.h"
#import <XLAnimatedTransition/XLAnimatedTransitionHeader.h>

@interface NextViewController ()<UIViewControllerTransitioningDelegate , XLAnimatedTransitionAnimatingDelegate , CAAnimationDelegate>
{
    
    XLAnimatedTransition *_presentTransition;
    XLAnimatedTransition *_dismissTransition;
    
    BOOL _isDismiss;
    id<UIViewControllerContextTransitioning> _context;
}

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 200, 40);
    btn.layer.borderColor = [btn titleColorForState:UIControlStateNormal].CGColor;
    btn.layer.borderWidth = 0.5;
    btn.layer.cornerRadius = 4;
    btn.layer.masksToBounds = NO;
    btn.center = self.view.center;
    [btn setTitle:@"返回上一个controller" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.userInteractionEnabled = YES;
    
    [self configTransition];
}

- (void)click {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)configTransition {
    _presentTransition = [[XLAnimatedTransition alloc] initWithTransitionType:XLAnimatedTransitionTypePresent duration:2];
    _presentTransition.animatingDelegate = self;
    
    _dismissTransition = [[XLAnimatedTransition alloc] initWithTransitionType:XLAnimatedTransitionTypeDismiss duration:2];
    _dismissTransition.animatingDelegate = self;
}

#pragma mark - XLAnimatedTransitionDelegate
- (void)animatingInContainer:(UIView *)container withOriginView:(UIView *)originView targetView:(UIView *)targetView transitionType:(XLAnimatedTransitionType)transitionType context:(id<UIViewControllerContextTransitioning>)context {
    _context = context;
    //present动画处理
    if (transitionType == XLAnimatedTransitionTypePresent) {
        
        targetView.layer.anchorPoint = CGPointMake(0, 0);
        targetView.frame = CGRectMake(0, 0, container.width, container.height);
        [container addSubview:targetView];

        _isDismiss = YES;
        
        CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        keyAnim.values = @[
                           [NSValue valueWithCGPoint:CGPointMake(0, container.height)],
                           [NSValue valueWithCGPoint:CGPointMake(0, container.height * 3 / 5.0)],
                           [NSValue valueWithCGPoint:CGPointMake(0, 0)]
                           ];
        keyAnim.keyTimes = @[
                             [NSNumber numberWithFloat:0.0],
                             [NSNumber numberWithFloat:0.4],
                             [NSNumber numberWithFloat:1]
                             ];
        keyAnim.timingFunctions = @[
                                    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]
                                    ];
        keyAnim.calculationMode = kCAAnimationLinear;
        keyAnim.duration = _presentTransition.transitionDuration;
        keyAnim.removedOnCompletion = NO;
        keyAnim.fillMode = kCAFillModeForwards;
        keyAnim.delegate = self;
        
        [targetView.layer addAnimation:keyAnim forKey:@"position"];

        
    } else {
        //pop动画处理
        [container addSubview:targetView];
        [container bringSubviewToFront:originView];
        [UIView animateWithDuration:_dismissTransition.transitionDuration delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
            originView.y = -container.height;
        } completion:^(BOOL finished) {
            [context completeTransition:![context transitionWasCancelled]];
        }];
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [_context completeTransition:![_context transitionWasCancelled]];
}

#pragma mark - transitionDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return _presentTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return _dismissTransition;
}


@end
