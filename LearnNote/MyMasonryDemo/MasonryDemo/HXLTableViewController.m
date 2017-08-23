//
//  HXLTableViewController.m
//  MasonryDemo
//
//  Created by Jefrl on 2017/8/22.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLTableViewController.h"

#import "HXLViewController.h"
#import "HXLBasicView.h"
#import "HXLConstantsView.h"
#import "HXLSidesView.h"
#import "HXLAnimatedView.h"
#import "HXLDebuggingView.h"
#import "HXLLabelView.h"
#import "HXLUpdateView.h"
#import "HXLRemakeView.h"
#import "HXLScrollView.h"
#import "HXLArrayView.h"
#import "HXLAttributeChainingView.h"
#import "HXLAspectFitView.h"
#import "HXLMarginView.h"
#import "HXLDistributeView.h"


@interface HXLTableViewController ()
/** 数组 */
@property (nonatomic, readwrite, strong) NSArray *exampleControllers;
@end

@implementation HXLTableViewController

static NSString * const reuseIdentifier = @"cell";

- (NSArray *)exampleControllers
{
    if (!_exampleControllers) {
        NSArray *array  = [NSArray array];
        
        array = @[
                  [[HXLViewController alloc] initWithViewClass:HXLBasicView.class Title:@"Constraints  的通用布局"],
                  [[HXLViewController alloc] initWithViewClass:[HXLConstantsView class] Title:@"Constraints 的常量布局"],
                  [[HXLViewController alloc] initWithViewClass:[HXLUpdateView class] Title:@"Constraints update"],
                  [[HXLViewController alloc] initWithViewClass:[HXLSidesView class] Title:@"sides"],
                  [[HXLViewController alloc] initWithViewClass:[HXLAnimatedView class] Title:@"animated"],
                  [[HXLViewController alloc] initWithViewClass:[HXLDebuggingView class] Title:@"debug"]
                  
                  
                  ];
        _exampleControllers = array;
    }
    return _exampleControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Masonry 框架的 Demo ";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
}

#pragma mark ============== TableView data source ==============

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.exampleControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.exampleControllers[indexPath.row] title];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:self.exampleControllers[indexPath.row] animated:YES];
}


@end
