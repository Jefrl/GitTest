
//
//  HXLSidesView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLSidesView.h"

@implementation HXLSidesView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self loadInsideView];
    return self;
}

- (void)loadInsideView
{
    UIView *lastView = self;
    for (NSInteger i = 0; i< 10; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [self randomColor];
        view.layer.borderWidth = 2;
        view.layer.borderColor = UIColor.blackColor.CGColor;
        [self addSubview:view];
        
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(5, 10, 15, 20));
        }];
        
        lastView = view;
    }
}

- (UIColor *)randomColor
{
    CGFloat red = arc4random() % 256 / 255.0;
    CGFloat green = arc4random() % 128 / 255.0 + 0.5;
    CGFloat blue = arc4random() % 128 / 255.0 + 0.5;
    
//    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    UIColor *randomColor = [UIColor colorWithHue:red saturation:green brightness:blue alpha:1];
    return randomColor;
}

@end
