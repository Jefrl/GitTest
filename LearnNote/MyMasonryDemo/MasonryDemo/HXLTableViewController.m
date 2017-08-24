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
                  [[HXLViewController alloc] initWithViewClass:HXLBasicView.class Title:@"Constraints  Basic"],
                  [[HXLViewController alloc] initWithViewClass:[HXLUpdateView class] Title:@"Constraints Update"],
                  [[HXLViewController alloc] initWithViewClass:[HXLRemakeView class] Title:@"Constraints Remake"],
                  [[HXLViewController alloc] initWithViewClass:[HXLConstantsView class] Title:@"Constraints Constants"],
                  [[HXLViewController alloc] initWithViewClass:[HXLSidesView class] Title:@"Sides Constants"],
                  [[HXLViewController alloc] initWithViewClass:[HXLAspectFitView class] Title:@"AspectFit Constants"],
                  [[HXLViewController alloc] initWithViewClass:[HXLAnimatedView class] Title:@"Animated Constants"],
                  [[HXLViewController alloc] initWithViewClass:[HXLDebuggingView class] Title:@"debug"],
                  [[HXLViewController alloc] initWithViewClass:[HXLLabelView class] Title:@"Label Constants"],
                  [[HXLViewController alloc] initWithViewClass:[HXLScrollView class] Title:@"ScrollView Constants"],
                  [[HXLViewController alloc] initWithViewClass:[HXLArrayView class] Title:@"ArrayView Constants"],
                  [[HXLViewController alloc] initWithViewClass:[HXLAttributeChainingView class] Title:@"AttributeChainingView Constants"],
                  [[HXLViewController alloc] initWithViewClass:[HXLMarginView class] Title:@"MarginView Constants"],
                  [[HXLViewController alloc] initWithViewClass:[HXLDistributeView class] Title:@"DistributeView Constants"],
                  
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
