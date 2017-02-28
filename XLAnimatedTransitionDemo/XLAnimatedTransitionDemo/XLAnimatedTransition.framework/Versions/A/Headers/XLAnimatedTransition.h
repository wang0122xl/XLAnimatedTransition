//
//  XLAnimatedTransition.h
//  XLAnimatedTransition
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 jason.wang. All rights reserved.
//   P  p

#import <UIKit/UIKit.h>
#import "XLAnimatedTransitionAnimatingDelegate.h"

@interface XLAnimatedTransition : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithTransitionType:(XLAnimatedTransitionType)type duration:(CGFloat)duration;

@property (nonatomic , weak) id<XLAnimatedTransitionAnimatingDelegate> animatingDelegate;

@property (nonatomic , assign , readonly) CGFloat transitionDuration;

@end
