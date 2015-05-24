//
//  SelectedConceptCollectionViewCell.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "SelectClueCollectionViewCell.h"
#import "AvailableClue.h"
#import "UIView+makeCircle.h"

@implementation SelectClueCollectionViewCell

- (void) awakeFromNib {
    [super awakeFromNib];

    [color1 makeCircle];
    color1.backgroundColor = [AvailableClue colorForPosition:0];
    color1.layer.borderWidth = 4;

    [color2 makeCircle];
    color2.backgroundColor = [AvailableClue colorForPosition:1];
    color2.layer.borderWidth = 4;

    [color3 makeCircle];
    color3.backgroundColor = [AvailableClue colorForPosition:2];
    color3.layer.borderWidth = 4;

    [color4 makeCircle];
    color4.backgroundColor = [AvailableClue colorForPosition:3];
    color4.layer.borderWidth = 4;
}

- (void)setClue:(AvailableClue*)_clue {
    clue = _clue;
    names.text = [[clue.en_names componentsSeparatedByString:@"/"] componentsJoinedByString:@"\n"];
    names.textColor = [UIColor colorWithWhite:0.47f alpha:1.0f]; // no idea why the xib color is ignored
    image.image = [UIImage imageNamed:clue.imageName];
    [self setColor1Status:[selectedClues statusForClue:clue position:0]];
    [self setColor2Status:[selectedClues statusForClue:clue position:1]];
    [self setColor3Status:[selectedClues statusForClue:clue position:2]];
    [self setColor4Status:[selectedClues statusForClue:clue position:3]];
}

- (void)setStatus:(ClueStatus)status forButton:(UIButton*)button color:(UIColor*)color {
    button.transform = CGAffineTransformIdentity;
    if (status == ClueStatusUnselected) {
        button.layer.borderColor = [color CGColor];
        button.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.0f];
    } else if (status == ClueStatusSelected) {
        button.backgroundColor = color;
        button.transform = CGAffineTransformMakeScale(0.7f, 0.7f);
        button.layer.borderColor = [[UIColor colorWithWhite:0.0f alpha:0.0f] CGColor];
        button.backgroundColor = color;
    } else {
        button.layer.borderColor = [color CGColor];
        button.backgroundColor = color;
    }
}

- (void) setColor1Status:(ClueStatus)status {
    [self setStatus:status forButton:color1 color:[AvailableClue colorForPosition:0]];
}

- (void) setColor2Status:(ClueStatus)status {
    [self setStatus:status forButton:color2 color:[AvailableClue colorForPosition:1]];
}

- (void) setColor3Status:(ClueStatus)status {
    [self setStatus:status forButton:color3 color:[AvailableClue colorForPosition:2]];
}

- (void) setColor4Status:(ClueStatus)status {
    [self setStatus:status forButton:color4 color:[AvailableClue colorForPosition:3]];
}

- (void)setSelectedClues:(SelectedClues*)_selectedClues {
    selectedClues = _selectedClues;
}

- (NSUInteger)positionForButton:(UIButton*)button {
    if (button == color1) return 0;
    if (button == color2) return 1;
    if (button == color3) return 2;
    if (button == color4) return 3;
    return 0;
}

- (IBAction)toggleColor:(UIButton*)sender {
    NSUInteger position = [self positionForButton:sender];
    ClueStatus status = [selectedClues toggleClue:clue position:position];
    [self setStatus:status forButton:sender color:[AvailableClue colorForPosition:position]];
}

@end