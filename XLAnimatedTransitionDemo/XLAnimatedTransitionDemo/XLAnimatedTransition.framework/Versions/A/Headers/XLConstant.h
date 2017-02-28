//
//  Header.h
//  XLTools
//
//  Created by mac on 17/2/21.
//  Copyright © 2017年 jason.wang. All rights reserved.
//

#ifndef Header_h
#define Header_h

#if DEBUG
#define XL_Log(...) NSLog(__VA_ARGS__)
#else 
#define XL_Log(...) 
#endif

//颜色
#define RGBA_Color(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]
#define RGB_Color(r,g,b) RGBA_Color(r,g,b,1)

//屏幕宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#endif /* Header_h */
