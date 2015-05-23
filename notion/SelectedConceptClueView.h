//
//  SelectedConceptClue.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AvailableClue;
@interface SelectedConceptClueView : UIView {
    IBOutlet UITextView* names;
    IBOutlet UIImageView* image;
}

- (void)setClue:(AvailableClue*)clue;

@end