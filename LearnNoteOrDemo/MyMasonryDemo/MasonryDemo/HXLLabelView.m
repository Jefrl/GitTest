//
//  HXLLabelView.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLLabelView.h"

@interface HXLLabelView ()
/** label */
@property (nonatomic, readwrite, strong) UILabel *shortLabel;
/** label */
@property (nonatomic, readwrite, strong) UILabel *longLabel;

@end

@implementation HXLLabelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self loadInsideView];
    return self;
}

- (void)loadInsideView
{
    self.shortLabel = UILabel.new;
    self.shortLabel.backgroundColor = [UIColor cyanColor];
    self.shortLabel.numberOfLines = 0;
    self.shortLabel.textColor = [UIColor blackColor];
    self.shortLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.shortLabel.text = @"Bacon";
    [self addSubview:self.shortLabel];
    
    self.longLabel = UILabel.new;
    self.longLabel.backgroundColor = [UIColor lightGrayColor];
    self.longLabel.numberOfLines = 0;
    self.longLabel.textColor = [UIColor darkGrayColor];
    self.longLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.longLabel.text = @"Bacon ipsum dolor sit amet spare ribs fatback kielbasa salami, tri-tip jowl pastrami flank short loin rump sirloin. Tenderloin frankfurter chicken biltong rump chuck filet mignon pork t-bone flank ham hock.";
    [self addSubview:self.longLabel];
    
    [self.longLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.right.equalTo(self).offset(10);
    }];
    
    [self.shortLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.longLabel);
        make.top.equalTo(self.longLabel.lastBaseline);
    }];
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//    // for multiline UILabel's you need set the preferredMaxLayoutWidth
//    // you need to do this after [super layoutSubviews] as the frames will have a value from Auto Layout at this point
//    
//    // stay tuned for new easier way todo this coming soon to Masonry
//    
//    CGFloat width = CGRectGetMinX(self.shortLabel.frame) - 10;
//    width -= CGRectGetMinX(self.longLabel.frame);
//    self.longLabel.preferredMaxLayoutWidth = width;
//    
//    // need to layoutSubviews again as frames need to recalculated with preferredLayoutWidth
//    [super layoutSubviews];
//}


@end
