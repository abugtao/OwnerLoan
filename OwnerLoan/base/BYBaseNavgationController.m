//
//  BYBaseNavgationController.m
//  OwnerLoan
//
//  Created by user on 2018/4/27.
//  Copyright © 2018年 user. All rights reserved.
//

#import "BYBaseNavgationController.h"

@interface BYBaseNavgationController ()

@end

@implementation BYBaseNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.navigationBar.translucent = NO; //y 从nav底部开始
    
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: DiyFont(20),
                                     NSForegroundColorAttributeName: UIColorFromRGB(0x333333)
                                     };
    [self.navigationBar setTitleTextAttributes:textAttributes];
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];//设置按钮颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];//设置背景颜色
    //隐藏navbar底部线
    [self.navigationBar setShadowImage:[UIImage new]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
