//
//  ViewController.m
//  LXDSegmentControl
//
//  Created by 林欣达 on 15/10/27.
//  Copyright © 2015年 LXD. All rights reserved.
//

#import "ViewController.h"
#import "LXDSegmentControl.h"
#import "LXDScrollViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    
//    CGFloat centerY = self.view.center.y - 80;
//    NSArray * types = @[@"下标移动", @"选中变色", @"形变突出"];
//    for (int i = 0; i < 3; i++) {
//        UIButton * button = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 200, 40)];
//        button.backgroundColor = kRGB(123, 189, 229);
//        [button setTitle: types[i] forState: UIControlStateNormal];
//        button.center = (CGPoint){ self.view.center.x, centerY + i * 80 };
//        button.tag = i;
//        [button addTarget: self action: @selector(showSegmentControlEffect:) forControlEvents: UIControlEventTouchUpInside];
//        [self.view addSubview: button];
//    }
//
    
    CGRect frame = CGRectMake(0, 0, 200.f, 35.f);
    NSArray * items = @[@"123", @"456", @"789"];
    
    LXDSegmentControlConfiguration * slide = [LXDSegmentControlConfiguration configurationWithControlType: LXDSegmentControlTypeSlideBlock items: items];
    LXDSegmentControl * slideControl = [LXDSegmentControl segmentControlWithFrame: frame configuration: slide delegate: nil];
    slideControl.center = (CGPoint){ self.view.center.x, self.view.center.y - 80 };
    [self.view addSubview: slideControl];
    slideControl.currentIndex = 2;
    
    LXDSegmentControlConfiguration * select = [LXDSegmentControlConfiguration configurationWithControlType: LXDSegmentControlTypeSelectBlock items: items];
    LXDSegmentControl * selectControl = [LXDSegmentControl segmentControlWithFrame: frame configuration: select delegate: nil];
    selectControl.center = (CGPoint){ self.view.center.x, self.view.center.y };
    [self.view addSubview: selectControl];
    
    LXDSegmentControlConfiguration * scale = [LXDSegmentControlConfiguration configurationWithControlType: LXDSegmentControlTypeScaleTitle items: items];
    LXDSegmentControl * scaleControl = [LXDSegmentControl segmentControlWithFrame: frame configuration: scale delegate: nil];
    scaleControl.center = (CGPoint){ self.view.center.x, self.view.center.y + 80 };
    [self.view addSubview: scaleControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)showSegmentControlEffect: (UIButton *)sender
{
    LXDScrollViewController * scrollController = [LXDScrollViewController new];
    scrollController.controlType = (LXDSegmentControlType)sender.tag;
    [self.navigationController pushViewController: scrollController animated: YES];
}


@end
