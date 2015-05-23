//
//  SelectedConceptCollectionViewCell.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AvailableClue;
@interface SelectedConceptCollectionViewCell : UICollectionViewCell {
    IBOutlet UITextView* names;
    IBOutlet UIImageView* image;
}

- (void)setPosition:(NSUInteger)position;
- (void)setClue:(AvailableClue*)concept;

@end