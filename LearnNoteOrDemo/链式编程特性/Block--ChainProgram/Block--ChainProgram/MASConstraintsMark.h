//
//  MASConstraintsMark.h
//  Block--ChainProgram
//
//  Created by Jefrl on 2017/8/26.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MASConstraintsMark : NSObject
/** result */
@property (nonatomic, readwrite, assign) CGFloat result;

/** getAdditionBlock */
@property (nonatomic, readwrite, copy) MASConstraintsMark *(^getAdditionBlock)(CGFloat prameters);



@end
