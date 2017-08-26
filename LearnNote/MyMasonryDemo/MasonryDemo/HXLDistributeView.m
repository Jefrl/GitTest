//
//  HXLDistributeView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLDistributeView.h"

@implementation HXLDistributeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    NSMutableArray *arr = @[].mutableCopy;
    for (int i = 0; i < 4; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        view.layer.borderColor = UIColor.blackColor.CGColor;
        view.layer.borderWidth = 2;
        [self addSubview:view];
        [arr addObject:view];
    }
    
    /** 可变数组的规律性布局
     1. MASAxisTypeHorizontal / MASAxisTypeVertical 横向或纵向
     2. withFixedSpacing / withFixedItemLength 间距 / item 条的长度
     3. leadSpacing:15 
     4. tailSpacing:5
     */
    [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:60 leadSpacing:15 tailSpacing:5];
    [arr makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@60);
        make.height.equalTo(@60);
    }];
    
//    [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:20 leadSpacing:5 tailSpacing:5];
//    [arr makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(@0);
//        make.width.equalTo(@60);
//    }];
//    
//    [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:30 leadSpacing:200 tailSpacing:30];
//    [arr makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@60);
//        make.height.equalTo(@60);
//    }];
//    
//    [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:30 leadSpacing:30 tailSpacing:200];
//    [arr makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(@0);
//        make.width.equalTo(@60);
//    }];
    
    
    return self;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
