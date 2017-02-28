//
//  UIView+XLExtension.h
//  XLTools
//
//  Created by mac on 17/2/21.
//  Copyright © 2017年 jason.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XLExtension)

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;
@property (nonatomic , assign) CGPoint origin;

@property (nonatomic,assign) CGFloat maxX;
@property (nonatomic,assign) CGFloat maxY;

@end
