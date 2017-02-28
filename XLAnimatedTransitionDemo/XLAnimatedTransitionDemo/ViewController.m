//
//  ViewController.m
//  XLAnimatedTransitionDemo
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 jason.wang. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()
{

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第一个controller";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 200, 40);
    btn.layer.borderColor = [btn titleColorForState:UIControlStateNormal].CGColor;
    btn.layer.borderWidth = 0.5;
    btn.layer.cornerRadius = 4;
    btn.layer.masksToBounds = NO;
    btn.center = self.view.center;
    [btn setTitle:@"跳转到下一个controller" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)clickAction {
    NextViewController *next = [[NextViewController alloc] init];
    [self presentViewController:next animated:YES completion:nil];
}


@end
