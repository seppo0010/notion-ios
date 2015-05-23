//
//  SelectedConceptCluesViewController.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "SelectedConceptCluesViewController.h"
#import "SelectedClues.h"
#import "SelectedConceptClueView.h"
#import "AvailableClue.h"

@interface SelectedConceptCluesViewController ()

@end

@implementation SelectedConceptCluesViewController

- (void)viewDidLoad {
    carousel.type = iCarouselTypeCoverFlow2;
    [carousel scrollToItemAtIndex:selectedClues.count / 2 animated:NO];
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return selectedClues.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (view == nil) {
        view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SelectedConceptClueView class]) owner:nil options:nil] objectAtIndex:0];
    }
    SelectedConceptClueView* clueView = (SelectedConceptClueView*)view;
    clueView.backgroundColor = [AvailableClue colorForPosition:position];
    [clueView setClue:[selectedClues objectAtIndex:index]];
    return view;
}

- (void) setSelectedClues:(SelectedClues*)_selectedClues position:(NSUInteger)_position {
    selectedClues = [_selectedClues selectedClues:_position];
    position = _position;
}

- (IBAction)back {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end