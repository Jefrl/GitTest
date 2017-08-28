//
//  HXLConstantsView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLConstantsView.h"

@implementation HXLConstantsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self addInsideView];
    return self;
}

- (void)addInsideView
{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i++) {
        UIView *view = [UIView new];
        view.layer.borderWidth = 2;
        view.layer.borderColor = [[UIColor blackColor] CGColor];
        [self addSubview:view];
        [arrayM addObject:view];
    }
    
    UIView *greenView = arrayM[0];
    greenView.backgroundColor = [UIColor greenColor];
    
    UIView *blueView = arrayM[1];
    blueView.backgroundColor = [UIColor blueColor];
    
    UIView *redView = arrayM[2];
    redView.backgroundColor = [UIColor redColor];
    
    UIView *superView = self;
    // 开始 AutoLayout 布局
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.top).offset(20); // 直接写数值, 就默认跟父控件比较
        make.left.equalTo(20);
        make.bottom.equalTo(-20);
        make.right.equalTo(-20);
    }];
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(CGPointZero);
        make.size.equalTo(CGSizeMake(200, 200));
    }];
    // 写的形式尽量保持一种, 有时会框架报错
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(CGPointMake(0, 50)); // 默认与父控件的中心点比较;
        make.size.equalTo(CGSizeMake(100, 100));
    }];
    
}

@end
