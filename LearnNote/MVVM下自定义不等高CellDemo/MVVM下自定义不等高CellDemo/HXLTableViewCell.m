//
//  HXLTableViewCell.m
//  MVVM下自定义不等高CellDemo
//
//  Created by Jefrl on 2017/8/21.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLTableViewCell.h"
#import "HXLModel.h"
#import "HXLViewModel.h"

@interface HXLTableViewCell ()

/** 头像 */
@property(nonatomic, weak)UIImageView *iconImageView;
/** 昵称 */
@property(nonatomic, weak)UILabel *nameLabel;
/** vip */
@property(nonatomic, weak)UIImageView *vipImageView;
/** 内容(正文) */
@property(nonatomic, weak)UILabel *text_label;
/** 配图 */
@property(nonatomic, weak)UIImageView *pictureImageView;

@end

@implementation HXLTableViewCell

// 添加子控件的原则:把有可能显示的子控件先都添加进去,到时候根据数据显示或者隐藏就可以了,也就是设置控件的hidden属性.
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /** 头像 */
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        /** vip */
        UIImageView *vipImageView = [[UIImageView alloc] init];
        vipImageView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        
        /** 配图 */
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
        
        /** 昵称 */
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = XMGNameFont;
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        /** 内容(正文) */
        UILabel *text_label = [[UILabel alloc] init];
        text_label.font = XMGTextFont;
        text_label.numberOfLines = 0;
        [self.contentView addSubview:text_label];
        self.text_label = text_label;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconImageView.frame = self.statusFrame.iconFrame;
    self.nameLabel.frame = self.statusFrame.nameFrame;
    self.vipImageView.frame = self.statusFrame.vipFrame;
    self.text_label.frame = self.statusFrame.textFrame;
    self.pictureImageView.frame = self.statusFrame.pictureFrame;
    
}

- (void)setStatusFrame:(HXLViewModel *)statusFrame
{
    _statusFrame = statusFrame;
    
    HXLModel *status = statusFrame.status;
    
    self.iconImageView.image = [UIImage imageNamed:status.icon];
    self.nameLabel.text = status.name;
    
    if (status.isVip) {
        self.vipImageView.hidden = NO;
        self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        self.vipImageView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    self.text_label.text = status.text;
    
    if (status.picture) {
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:status.picture];
    } else {
        self.pictureImageView.hidden = YES;
    }
}



@end
