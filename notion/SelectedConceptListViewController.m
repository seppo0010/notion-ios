//
//  SelectedConceptListViewController.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "SelectedClues.h"
#import "SelectedConceptListViewController.h"
#import "SelectedConceptCollectionViewCell.h"
#import "SelectedConceptCluesViewController.h"

@interface SelectedConceptListViewController ()

@end

@implementation SelectedConceptListViewController

- (instancetype) initWithBase64Clue:(NSString*)clue {
    if (self = [super init]) {
        layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(172.0f, 180.0f);
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumInteritemSpacing = 10.0f;
        layout.minimumLineSpacing = 10.0f;

        selectedClues = [[SelectedClues alloc] initWithBase64:clue];
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
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
    NSUInteger position = [selectedClues positionForIndexPathRow:indexPath.row];
    [cell setPosition:position];
    [cell setMainClue:[selectedClues mainClue:position]];
    [cell setClues:[selectedClues selectedClues:position includeMain:FALSE]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectedConceptCluesViewController* controller = [[SelectedConceptCluesViewController alloc] init];
    NSUInteger position = [selectedClues positionForIndexPathRow:indexPath.row];
    [controller setSelectedClues:selectedClues position:position];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)tryGuess {
    BOOL correct = [selectedClues tryGuess:guess.text];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:correct ? @"Correct" : @"Incorrect :(" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];

    int64_t delayInSeconds = 0.9;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    });
}

@end