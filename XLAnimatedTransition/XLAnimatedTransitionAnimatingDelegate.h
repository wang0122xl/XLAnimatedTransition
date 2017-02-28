//
//  XLAnimatedTransitionAnimatingDelegate.h
//  XLAnimatedTransition
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 jason.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , XLAnimatedTransitionType) {
    XLAnimatedTransitionTypePush = 0,
    XLAnimatedTransitionTypeHidePop,
    XLAnimatedTransitionTypePresent,
    XLAnimatedTransitionTypeDismiss
};

@protocol XLAnimatedTransitionAnimatingDelegate <NSObject>

@required
- (void)animatingInContainer:(UIView *)container
              withOriginView:(UIView *)originView
                  targetView:(UIView *)targetView
              transitionType:(XLAnimatedTransitionType)transitionType
                     context:(id<UIViewControllerContextTransitioning>)context;

@end
