//
//  HXLUpdateView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLUpdateView.h"

@interface HXLUpdateView ()
/** buttonSize */
@property (nonatomic, readwrite, assign) CGSize buttonSize;
/** growbtton */
@property (nonatomic, readwrite, weak) UIButton *growButton;



@end

@implementation HXLUpdateView

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
    [button setTitle:@"Grow me!" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.layer.borderWidth = 3;
    button.layer.borderColor = [[UIColor greenColor] CGColor];
    [button addTarget:self action:@selector(didTapGrowButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonSize = CGSizeMake(100, 100);
    [self addSubview:button];
    self.growButton = button;
}

- (void)updateConstraints
{
    // call updateConstraints^
    [self.growButton updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.buttonSize.width);//.priorityLow();
        make.height.equalTo(self.buttonSize.height);//.priorityLow();
        make.center.equalTo(self);
        
//        make.width.lessThanOrEqualTo(self);
//        make.height.lessThanOrEqualTo(self);
    }];
    
    NSLog(@"%@", NSStringFromCGRect(self.growButton.frame));
    // 注意了, 苹果要求
    [super updateConstraints];
}

/*
 constraint-based layout engages lazily when someone tries to use it (e.g., adds a constraint to a view).  If you do all of your constraint set up in -updateConstraints, you might never even receive updateConstraints if no one makes a constraint.  To fix this chicken and egg problem, override this method to return YES if your view needs the window to use constraint-based layout
 */
+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}


- (void)didTapGrowButton:(UIButton *)sender
{
    self.buttonSize = CGSizeMake(self.buttonSize.width * 1.3, self.buttonSize.height * 1.3);
    //
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
