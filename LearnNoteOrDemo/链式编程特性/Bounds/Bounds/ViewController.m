//
//  ViewController.m
//  Bounds
//
//  Created by Jefrl on 2017/8/23.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollview.contentSize = CGSizeMake(300, 300);
    self.scrollview.backgroundColor = [UIColor brownColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGRect bounds = self.scrollview.bounds;
    bounds.origin.x = bounds.origin.x + 10;
    self.scrollview.bounds = bounds;
}

@end
