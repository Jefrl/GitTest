//
//  AdditionCalculator.m
//  Block--ChainProgram
//
//  Created by Jefrl on 2017/8/26.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "AdditionCalculator.h"
#import "MASConstraintsMark.h"

@interface AdditionCalculator ()

@end

@implementation AdditionCalculator
+ (void)mas_getResultWithMakeBlock:(void (^)(MASConstraintsMark *mark))makeBlock
{
    MASConstraintsMark *mark = [MASConstraintsMark new];
    makeBlock(mark);
}



@end
