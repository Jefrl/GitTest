//
//  HXLViewModel.h
//  MVVM下自定义不等高CellDemo
//
//  Created by Jefrl on 2017/8/21.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import <UIKit/UIKit.h>
// MVVM
@class HXLModel;

@interface HXLViewModel : NSObject

/**
 *  模型数据
 */
@property (nonatomic ,strong)HXLModel * status;


/**
 *  头像的frame
 */
@property (nonatomic ,assign)CGRect iconFrame;
/**
 *  昵称的frame
 */
@property (nonatomic ,assign)CGRect nameFrame;
/**
 *  vip的frame
 */
@property (nonatomic ,assign)CGRect vipFrame;
/**
 *  内容的frame
 */
@property (nonatomic ,assign)CGRect textFrame;
/**
 *  配图的frame
 */
@property (nonatomic ,assign)CGRect pictureFrame;



/**
 *  cell的高度
 */
@property (nonatomic ,assign)CGFloat cellHeight;
@end
