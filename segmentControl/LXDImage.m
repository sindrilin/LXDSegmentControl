//
//  LXDImage.m
//  LXDSegmentControl
//
//  Created by 林欣达 on 15/11/18.
//  Copyright © 2015年 LXD. All rights reserved.
//

#import "LXDImage.h"
#import <UIKit/UIKit.h>

@implementation LXDImage

- (instancetype)init
{
    if (self = [super init]) {
        _image1_url = _image2_url = [NSString stringWithFormat: @""];
    }
    return self;
}

+ (double)height
{
    return CGRectGetWidth([UIScreen mainScreen].bounds) * 0.6f;
}

@end
