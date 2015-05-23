//
//  SelectedConceptListViewController.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "SelectedConcepts.h"
#import "SelectedConceptListViewController.h"
#import "SelectedConceptsCollectionFlowLayout.h"
#import "SelectedConceptCollectionViewCell.h"

@interface SelectedConceptListViewController ()

@end

@implementation SelectedConceptListViewController

- (instancetype) init {
    if (self = [super init]) {
        layout = [[SelectedConceptsCollectionFlowLayout alloc] init];
        // TODO: replace with real data
        if (1) {
            selectedConcept = [[SelectedConcepts alloc] initWithBase64:@"Nzg3ZjQwYThlMzA5YjgwNGI0NTkzNmM4NjEwNWE4ZjAtNC0xNy0xMC0xMC0xMF8yOV8zOV8zOF8xMTVfMy0xMTVfMTA2XzExMF84MS0yXzM0XzU4XzEwNl8xMDgtODNfMTAwXzFfMzc="];
        }
    }
    return self;
}

- (void) viewDidLoad {
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SelectedConceptCollectionViewCell class]) bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:NSStringFromClass([SelectedConceptCollectionViewCell class])];
    collectionView.collectionViewLayout = layout;
    collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [selectedConcept numberOfConcepts];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)_collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectedConceptCollectionViewCell *cell = (SelectedConceptCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SelectedConceptCollectionViewCell class]) forIndexPath:indexPath];
    [cell setPosition:indexPath.row];
    [cell setConcept:[selectedConcept mainConcept:indexPath.row]];
    return cell;
}


@end