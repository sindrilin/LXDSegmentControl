//
//  LXDImageBrowser.m
//  LXDSegmentControl
//
//  Created by 林欣达 on 15/11/18.
//  Copyright © 2015年 LXD. All rights reserved.
//

#import "LXDSegmentControl.h"

@interface LXDImageBrowser ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, LXDSegmentControlDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;

@end

@implementation LXDImageBrowser
@synthesize dataSource = _dataSource;

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource
{
    if (self = [super initWithFrame: frame]) {
        _dataSource = dataSource;
        LXDSegmentControlConfiguration * configuration = [[LXDSegmentControlConfiguration alloc] initWithItems: @[@"最新", @"最热"]];
        LXDSegmentControl * control = [[LXDSegmentControl alloc] initWithFrame: CGRectMake(0, 0, CGRectGetWidth(frame) - 100, 30) configuration: configuration delegate: self];
        [self addSubview: control];
        [self addSubview: self.collectionView];
    }
    return self;
}

- (void)setDataSource: (NSArray *)dataSource
{
    _dataSource = dataSource;
    [_collectionView reloadData];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        LXDLayout * layout = [[LXDLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //水平滚动
        layout.minimumInteritemSpacing = 0.f;
        layout.minimumLineSpacing = 0.f;
        _collectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0, 30, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 30) collectionViewLayout: layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass: [LXDImageCell class] forCellWithReuseIdentifier: @"cell"];
    }
    return _collectionView;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LXDImageCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"cell" forIndexPath: indexPath];
    cell.image = _dataSource[indexPath.item];
    
    return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.frame), [LXDImage height]);
}


#pragma mark - LXDSegmentControlDelegate
- (void)segmentControl:(LXDSegmentControl *)segmentControl didSelectAtIndex:(NSUInteger)index
{
    
}


@end
