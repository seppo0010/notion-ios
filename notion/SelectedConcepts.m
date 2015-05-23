//
//  SelectedConcept.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "SelectedConcepts.h"
#import "AvailableConcept.h"

@implementation SelectedConcepts

NSString* mainSeparator = @"-";
NSString* subSeparator = @"_";

- (instancetype)initWithBase64:(NSString*)base64 {
    if (self = [super init]) {
        NSData* decodedData = [[NSData alloc] initWithBase64EncodedString:base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        NSArray* initial = [[[NSString alloc] initWithData:decodedData encoding:NSASCIIStringEncoding] componentsSeparatedByString:mainSeparator];
        NSUInteger pos = 0;
        self.answer = [initial objectAtIndex:pos++];
        self.main1 = [[initial objectAtIndex:pos++] intValue];
        self.main2 = [[initial objectAtIndex:pos++] intValue];
        self.main3 = [[initial objectAtIndex:pos++] intValue];
        self.main4 = [[initial objectAtIndex:pos++] intValue];
        self.selected1 = [initial objectAtIndex:pos++];
        self.selected2 = [initial objectAtIndex:pos++];
        self.selected3 = [initial objectAtIndex:pos++];
        self.selected4 = [initial objectAtIndex:pos++];
    }
    return self;
}

- (NSUInteger) numberOfConcepts {
    NSUInteger numberOfCategories = 0;
    if (self.main1 || self.selected1.count > 0) numberOfCategories++;
    if (self.main2 || self.selected2.count > 0) numberOfCategories++;
    if (self.main3 || self.selected3.count > 0) numberOfCategories++;
    if (self.main4 || self.selected4.count > 0) numberOfCategories++;
    return numberOfCategories;
}

- (AvailableConcept*)conceptById:(int)conceptId {
    if (conceptId == 0) {
        return nil;
    }
    return [AvailableConcept get:[NSString stringWithFormat:@"%d", conceptId]];
}

- (AvailableConcept*)mainConcept1 {
    return [self conceptById:self.main1];
}

- (AvailableConcept*)mainConcept2 {
    return [self conceptById:self.main2];
}

- (AvailableConcept*)mainConcept3 {
    return [self conceptById:self.main3];
}

- (AvailableConcept*)mainConcept4 {
    return [self conceptById:self.main4];
}

- (AvailableConcept*)mainConcept:(NSUInteger)position {
    if (position == 0) return [self mainConcept1];
    if (position == 1) return [self mainConcept2];
    if (position == 2) return [self mainConcept3];
    if (position == 3) return [self mainConcept4];
    return nil;
}

@end