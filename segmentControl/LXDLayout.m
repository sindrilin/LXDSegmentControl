//
//  LXDLayout.m
//  LXDSegmentControl
//
//  Created by 林欣达 on 15/11/18.
//  Copyright © 2015年 LXD. All rights reserved.
//

#import "LXDLayout.h"

@interface LXDLayout ()

@property (nonatomic, strong) NSArray * attributes;
@property (nonatomic, weak) id<UICollectionViewDelegateFlowLayout> delegate;

@end

@implementation LXDLayout

- (void)prepareLayout
{
    _delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    CGFloat maxWidth = 0.f;
    NSUInteger rows = [self.collectionView numberOfItemsInSection: 0];
    NSMutableArray * array = [NSMutableArray arrayWithCapacity: rows];
    for (int i = 0; i < rows; i++) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem: i inSection: 0];
        CGSize size = [_delegate collectionView: self.collectionView layout: self sizeForItemAtIndexPath: indexPath];
        UICollectionViewLayoutAttributes * attribute = [self attributesForIndexPath: indexPath];
        attribute.frame = CGRectMake(maxWidth, 0, size.width, size.height);
        [array addObject: attribute];
        maxWidth += size.width;
    }
    _attributes = [array copy];
}

- (UICollectionViewLayoutAttributes *)attributesForIndexPath: (NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes * attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath: indexPath];
    return attribute;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray * attributes = [NSMutableArray new];
    for (UICollectionViewLayoutAttributes * attribute in _attributes) {
        if (CGRectIntersectsRect(rect, attribute.frame)) {
            [attributes addObject: attribute];
        }
    }
    return attributes;
}


@end
