//
//  LXDScrollViewController.m
//  LXDSegmentControl
//
//  Created by 林欣达 on 15/10/27.
//  Copyright © 2015年 LXD. All rights reserved.
//

#import "LXDScrollViewController.h"

@interface LXDScrollViewController ()<LXDSegmentControlDelegate>

@end

@implementation LXDScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    LXDSegmentControlConfiguration * configuration = [LXDSegmentControlConfiguration configurationWithControlType: _controlType items: @[@"红", @"绿", @"蓝"]];
    LXDSegmentControl * segmentControl = [LXDSegmentControl segmentControlWithFrame: CGRectMake(CGRectGetWidth(self.view.frame) * 0.5f - 100.f, 10.f, 200.f, 30.f) configuration: configuration delegate: self];

    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 45.f, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 45.f)];
    scrollView.contentSize = CGSizeMake(3 * CGRectGetWidth(self.view.frame), 0);
    NSArray * colors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
    for (int i = 0; i < colors.count; i++) {
        CGRect frame = scrollView.bounds;
        frame.origin.x = i * CGRectGetWidth(frame);
        UIView * view = [[UIView alloc] initWithFrame: frame];
        view.backgroundColor = colors[i];
        [scrollView addSubview: view];
    }
    segmentControl.scrollView = scrollView;
    [self.view addSubview: segmentControl];
    [self.view addSubview: scrollView];
}


#pragma mark - LXDSegmentControlDelegate
- (void)segmentControl:(LXDSegmentControl *)segmentControl didSelectAtIndex:(NSUInteger)index
{
    NSLog(@"click %lu button", index);
}


@end
