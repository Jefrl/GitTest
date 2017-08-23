//
//  HXLModel.h
//  MVVM下自定义不等高CellDemo
//
//  Created by Jefrl on 2017/8/21.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import <Foundation/Foundation.h>

#define XMGNameFont [UIFont systemFontOfSize:17]
#define XMGTextFont [UIFont systemFontOfSize:14]

@interface HXLModel : NSObject
/**
 *  图像
 */
@property (nonatomic ,copy)NSString *icon;
/**
 *  昵称
 */
@property (nonatomic ,copy)NSString *name;
/**
 *  vip
 */
@property (nonatomic ,assign ,getter=isVip)BOOL vip;
/**
 *  内容
 */
@property (nonatomic ,copy)NSString *text;
/**
 *  配图
 */
@property (nonatomic ,copy)NSString *picture;

+ (instancetype)statusWithDict:(NSDictionary *)dict;


@end
