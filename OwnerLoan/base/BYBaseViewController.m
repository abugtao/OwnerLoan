//
//  BYBaseViewController.m
//  OwnerLoan
//
//  Created by user on 2018/4/27.
//  Copyright © 2018年 user. All rights reserved.
//

#import "BYBaseViewController.h"

@interface BYBaseViewController ()

@end

@implementation BYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    [self setLeftItemWithFrame:CGRectMake(0, 0, 40, 40) withImageName:@"back_arrow" withTitle:@""];
}


- (void)setLeftItemWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title{
    UIButton *leftItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftItemButton.frame = frame;
    [leftItemButton setTitleColor:UIColorWithRGB(51, 51, 51) forState:UIControlStateNormal];
    leftItemButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    if (imageName.length!=0 && title.length != 0) {
        [leftItemButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [leftItemButton setTitle:title forState:UIControlStateNormal];
        
    }else if (imageName.length!=0 && title.length == 0) {
        [leftItemButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }else{
        [leftItemButton setTitle:title forState:UIControlStateNormal];
    }
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=11) {
        [leftItemButton setContentMode:UIViewContentModeScaleToFill];
        [leftItemButton setContentEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 20)];
    }
    
    [leftItemButton addTarget:self action:@selector(leftItemButtonAction) forControlEvents:UIControlEventTouchUpInside];
    _leftItemButton = leftItemButton;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:_leftItemButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
- (void)leftItemButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setRightItemWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title{
    
    UIButton *rightItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightItemButton.frame = frame;
    [rightItemButton setTitleColor:UIColorWithRGB(51, 51, 51) forState:UIControlStateNormal];
    rightItemButton.titleLabel.font = [UIFont systemFontOfSize:14];
    if (imageName.length!=0 && title.length != 0) {
        [rightItemButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [rightItemButton setTitle:title forState:UIControlStateNormal];
    }else if (imageName.length!=0 && title.length == 0) {
        [rightItemButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }else{
        [rightItemButton setTitle:title forState:UIControlStateNormal];
    }
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=11) {
        [rightItemButton setContentMode:UIViewContentModeScaleToFill];
        [rightItemButton setContentEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 5)];
    }
    
    [rightItemButton addTarget:self action:@selector(rightItemButtonAction) forControlEvents:UIControlEventTouchUpInside];
    _rightItemButton = rightItemButton;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightItemButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
- (void)rightItemButtonAction{
    NSLog(@"right");
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.navigationController.viewControllers.count==1) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }else{
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
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
