//
//  BYTabbarView.m
//  OwnerLoan
//
//  Created by user on 2018/5/2.
//  Copyright © 2018年 user. All rights reserved.
//

#import "BYTabbarView.h"

@interface BYTabbarView()
/// 当前选中的位置
@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic,strong)UIButton *centerBtn;
@end

@implementation BYTabbarView
- (instancetype)initWithImageArray:(NSArray *)imgArray clickBlock:(void(^)(NSInteger index))block centerClickBLock:(void(^)(void))centerBlock{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, SCREEN_HEIGTH - TOP_CONST_HEIGHT - BOTTOM_CONST_HEIGHT, SCREEN_WDITH, BOTTOM_CONST_HEIGHT);
        self.backgroundColor = [UIColor yellowColor];
        
        
        
        self.centerBtn.center = CGPointMake(self.width/2, self.centerBtn.height/2 - 10);
        [self addSubview:self.centerBtn];
        [[self.centerBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            centerBlock();
        }];
        
        
        
        
        CGFloat barItemWidth = (self.width - self.centerBtn.width) / imgArray.count;
        NSMutableArray *btnArray = [NSMutableArray arrayWithCapacity:4];
        for (int i=0; i<imgArray.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnArray addObject:btn];
            btn.frame = CGRectMake(0, 0, barItemWidth, 50);
//            btn.backgroundColor = [UIColor redColor];
            [btn setImage:[UIImage imageNamed:imgArray[i]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:imgArray[0]] forState:UIControlStateSelected];
            if (i >= imgArray.count / 2) {
                // 重新设置x坐标，如果排在中间按钮的右边需要加上中间按钮的宽度
                btn.left = i * barItemWidth + self.centerBtn.width;
            } else {
                btn.left = i * barItemWidth;
            }
            [self addSubview:btn];
            
            
            [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                block(i);
                for (UIButton *itemBtn in btnArray) {
                    itemBtn.selected = NO;
                }
                btn.selected = YES;
            }];
        }
        
        
    }
    return self;
}




- (UIButton *)centerBtn
{
    if (_centerBtn == nil) {
        _centerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        [_centerBtn setImage:[UIImage imageNamed:@"centerIcon"] forState:UIControlStateNormal];
    }
    return _centerBtn;
}



- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 先使用默认的方法来寻找 hit-TestView
    UIView *result = [super hitTest:point withEvent:event];
    // 如果 result 不为 nil，说明触摸事件发生在 tabbar 里面，直接返回就可以了
    if (result) {
        return result;
    }
    // 到这里说明触摸事件不发生在 tabBar 里面
    // 这里遍历那些超出的部分就可以了，不过这么写比较通用。
    for (UIView *subview in self.subviews) {
        // 把这个坐标从tabbar的坐标系转为subview的坐标系
        CGPoint subPoint = [subview convertPoint:point fromView:self];
        result = [subview hitTest:subPoint withEvent:event];
        // 如果事件发生在subView里就返回
        if (result) {
            return result;
        }
    }
    return nil;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
