//
//  LXDImageCell.m
//  LXDSegmentControl
//
//  Created by 林欣达 on 15/11/18.
//  Copyright © 2015年 LXD. All rights reserved.
//

#import "LXDImageCell.h"
#import "LXDImage.h"
#import "UIImageView+WebCache.h"

@interface LXDImageCell ()

@property (nonatomic, strong) UIImageView * image1;
@property (nonatomic, strong) UIImageView * image2;

@end

@implementation LXDImageCell

- (UIImageView *)image1
{
    if (!_image1) {
        _image1 = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, CGRectGetWidth(self.frame) / 2, [LXDImage height])];
        _image1.backgroundColor = [UIColor colorWithRed: arc4random() % 256 / 255.f green: arc4random() % 256 / 255.f blue: arc4random() % 256 / 255.f alpha: 1.f];
        [self addSubview: _image1];
    }
    return _image1;
}

- (UIImageView *)image2
{
    if (!_image2) {
        _image2 = [[UIImageView alloc] initWithFrame: CGRectMake(CGRectGetWidth(self.frame) / 2, 0, CGRectGetWidth(self.frame) / 2, [LXDImage height])];
        _image2.backgroundColor = [UIColor colorWithRed: arc4random() % 256 / 255.f green: arc4random() % 256 / 255.f blue: arc4random() % 256 / 255.f alpha: 1.f];
        [self addSubview: _image2];
    }
    return _image2;
}

- (void)setImage: (LXDImage *)image
{
    _image = image;
    [self.image1 sd_setImageWithURL: [NSURL URLWithString: image.image1_url]];
    [self.image2 sd_setImageWithURL: [NSURL URLWithString: image.image2_url]];
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes: layoutAttributes];
}


@end
