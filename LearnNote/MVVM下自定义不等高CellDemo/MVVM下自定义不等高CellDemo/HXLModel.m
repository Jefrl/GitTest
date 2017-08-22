//
//  HXLModel.m
//  MVVM下自定义不等高CellDemo
//
//  Created by Jefrl on 2017/8/21.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLModel.h"

@implementation HXLModel

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    HXLModel *status = [[self alloc] init];
    [status setValuesForKeysWithDictionary:dict];
    return status;
}

@end
