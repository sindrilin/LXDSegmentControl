//
//  LXDSegmentControlDefine.h
//  LXDTwoDimensionalBarcode
//
//  Created by linxinda on 15/10/26.
//  Copyright © 2015年 cnpayany. All rights reserved.
//

#ifndef LXDSegmentControlDefine_h
#define LXDSegmentControlDefine_h

/// 屏幕上同时显示的最大个数的分栏。只有默认分栏类型和点击放大类型支持超出最大个数的分栏控制器
#define MAXITEMCOUNT 6
/// 形变的最小值
#define SMALLSCALE 0.75f
/// 形变的初始值
#define INITSCALE 1.f
/// 形变的最大值
#define BIGSCALE 1.25f
/// 动画时长
#define ANIMATION_DURATION 0.15f
/// 透明色
#define CLEAR_COLOR [UIColor clearColor]


/*! 分栏控制器类型。不同类型有不同默认属性*/
typedef enum
{
    /*! 滑块移动(默认)。支持横向滚动*/
    LXDSegmentControlTypeSlideBlock = 0,
    /*! 分隔按钮*/
    LXDSegmentControlTypeSeparate,
    /*! 选中类型*/
    LXDSegmentControlTypeSelectBlock,
    /*! 选中放大。支持横向滚动*/
    LXDSegmentControlTypeScaleTitle,
} LXDSegmentControlType;


static inline UIColor * kRGB(CGFloat red, CGFloat green, CGFloat blue)
{
    return [UIColor colorWithRed: red/255.f green: green/255.f blue: blue/255.f alpha: 1.f];
}

static inline UIColor * kNumberColor(NSUInteger rgb)
{
    NSUInteger red = (rgb >> 16) & 0xff;
    NSUInteger green = (rgb >> 8) & 0xff;
    NSUInteger blue = rgb & 0xff;
    return kRGB(red, green, blue);
}

#endif /* LXDSegmentControlDefine_h */
