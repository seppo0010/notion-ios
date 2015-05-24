//
//  SelectClueCollectionViewCell.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "SelectedClues.h"

@class AvailableClue, SelectedClues;
@interface SelectClueCollectionViewCell : UICollectionViewCell {
    IBOutlet UITextView* names;
    IBOutlet UIImageView* image;

    IBOutlet UIButton* color1;
    IBOutlet UIButton* color2;
    IBOutlet UIButton* color3;
    IBOutlet UIButton* color4;

    SelectedClues* selectedClues;
    AvailableClue* clue;
}

- (void)setClue:(AvailableClue*)clue;
- (void)setColor1Status:(ClueStatus)selected;
- (void)setColor2Status:(ClueStatus)selected;
- (void)setColor3Status:(ClueStatus)selected;
- (void)setColor4Status:(ClueStatus)selected;
- (void)setSelectedClues:(SelectedClues*)selectedClues;
- (IBAction)toggleColor:(UIButton*)sender;

@end