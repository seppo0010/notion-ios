//
//  SelectedConceptCluesViewController.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@class SelectedClues;
@interface SelectedConceptCluesViewController : UIViewController <iCarouselDataSource, iCarouselDelegate> {
    NSArray* selectedClues;
    IBOutlet iCarousel* carousel;
    NSUInteger position;
}

- (void) setSelectedClues:(SelectedClues*)selectedClues position:(NSUInteger)position;
- (IBAction)back;

@end
