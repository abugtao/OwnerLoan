//
//  BYTabBarViewController.m
//  OwnerLoan
//
//  Created by user on 2018/5/2.
//  Copyright © 2018年 user. All rights reserved.
//

#import "BYTabBarViewController.h"
#import "BYTabbarView.h"
#import "TestViewController.h"
@interface BYTabBarViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation BYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabBar.hidden = YES;
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 50, 50)];
//    btn.backgroundColor = [UIColor redColor];
//    [self.view addSubview:btn];
//    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        if([BYDeviceTool hasPowerOfLibrary]){
//
//            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
//            // 设置代理
//            imagePickerController.delegate = self;
//            // 是否允许编辑（默认为NO）
//            imagePickerController.allowsEditing = YES;
//            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//            [self presentViewController:imagePickerController animated:YES completion:nil];
//        }
//    }];
    
    
    [self initTabbarView];
    
}

- (void)initTabbarView{
    @weakify(self);
    BYTabbarView *barView = [[BYTabbarView alloc] initWithImageArray:@[@"tabBar_activity",@"tabBar_find",@"tabBar_home",@"tabBar_mine"] clickBlock:^(NSInteger index) {
        @strongify(self);
        self.selectedIndex = index;
    } centerClickBLock:^{
        
    }];
    
    [self.view addSubview:barView];
    
    
    
    TestViewController *testVC = [[TestViewController alloc] init];
    self.viewControllers = @[testVC];
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
