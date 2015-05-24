//
//  EditConceptViewController.h
//  notion
//
//  Created by Seppo on 5/23/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectedClues;
@interface EditConceptViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate> {
    SelectedClues* selectedClues;
    NSArray* availableClues;

    IBOutlet UICollectionView* collectionView;
    IBOutlet UITextField* answer;
    UICollectionViewFlowLayout* layout;
}

@end