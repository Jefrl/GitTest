//
//  ViewController.m
//  Block--ChainProgram
//
//  Created by Jefrl on 2017/8/26.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "ViewController.h"
#import "AdditionCalculator.h"
#import "MASConstraintsMark.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}

- (void)test {
    
    __block MASConstraintsMark *constrainsMark;
    
    [AdditionCalculator mas_getResultWithMakeBlock:^(MASConstraintsMark *mark) {
        constrainsMark = mark.getAdditionBlock(1).getAdditionBlock(2).getAdditionBlock(3);
    }];
    
    NSLog(@"result= %.2f", constrainsMark.result);
}


@end
