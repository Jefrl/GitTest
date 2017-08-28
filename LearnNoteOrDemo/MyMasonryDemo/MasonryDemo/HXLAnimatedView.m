//
//  HXLAnimatedView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLAnimatedView.h"

@interface HXLAnimatedView ()
/** padInsets */
@property (nonatomic, readwrite, assign) UIEdgeInsets padInsets;
/** padding */
@property (nonatomic, readwrite, assign) NSInteger padding;
/** constrainArray */
@property (nonatomic, readwrite, strong) NSArray *constrainArray;
/** Animating */
@property (nonatomic, readwrite, assign) BOOL animating;

@end

@implementation HXLAnimatedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self loadInsideView];
    return self;
}

- (void)loadInsideView
{
    self.padding = 10;
    UIView *superView = self;
    self.padInsets = UIEdgeInsetsMake(self.padding, self.padding, self.padding, self.padding);
    
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
    
    
    // 开始 AutoLayout 布局
    NSMutableArray *arrM = [NSMutableArray array];
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        [arrM addObjectsFromArray:@[make.edges.equalTo(superView).insets(self.padInsets).priorityLow(),
        make.bottom.equalTo(blueView.top).offset(-self.padding)]];
        
        make.size.equalTo(redView);
        make.height.equalTo(blueView.height);
    }];
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
        [arrM addObjectsFromArray:@[make.edges.equalTo(superView).insets(self.padInsets).priorityLow(),
        make.left.equalTo(greenView.right).offset(self.padding),
        make.bottom.equalTo(blueView.top).offset(-self.padding)]];
        
        make.size.equalTo(greenView);
        make.height.equalTo(blueView.height);
    }];
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        [arrM addObjectsFromArray:@[make.edges.equalTo(superView).insets(self.padInsets).priorityLow()]];
        // 如果是形状尺寸, 多余尺寸没问题,
        // 如果是定位尺寸, 就会警报冲突, 因为优先级会冲突, 100 与 -10 的 padding 冲突;
//        make.top.equalTo(greenView.bottom).offset(self.padding);
        
        make.height.equalTo(greenView.height);
        make.height.equalTo(redView.height);
    }];
    
    self.constrainArray = arrM;
    
}

- (void)willMoveToWindow:(UIWindow *)newWindow
{
//    self.animating = newWindow != nil;
}

- (void)didMoveToWindow
{
//    if (self.window) {
        [self dispalyAnimation:NO];
//    }
}

- (void)dispalyAnimation:(BOOL)invertedInsets
{
//    if (!self.animating) return;
//    NSLog(@"display");
    
    NSInteger padding = invertedInsets ? 100 : self.padding;
    self.padInsets = UIEdgeInsetsMake(padding, padding, padding, padding);
    for (MASConstraint *constraint in self.constrainArray) {
        constraint.insets = self.padInsets;
    }
    
    [UIView animateWithDuration:1 animations:^{
        // 约束更改后, 主动刷新布局
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self dispalyAnimation:!invertedInsets];
    }];
}



@end
