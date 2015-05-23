//
//  SelectedConceptListViewController.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectedConcepts;
@interface SelectedConceptListViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate> {
    SelectedConcepts* selectedConcept;

    UICollectionViewFlowLayout* layout;
    IBOutlet UICollectionView* collectionView;
}

@end
