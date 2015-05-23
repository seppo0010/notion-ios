//
//  SelectedConceptCollectionViewCell.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "SelectedConceptCollectionViewCell.h"
#import "AvailableConcept.h"

@implementation SelectedConceptCollectionViewCell

static UIColor* color1;
static UIColor* color2;
static UIColor* color3;
static UIColor* color4;

- (void)setConcept:(AvailableConcept*)concept {
    names.text = [[concept.en_names componentsSeparatedByString:@"/"] componentsJoinedByString:@"\n"];
    image.image = [UIImage imageNamed:concept.imageName];
}

- (void)setPosition:(NSUInteger)position {
    if (!color1) {
        color1 = [UIColor
                  colorWithRed:(float)0x48 / 0xff
                  green:(float)0x92 / 0xff
                  blue:(float)0x9b / 0xff
                  alpha:1.0f];
        color2 = [UIColor
                  colorWithRed:(float)0xE6 / 0xff
                  green:(float)0x83 / 0xff
                  blue:(float)0x64 / 0xff
                  alpha:1.0f];
        color3 = [UIColor
                  colorWithRed:(float)0x87 / 0xff
                  green:(float)0xD3 / 0xff
                  blue:(float)0x7C / 0xff
                  alpha:1.0f];
        color4 = [UIColor
                  colorWithRed:(float)0x8D / 0xff
                  green:(float)0x60 / 0xff
                  blue:(float)0x8C / 0xff
                  alpha:1.0f];
    }
    switch (position) {
        case 0: [self setBackgroundColor:color1]; break;
        case 1: [self setBackgroundColor:color2]; break;
        case 2: [self setBackgroundColor:color3]; break;
        case 3: [self setBackgroundColor:color4]; break;
    }
}
@end