//
//  TestViewController.m
//  OwnerLoan
//
//  Created by user on 2018/4/27.
//  Copyright © 2018年 user. All rights reserved.
//

#import "TestViewController.h"
#import "SecondViewController.h"
#import "BYServicesViewController.h"
#import "CommonService.h"






@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"haha";
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WDITH, SCREEN_HEIGTH - 300) style:UITableViewStylePlain];;
    tableView.backgroundColor = [UIColor yellowColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        SecondViewController *vc = [[SecondViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
        
        
//        MGLiveManager *manager = [[MGLiveManager alloc] init];
//        [manager startFaceDecetionViewController:self finish:^(FaceIDData *faceData, UIViewController *vc) {
//
//        } error:^(MGLivenessDetectionFailedType errorType, UIViewController *vc) {
//
//        }];
        
//        MGIDCardViewController * idcard = [[MGIDCardViewController alloc] init];
//
//
//        idcard.IDCardSide = IDCARD_SIDE_FRONT;
//
//        idcard = [idcard initWithDefaultSetting];
//        idcard.cardResultDelegate = self;
//
//        [self presentViewController:idcard animated:YES completion:nil];
        
        
        [[[CommonService alloc] init] requestLoginWithParam:nil succCallback:^(HTResponse *response) {

        } failCallback:^(HTResponse *response) {

        }];
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = @"1";
    return cell;
    
    
}

- (void)leftItemButtonAction{
    
    
    
    BYServicesViewController *servicesVC = [[BYServicesViewController alloc] init];
    [self.navigationController pushViewController:servicesVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
//    self presentViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#> completion:<#^(void)completion#>
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *array = @[@"你好",@"a",@"发个"];
    NSDictionary *dic  = @{@"1":array,@"2":array,@"3":array,@"4":array};
    NSArray *keyArray = [dic allKeys];
    TLog(@"%@",array);
    TLog(@"%@",dic);
    
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
