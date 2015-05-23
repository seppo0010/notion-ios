//
//  SelectedConcept.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "OOCModel.h"

@class AvailableClue;
@interface SelectedClues : OOCModel

- (instancetype)initWithBase64:(NSString*)base64;
- (NSUInteger) numberOfCategories;
- (AvailableClue*)mainClue1;
- (AvailableClue*)mainClue2;
- (AvailableClue*)mainClue3;
- (AvailableClue*)mainClue4;
- (AvailableClue*)mainClue:(NSUInteger)position;

- (NSArray*)selectedClues:(NSUInteger)position includeMain:(BOOL)includeMain;
- (BOOL)tryGuess:(NSString*)guess;

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