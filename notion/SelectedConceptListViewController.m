//
//  SelectedConceptListViewController.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "SelectedClues.h"
#import "SelectedConceptListViewController.h"
#import "SelectedConceptsCollectionFlowLayout.h"
#import "SelectedConceptCollectionViewCell.h"
#import "SelectedConceptCluesViewController.h"

@interface SelectedConceptListViewController ()

@end

@implementation SelectedConceptListViewController

- (instancetype) init {
    if (self = [super init]) {
        layout = [[SelectedConceptsCollectionFlowLayout alloc] init];
        // TODO: replace with real data
        if (1) {
            selectedClues = [[SelectedClues alloc] initWithBase64:@"Nzg3ZjQwYThlMzA5YjgwNGI0NTkzNmM4NjEwNWE4ZjAtNC0xNy0xMC0xMC0xMF8yOV8zOV8zOF8xMTVfMy0xMTVfMTA2XzExMF84MS0yXzM0XzU4XzEwNl8xMDgtODNfMTAwXzFfMzc="];
        }
    }
    return self;
}

- (void) viewDidLoad {
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SelectedConceptCollectionViewCell class]) bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:NSStringFromClass([SelectedConceptCollectionViewCell class])];
    collectionView.collectionViewLayout = layout;
    collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    guess.hidden = selectedClues.answer.length == 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [selectedClues numberOfCategories];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)_collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectedConceptCollectionViewCell *cell = (SelectedConceptCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SelectedConceptCollectionViewCell class]) forIndexPath:indexPath];
    [cell setPosition:indexPath.row];
    [cell setMainClue:[selectedClues mainClue:indexPath.row]];
    [cell setClues:[selectedClues selectedClues:indexPath.row includeMain:FALSE]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectedConceptCluesViewController* controller = [[SelectedConceptCluesViewController alloc] init];
    [controller setSelectedClues:selectedClues position:indexPath.row];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)tryGuess {
    BOOL correct = [selectedClues tryGuess:guess.text];
    [[[UIAlertView alloc] initWithTitle:correct ? @"Correct" : @"Incorrect :(" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

@end