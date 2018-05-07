//
//  UIView+BYHelper.m
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import "UIView+BYHelper.h"
#import <objc/runtime.h>
static char overviewKey;
@implementation UIView (BYHelper)
- (void)setClickBlock:(void(^)(void))block{
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClick)];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)didClick
{
    void (^block)(void) =  objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}
@end
