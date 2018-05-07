//
//  BYBaseViewController.h
//  OwnerLoan
//
//  Created by user on 2018/4/27.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYBaseViewController : UIViewController
@property (nonatomic,strong)UIButton *leftItemButton;
@property (nonatomic,strong)UIButton *rightItemButton;

- (void)setLeftItemWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title;

- (void)setRightItemWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title;


@end
