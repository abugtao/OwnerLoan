//
//  BYRequestLogViewController.m
//  OwnerLoan
//
//  Created by user on 2018/5/4.
//  Copyright © 2018年 user. All rights reserved.
//

#import "BYRequestLogViewController.h"

@interface BYRequestLogViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *requestArray;
@end

@implementation BYRequestLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"网络请求";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WDITH, SCREEN_HEIGTH - TOP_CONST_HEIGHT) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.requestArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.requestArray[indexPath.row];
    cell.textLabel.font = DiyFont(15);
    cell.textLabel.numberOfLines = 0;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = [self.requestArray objectAtIndex:indexPath.row];
    CGSize contentSize = [str boundingRectWithSize:CGSizeMake(SCREEN_WDITH - 30, MAXFLOAT)
                                                 options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading
                                              attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]}
                                                 context:nil].size;
    return contentSize.height + 20;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSMutableArray *)requestArray{
    if (!_requestArray) {
        
        NSArray *array = [NSArray arrayWithContentsOfFile:[BYFileTool getRequestArrayPath]];
        
        if (array.count) {
            _requestArray = [[NSMutableArray alloc] initWithArray:array];
        }else{
            _requestArray = [[NSMutableArray alloc] init];
        }
        
    }return _requestArray;
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
