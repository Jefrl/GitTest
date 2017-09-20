//
//  HXLBasicView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLBasicView.h"

@implementation HXLBasicView

// init 会调用 initWithFrame 方法;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    // 子控件的搭建
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
    
    UIView *redView = arrayM[1];
    redView.backgroundColor = [UIColor redColor];
    
    UIView *blueView = arrayM[2];
    blueView.backgroundColor = [UIColor blueColor];
    
    NSInteger padding = 10;
    UIView *superView = self;
    // 开始 AutoLayout 布局
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(superView.top).offset(padding);
        make.left.equalTo(superView.left).offset(padding);
        make.bottom.equalTo(blueView.top).offset(-padding);
        make.right.equalTo(redView.left).offset(-padding);
        
        make.width.equalTo(redView.width);
        make.height.equalTo(redView);
        make.height.equalTo(blueView.height);
    }];
    
    // 写的形式尽量保持同一种
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.top).offset(padding);//also allow with mas_ and with
        make.left.equalTo(greenView.right).offset(padding);
        make.bottom.equalTo(blueView.top).offset(-padding);
        make.right.equalTo(superView.right).offset(-padding);
        
        make.width.equalTo(greenView.width);
        make.height.equalTo(@[greenView, blueView]); // 可以是 View 对象数组
    }];
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.bottom).with.offset(padding);
        make.left.equalTo(superView.left).offset(padding);
        make.bottom.equalTo(superView.bottom).offset(-padding);
        make.right.equalTo(superView.right).offset(-padding);
        
        make.height.equalTo(@[redView.height, greenView.height]);
    }];
    
    
}



@end
