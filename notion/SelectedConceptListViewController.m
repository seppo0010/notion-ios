//
//  SelectedConceptListViewController.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "SelectedConceptListViewController.h"
#import "SelectedConceptsCollectionFlowLayout.h"
#import "SelectedConceptCollectionViewCell.h"

@interface SelectedConceptListViewController ()

@end

@implementation SelectedConceptListViewController

- (instancetype) init {
    if (self = [super init]) {
        layout = [[SelectedConceptsCollectionFlowLayout alloc] init];
    }
    return self;
}

- (void) viewDidLoad {
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SelectedConceptCollectionViewCell class]) bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:NSStringFromClass([SelectedConceptCollectionViewCell class])];
    collectionView.collectionViewLayout = layout;
    collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)_collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectedConceptCollectionViewCell *cell = (SelectedConceptCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SelectedConceptCollectionViewCell class]) forIndexPath:indexPath];
    return cell;
}


@end