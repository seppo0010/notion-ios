//
//  SelectedConcept.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "OOCModel.h"

@class AvailableConcept;
@interface SelectedConcepts : OOCModel

- (instancetype)initWithBase64:(NSString*)base64;
- (NSUInteger) numberOfConcepts;
- (AvailableConcept*)mainConcept1;
- (AvailableConcept*)mainConcept2;
- (AvailableConcept*)mainConcept3;
- (AvailableConcept*)mainConcept4;
- (AvailableConcept*)mainConcept:(NSUInteger)position;

@property NSString* answer;
@property int main1;
@property int main2;
@property int main3;
@property int main4;
@property NSArray* selected1;
@property NSArray* selected2;
@property NSArray* selected3;
@property NSArray* selected4;

@end