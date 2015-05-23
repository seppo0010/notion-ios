//
//  SelectedConceptClue.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "SelectedConceptClueView.h"
#import "AvailableClue.h"

@implementation SelectedConceptClueView

- (void)setClue:(AvailableClue*)clue {
    names.text = [[clue.en_names componentsSeparatedByString:@"/"] componentsJoinedByString:@"\n"];
    image.image = [UIImage imageNamed:clue.imageName];
}

@end