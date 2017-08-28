//
//  HXLScrollView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLScrollView.h"

@interface HXLScrollView ()
/** scrollView */
@property (nonatomic, readwrite, strong) UIScrollView *scrollView;

@end

@implementation HXLScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self loadInsideView];
    return self;
}

- (void)loadInsideView
{
    
    self.scrollView = [UIScrollView new];
    self.scrollView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.scrollView];
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsZero);
        make.width.equalTo(self);
    }];
    
    UIView *contentView = [UIView new];
    [self.scrollView addSubview:contentView];
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    
    UIView *lastView;
    CGFloat height = 25.0;
    for (NSInteger i = 0; i < 10; i++) {
        UIView *view = UIView.new;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewGesture:)];
        [view addGestureRecognizer:tapGes];
        [contentView addSubview:view];
        view.backgroundColor = [self randomColor];
        
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastView ? lastView.bottom : @0);
            make.left.right.equalTo(0);
            make.height.equalTo(height);
        }];
        
        height += 25;
        lastView = view;
    }
    
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.bottom);
    }];
}

- (UIColor *)randomColor
{
    CGFloat hue = arc4random() % 256 / 255.0;
    CGFloat saturation = arc4random() % 129 / 256 + 0.5;
    CGFloat brightness = arc4random() % 129 /256 + 0.5;
    UIColor *randomColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return randomColor;
}

- (void)tapViewGesture:(UITapGestureRecognizer *)sender
{
    sender.view.alpha = sender.view.alpha * 0.8;
    [self.scrollView scrollRectToVisible:sender.view.frame animated:YES];
}
@end
