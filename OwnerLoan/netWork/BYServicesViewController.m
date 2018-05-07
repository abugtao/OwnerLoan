//
//  BYServicesViewController.m
//  OwnerLoan
//
//  Created by user on 2018/5/2.
//  Copyright © 2018年 user. All rights reserved.
//

#import "BYServicesViewController.h"

@interface BYServicesViewController ()

@property (nonatomic,strong)NSArray  *hostsArray;
@end

@implementation BYServicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"变成服务器";
    self.hostsArray = @[@"http://mobiletest.tongbaotu.cn/api/",
                        @"https://mobile.tongbaotu.com/api/",
                        @"http://mobile.tongbaotu.new/api/",
                        @"http://mobiletest.tongbaotu.net/api/"];
    
    NSArray *titleArray = @[@"cn",@"com",@"new",@"net"];
    
    
    NSString *url = [[Config shareInstance] hostIp];
    NSInteger index = [self.hostsArray indexOfObject:url];
    
    for (int i = 0; i<titleArray.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
        btn.backgroundColor = [UIColor blueColor];
        if (index==i) {
            btn.backgroundColor = [UIColor redColor];
        }
        btn.tag = 10000+i;
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.center = CGPointMake(SCREEN_WDITH/2, 30+60*i);
        [self.view addSubview:btn];
    }
    
    
    
    
    

    
}

- (void)buttonAction:(UIButton *)btn{
    UIButton *cnBtn = [self.view viewWithTag:10000];
    UIButton *comBtn = [self.view viewWithTag:10001];
    UIButton *newBtn = [self.view viewWithTag:10002];
    UIButton *netBtn = [self.view viewWithTag:10003];
    cnBtn.backgroundColor = [UIColor blueColor];
    comBtn.backgroundColor = [UIColor blueColor];
    newBtn.backgroundColor = [UIColor blueColor];
    netBtn.backgroundColor = [UIColor blueColor];
    
    btn.backgroundColor = [UIColor redColor];
    
    Config *myconfig = [Config shareInstance];
    myconfig.hostIp = [self.hostsArray objectAtIndex:btn.tag - 10000];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)leftItemButtonAction{
    if (self.navigationController.viewControllers.count==1) {
        [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
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
