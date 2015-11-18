//
//  LXDImageBrowser.h
//  LXDSegmentControl
//
//  Created by 林欣达 on 15/11/18.
//  Copyright © 2015年 LXD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXDImageBrowser : UIView

@property (nonatomic, assign) CGFloat segmentControlWidth;      //分栏控制器宽度

- (instancetype)initWithFrame: (CGRect)frame dataSource: (NSArray *)dataSource;

@property (nonatomic, strong) NSArray * dataSource;

@end
