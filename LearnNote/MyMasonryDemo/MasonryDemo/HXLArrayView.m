//
//  HXLArrayView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLArrayView.h"

static CGFloat const KArrayIncrement = 20.0;

@interface HXLArrayView ()
/** offsetY */
@property (nonatomic, readwrite, assign) CGFloat offsetY;
/** buttonViews */
@property (nonatomic, readwrite, strong) NSArray *buttonViews;

@end

@implementation HXLArrayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self loadInsideView];
    return self;
}

- (void)loadInsideView
{
    UIButton *raiseButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [raiseButton setTitle:@"raise" forState:UIControlStateNormal];
    [raiseButton addTarget:self action:@selector(raiseAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [centerButton setTitle:@"Center" forState:UIControlStateNormal];
    [centerButton setBackgroundColor:[UIColor greenColor]];
    [centerButton addTarget:self action:@selector(centerAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *lowerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [lowerButton setTitle:@"lower" forState:UIControlStateNormal];
    [lowerButton addTarget:self action:@selector(lowerAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:lowerButton];
    [self addSubview:centerButton];
    [self addSubview:raiseButton];
    self.buttonViews = @[lowerButton, centerButton, raiseButton];
    
    [lowerButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
    }];
    
    [centerButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
    }];
    
    [raiseButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
    }];
    
}

- (void)updateConstraints
{
    for (UIButton *btn  in self.buttonViews) {
        [btn updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).offset(self.offsetY);
        }];
    }
    
    [super updateConstraints];
}

#pragma mark ===================== 按钮响应的方法 =====================
- (void)centerAction:(UIButton *)sender
{
    self.offsetY = 0;
}

- (void)raiseAction:(UIButton *)sender
{
    self.offsetY -= KArrayIncrement;
}

- (void)lowerAction:(UIButton *)sender
{
    self.offsetY += KArrayIncrement;
}

- (void)setOffsetY:(CGFloat)offsetY
{
    _offsetY = offsetY;
    // tell constraints need update
    [self setNeedsUpdateConstraints];
    
    // now update constraints, so we can animate the change
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.2 animations:^{
        [self layoutIfNeeded];
    }];
}




@end
