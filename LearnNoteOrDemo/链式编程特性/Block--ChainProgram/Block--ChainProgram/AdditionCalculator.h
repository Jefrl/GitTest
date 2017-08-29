//
//  AdditionCalculator.h
//  Block--ChainProgram
//
//  Created by Jefrl on 2017/8/26.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AdditionCalculator;
@class MASConstraintsMark;

#pragma mark ===================== block 小温习 =====================
typedef AdditionCalculator *(^HXLBLOCK)(NSInteger prameter);

@interface AdditionCalculator : NSObject

+ (void)mas_getResultWithMakeBlock:(void (^)(MASConstraintsMark *mark))makeBlock;




@end
