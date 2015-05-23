//
//  SelectedConceptCollectionViewCell.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "SelectedConceptCollectionViewCell.h"
#import "AvailableClue.h"

@implementation SelectedConceptCollectionViewCell

- (void)setClue:(AvailableClue*)concept {
    names.text = [[concept.en_names componentsSeparatedByString:@"/"] componentsJoinedByString:@"\n"];
    image.image = [UIImage imageNamed:concept.imageName];
}

- (void)setPosition:(NSUInteger)position {
    [self setBackgroundColor:[AvailableClue colorForPosition:position]];
}

@end