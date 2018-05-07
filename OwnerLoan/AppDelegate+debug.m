//
//  AppDelegate+debug.m
//  credit
//
//  Created by 赵静静 on 2017/11/20.
//  Copyright © 2017年 baoyin. All rights reserved.
//

#import "AppDelegate+debug.h"
#import "BYServicesViewController.h"
#import "BYRequestLogViewController.h"


@implementation AppDelegate (debug)
/**
 *  初始化日志按钮
 */
- (void)initLoggerButton{

    /**
     *  如果是生产环境隐藏日志按钮
     */
    

    CGFloat width = 50;
    //日志按钮
    UILabel *logBtn = [[UILabel alloc]init];
    logBtn.frame = CGRectMake(0, SCREEN_HEIGTH *0.2, width, width);
    logBtn.text = @"日志";
    logBtn.backgroundColor = MAIN_COLOR;
    logBtn.font = [UIFont systemFontOfSize:14];
    logBtn.userInteractionEnabled = YES;
    logBtn.textAlignment = NSTextAlignmentCenter;
    logBtn.numberOfLines = 0;
    logBtn.layer.cornerRadius = width/2;
    logBtn.layer.masksToBounds = YES;
    [self.window addSubview:logBtn];

    //添加点击事件
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showLogerVC)];
    [logBtn addGestureRecognizer:tap1];

    //添加拖动事件
    UIPanGestureRecognizer *pan1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [logBtn addGestureRecognizer:pan1];

    //切换测试环境按钮
    UILabel *textBtn = [[UILabel alloc]init];
    textBtn.frame = CGRectMake(logBtn.left,logBtn.top - width - 10, width, width);
    textBtn.text = @"server";
    textBtn.backgroundColor = MAIN_COLOR;
    textBtn.font = [UIFont systemFontOfSize:14];
    textBtn.userInteractionEnabled = YES;
    textBtn.textAlignment = NSTextAlignmentCenter;
    textBtn.numberOfLines = 0;
    textBtn.layer.cornerRadius = width/2;
    textBtn.layer.masksToBounds = YES;
    [self.window addSubview:textBtn];

    //添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickChangeServer)];
    [textBtn addGestureRecognizer:tap];
    //添加拖动事件
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [textBtn addGestureRecognizer:pan];
    
}

/**
 *  拖拽
 */
- (void)panAction:(UIGestureRecognizer *)gesture {

    UIView *btn = gesture.view;

    CGPoint point = [gesture locationInView:btn.superview];

    btn.center = point;

    if (gesture.state == UIGestureRecognizerStateChanged) {}

    if (gesture.state == UIGestureRecognizerStateEnded) {

        CGRect rect = btn.frame;

        if (btn.center.x > btn.superview.width * 0.5) {

            rect.origin.x = btn.superview.width - btn.width;
        }
        else {
            rect.origin.x = 0;
        }

        
        if (btn.top > btn.superview.height - btn.height - BOTTOM_CONST_HEIGHT) {
            rect.origin.y = btn.superview.height - btn.height - BOTTOM_CONST_HEIGHT;
        }

        [UIView animateWithDuration:0.2 animations:^{
            btn.frame = rect;

        }];
    }
}

/**
 *  日志按钮触发事件
 */
- (void)showLogerVC
{
//    BYApiLogViewController *logerVC = [BYApiLogViewController initByClassName];
//    [self pushvc:logerVC];
    
    BYRequestLogViewController *loggerVC = [[BYRequestLogViewController alloc] init];
    
    UIViewController *vc = [BYUITool topViewController];
    

    if ([vc.parentViewController isKindOfClass:[UINavigationController class]]) {
        [vc.navigationController pushViewController:loggerVC animated:YES];
    }else{
        BYBaseNavgationController *nav = [[BYBaseNavgationController alloc] initWithRootViewController:loggerVC];
        [[BYUITool topViewController] presentViewController:nav animated:YES completion:NULL];
    }
}

/**
 *  切换服务器按钮触发事件
 */
-(void)clickChangeServer{

    BYServicesViewController *changeVC = [[BYServicesViewController alloc] init];
    UIViewController *vc = [BYUITool topViewController];
    if ([vc.parentViewController isKindOfClass:[UINavigationController class]]) {
        [vc.navigationController pushViewController:changeVC animated:YES];
    }else{
        BYBaseNavgationController *nav = [[BYBaseNavgationController alloc] initWithRootViewController:changeVC];
        [[BYUITool topViewController] presentViewController:nav animated:YES completion:NULL];
    }
}



//-(void)pushvc:(UIViewController *)viewController{
//
//    UINavigationController *vc = (UINavigationController *)self.window.rootViewController;
//    if ([vc isKindOfClass:[UINavigationController class]]) {
//
//        UINavigationController *nav = (UINavigationController *)vc;
//        UIViewController *topVC = nav.visibleViewController;
//
//        if (topVC.presentingViewController) {
//
//            BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:viewController];
//            [topVC presentViewController:nav animated:YES completion:nil];
//
//        }else{
//
//            [topVC pushViewController:viewController];
//        }
//    }
//}



@end
