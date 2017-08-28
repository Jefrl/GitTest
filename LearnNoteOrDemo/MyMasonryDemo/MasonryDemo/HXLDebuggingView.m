//
//  HXLDebuggingView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLDebuggingView.h"

@implementation HXLDebuggingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return self;
    
    [self loadInsideView];
    return self;
}

- (void)loadInsideView
{
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self addSubview:blueView];
    
    UIView *superview = self;
    UIEdgeInsets padding = UIEdgeInsetsMake(100, 10, 5, 10);
    
    //=================================================================
#pragma mark ===================== 绑定调试 =====================
    
    //    // 01. you can attach debug keys to views like so:
    //        greenView.mas_key = @"greenView";
    //        redView.mas_key = @"redView";
    //        blueView.mas_key = @"blueView";
    //        superview.mas_key = @"superview";
    
    // 02. OR you can attach keys automagically like so:
    MASAttachKeys(greenView, redView, blueView, superview);
    
    //=================================================================
    
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        // chain attributes
        make.top.and.left.equalTo(superview).insets(padding);
        
        // which is the equivalent of
        //        make.top.greaterThanOrEqualTo(superview).insets(padding);
        //        make.left.greaterThanOrEqualTo(superview).insets(padding);
        
        //        make.bottom.equalTo(blueView.mas_top).insets(padding).key(@"68. GGmakeBottom"); // 冲突代码
        make.right.equalTo(redView.mas_left).insets(padding);
        make.width.equalTo(redView);
        
        make.height.equalTo(@[redView, blueView]);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        // chain attributes
        make.top.and.right.equalTo(superview).insets(padding);
        
        make.left.equalTo(greenView.mas_right).insets(padding);
        make.bottom.equalTo(blueView.mas_top).insets(padding).key(@"80. RRmakeBottom"); // 冲突代码
        make.width.equalTo(greenView);
        
        make.height.equalTo(@[greenView, blueView]);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_bottom).insets(padding);
        
        // chain attributes
        make.left.right.and.bottom.equalTo(superview).insets(padding).key(@"90. BBmakeBottom"); // 冲突代码
        
        make.height.equalTo(@[greenView, redView]);
    }];
}

@end
