//
//  HXLViewController.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLViewController.h"

@interface HXLViewController ()
/** viewClass */
@property (nonatomic, readwrite, strong) Class viewClass;
@end

@implementation HXLViewController

- (instancetype)initWithViewClass:(Class)viewClass Title:(NSString *)title
{
    self = [super init];
    if (!self) return nil;
    
    self.viewClass = viewClass;
    self.title = title;
    return self;
}

// 1. 如果有 sb, xib, 控制器中的 View 就从这两个里面加载,
// 2. 如果没有就系统会调用控制器中的属性 view 的 get 方法获取;
// 3. 第一次获取过程, 系统会懒加载走完内部的 loadView, viewDidLoad 方法
// 注意点: loadView 内部自定义好的 view 要记得及时赋给 控制器的 view; 不然系统会检测到 view 没有值, 又会去调用 loadView, 造成死循环;

- (void)loadView
{
    self.view = [[self.viewClass alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

#ifdef __IPHONE_7_0 // 如果是 iOS 7 以上的版本依然, 从导航栏下部分开始布局
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif


@end





