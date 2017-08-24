//
//  HXLRemakeView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLRemakeView.h"

@interface HXLRemakeView ()
/** remakebtton */
@property (nonatomic, readwrite, weak) UIButton *remakebtton;
/** topLeft */
@property (nonatomic, readwrite, assign) BOOL topLeft;
/** 方式二移除约束 */
@property (nonatomic, readwrite, strong) MASConstraint *constraintWidth;
/** <#name#> */
@property (nonatomic, readwrite, strong) MASConstraint *constraintHeight;

@end

@implementation HXLRemakeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self loadInsideView];
    return self;
}

- (void)loadInsideView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Move me!" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.layer.borderWidth = 3;
    button.layer.borderColor = [[UIColor greenColor] CGColor];
    [button addTarget:self action:@selector(didTapRemakeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    self.remakebtton = button;
    self.topLeft = YES;
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

- (void)updateConstraints
{
    [self.remakebtton remakeConstraints:^(MASConstraintMaker *make) {    
        make.width.equalTo(@100).priorityLow();
        make.height.equalTo(@100).priorityLow();
        
        if (self.topLeft) {
//            make.width.equalTo(@100);
//            make.height.equalTo(@100);
            make.top.equalTo(10);
            make.left.equalTo(10);
        }
        else {
            //方式二:
//            make.top.equalTo(130);
//            make.left.equalTo(130);
            make.bottom.equalTo(-10);
            make.right.equalTo(-10);
        }
    }];
    
    NSLog(@"%@", self.remakebtton.constraints);
    NSLog(@"%@", NSStringFromCGRect(self.remakebtton.frame));
    [super updateConstraints];
}


- (void)didTapRemakeButton:(UIButton *)sender
{
    self.topLeft = !self.topLeft;
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
