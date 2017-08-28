//
//  HXLAspectFitView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLAspectFitView.h"

@interface HXLAspectFitView ()
@property UIView *topView;
@property UIView *topInnerView;
@property UIView *bottomView;
@property UIView *bottomInnerView;

@end

@implementation HXLAspectFitView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self loadInsideView];
    return self;
}

- (void)loadInsideView
{
    self.topView = [[UIView alloc] init ];
    [self addSubview:self.topView];
    
    self.topInnerView = [[UIView alloc] init ];
    [self.topView addSubview:self.topInnerView];
    
    self.bottomView = [[UIView alloc] init ];
    [self addSubview:self.bottomView];
    
    UIView *bottomInnerView = [[UIView alloc] init ];
    [self.bottomView addSubview:bottomInnerView];
    
    // Set background colors
    UIColor *blueColor = [UIColor colorWithRed:0.663 green:0.796 blue:0.996 alpha:1];
    [ self.topView setBackgroundColor:blueColor];
    
    UIColor *lightGreenColor = [UIColor colorWithRed:0.784 green:0.992 blue:0.851 alpha:1];
    [ self.topInnerView setBackgroundColor:lightGreenColor];
    
    UIColor *pinkColor = [UIColor colorWithRed:0.992 green:0.804 blue:0.941 alpha:1];
    [ self.bottomView setBackgroundColor:pinkColor];
    
    UIColor *darkGreenColor = [UIColor colorWithRed:0.443 green:0.780 blue:0.337 alpha:1];
    [ bottomInnerView setBackgroundColor:darkGreenColor];
    
    // 布局
    [self.topView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.right.equalTo(self);
    }];
    
    [self.bottomView makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.and.right.equalTo(self);
        make.top.equalTo(self.topView.bottom);
        make.height.equalTo(self.topView);
    }];
    
    [self.topInnerView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.topInnerView.height).multipliedBy(3);
        make.width.and.height.lessThanOrEqualTo(self);
        make.width.and.height.equalTo(self.topView).width.priorityLow();
        make.center.equalTo(self.topView);
    }];
    
    [bottomInnerView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(bottomInnerView.width).multipliedBy(3);
        make.height.height.lessThanOrEqualTo(bottomInnerView.height);
        make.width.height.equalTo(self.bottomView).priorityLow();
        make.center.equalTo(self.bottomView);
    }];
    
}

@end
