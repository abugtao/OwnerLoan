//
//  BYTabbarView.h
//  OwnerLoan
//
//  Created by user on 2018/5/2.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYTabbarView : UIView

- (instancetype)initWithImageArray:(NSArray *)imgArray clickBlock:(void(^)(NSInteger index))block centerClickBLock:(void(^)(void))centerBlock;

@end
