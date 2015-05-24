//
//  EditConceptViewController.m
//  notion
//
//  Created by Seppo on 5/23/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "EditConceptViewController.h"
#import "AvailableClue.h"
#import "SelectClueCollectionViewCell.h"
#import <Ohmoc.h>

@interface EditConceptViewController ()

@end

@implementation EditConceptViewController

- (instancetype)init {
    if (self = [super init]) {
        availableClues = [[[AvailableClue all] sortBy:@"id"] arrayValue];
        layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(172.0f, 223.0f);
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumInteritemSpacing = 10.0f;
        layout.minimumLineSpacing = 10.0f;
        selectedClues = [[SelectedClues alloc] initWithBase64:@"Nzg3ZjQwYThlMzA5YjgwNGI0NTkzNmM4NjEwNWE4ZjAtNC0xNy0xMC0xMC0xMF8yOV8zOV8zOF8xMTVfMy0xMTVfMTA2XzExMF84MS0yXzM0XzU4XzEwNl8xMDgtODNfMTAwXzFfMzc="];
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SelectClueCollectionViewCell class]) bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:NSStringFromClass([SelectClueCollectionViewCell class])];
    collectionView.collectionViewLayout = layout;
    collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return availableClues.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)_collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectClueCollectionViewCell *cell = (SelectClueCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SelectClueCollectionViewCell class]) forIndexPath:indexPath];
    AvailableClue* clue = [availableClues objectAtIndex:indexPath.row];
    [cell setSelectedClues:selectedClues];
    [cell setClue:clue];
    return cell;
}


@end