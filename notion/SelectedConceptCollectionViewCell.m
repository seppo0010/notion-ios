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

- (void)setMainClue:(AvailableClue*)concept {
    names.text = [[concept.en_names componentsSeparatedByString:@"/"] componentsJoinedByString:@"\n"];
    image.image = [UIImage imageNamed:concept.imageName];
}

- (void)setClues:(NSArray*)clues {
    UIView* v;
    while ((v = [self viewWithTag:1])) {
        [v removeFromSuperview];
    }

    float position = - M_PI_2;
    float x_proximity = 0.69f;
    float y_proximity = 0.72f;
    float w = image.frame.size.width * x_proximity;
    float x = (image.frame.size.width / 2 + image.frame.origin.x);
    float h = image.frame.size.height * y_proximity;
    float y = (image.frame.size.height / 2 + image.frame.origin.y);
    float side = 30.0f;
    for (AvailableClue* clue in clues) {
        UIImageView* imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake((cosf(position) * w) + x - side / 2,
                                     (sinf(position) * h) + y - side / 2,
                                     side,
                                     side);
        imageView.image = [UIImage imageNamed:clue.imageName];
        imageView.tag = 1;
        [self addSubview:imageView];
        position += M_PI * 2 / clues.count;
    }
}

- (void)setPosition:(NSUInteger)position {
    [self setBackgroundColor:[AvailableClue colorForPosition:position]];
}

@end