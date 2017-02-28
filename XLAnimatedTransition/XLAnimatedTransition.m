//
//  XLAnimatedTransition.m
//  XLAnimatedTransition
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 jason.wang. All rights reserved.
//

#import "XLAnimatedTransition.h"

@interface XLAnimatedTransition ()
{
    XLAnimatedTransitionType _type;
    CGFloat _duration;
}

@end

@implementation XLAnimatedTransition

- (instancetype)initWithTransitionType:(XLAnimatedTransitionType)type duration:(CGFloat)duration {
    if (self = [super init]) {
        _type = type;
        _duration = duration;
    }
    return self;
}

- (CGFloat)transitionDuration {
    return _duration;
}

#pragma mark - transitionDelegate
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return _duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [_animatingDelegate animatingInContainer:[transitionContext containerView] withOriginView:fromVC.view targetView:toVC.view transitionType:_type context:transitionContext];
}


@end
