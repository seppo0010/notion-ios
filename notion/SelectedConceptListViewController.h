//
//  SelectedConceptListViewController.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectedClues;
@interface SelectedConceptListViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate> {
    SelectedClues* selectedClues;

    UICollectionViewFlowLayout* layout;
    IBOutlet UICollectionView* collectionView;

    IBOutlet UITextField* guess;
}

- (instancetype) initWithBase64Clue:(NSString*)clue;
- (IBAction)tryGuess;

@end
