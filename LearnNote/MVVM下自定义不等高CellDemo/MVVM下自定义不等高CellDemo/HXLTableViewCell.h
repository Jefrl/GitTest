//
//  HXLTableViewCell.h
//  MVVM下自定义不等高CellDemo
//
//  Created by Jefrl on 2017/8/21.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXLViewModel.h"

@interface HXLTableViewCell : UITableViewCell
/** statusFrame */
@property (nonatomic, readwrite, strong) HXLViewModel *statusFrame;

@end
