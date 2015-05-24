//
//  SelectedConcept.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "OOCModel.h"

typedef enum ClueStatus {
    ClueStatusUnselected,
    ClueStatusSelected,
    ClueStatusMain
} ClueStatus;

@class AvailableClue;
@interface SelectedClues : OOCModel

- (instancetype)initWithBase64:(NSString*)base64;
- (NSUInteger) numberOfCategories;
- (NSUInteger)positionForIndexPathRow:(NSUInteger)indexPathRow;

- (AvailableClue*)mainClue1;
- (AvailableClue*)mainClue2;
- (AvailableClue*)mainClue3;
- (AvailableClue*)mainClue4;
- (AvailableClue*)mainClue:(NSUInteger)position;
- (void)setMainClue:(AvailableClue*)clue position:(NSUInteger)position;

- (ClueStatus)statusForClue:(AvailableClue*)clue position:(NSUInteger)position;

- (NSArray*)selectedClues:(NSUInteger)position includeMain:(BOOL)includeMain;
- (BOOL)tryGuess:(NSString*)guess;
- (ClueStatus)toggleClue:(AvailableClue*)clue position:(NSUInteger)position;

@property NSString* answer;
@property int main1;
@property int main2;
@property int main3;
@property int main4;
@property NSString* selected1;
@property NSString* selected2;
@property NSString* selected3;
@property NSString* selected4;

@end