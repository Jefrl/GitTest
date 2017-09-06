//
//  MASConstraintsMark.m
//  Block--ChainProgram
//
//  Created by Jefrl on 2017/8/26.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "MASConstraintsMark.h"

@implementation MASConstraintsMark

/* override getter */
- (MASConstraintsMark *(^)(CGFloat))getAdditionBlock
{
    MASConstraintsMark *(^tempBlock)(CGFloat) = ^MASConstraintsMark * (CGFloat prameters) {
        self.result += prameters;
        return self;
    };
    return tempBlock;
}


@end
