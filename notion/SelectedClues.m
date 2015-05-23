//
//  SelectedConcept.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "SelectedClues.h"
#import "AvailableClue.h"
#import "NSString+MD5.h"

@implementation SelectedClues

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

- (NSUInteger) numberOfCategories {
    NSUInteger numberOfCategories = 0;
    if (self.main1 || self.selected1.length > 0) numberOfCategories++;
    if (self.main2 || self.selected2.length > 0) numberOfCategories++;
    if (self.main3 || self.selected3.length > 0) numberOfCategories++;
    if (self.main4 || self.selected4.length > 0) numberOfCategories++;
    return numberOfCategories;
}

- (AvailableClue*)clueById:(int)conceptId {
    if (conceptId == 0) {
        return nil;
    }
    return [AvailableClue get:[NSString stringWithFormat:@"%d", conceptId]];
}

- (AvailableClue*)mainClue1 {
    return [self clueById:self.main1];
}

- (AvailableClue*)mainClue2 {
    return [self clueById:self.main2];
}

- (AvailableClue*)mainClue3 {
    return [self clueById:self.main3];
}

- (AvailableClue*)mainClue4 {
    return [self clueById:self.main4];
}

- (AvailableClue*)mainClue:(NSUInteger)position {
    if (position == 0) return [self mainClue1];
    if (position == 1) return [self mainClue2];
    if (position == 2) return [self mainClue3];
    if (position == 3) return [self mainClue4];
    return nil;
}

- (NSArray*)selectedClues:(NSUInteger)position includeMain:(BOOL)includeMain {
    NSString* selectedString;
    if (position == 0) selectedString = self.selected1;
    else if (position == 1) selectedString = self.selected2;
    else if (position == 2) selectedString = self.selected3;
    else if (position == 3) selectedString = self.selected4;
    else return nil;
    NSArray* selected = [selectedString componentsSeparatedByString:subSeparator];
    NSMutableArray* clues = [NSMutableArray arrayWithCapacity:selected.count + 1];
    if (includeMain) {
        AvailableClue* mainClue = [self mainClue:position];
        if (mainClue) {
            [clues addObject:mainClue];
        }
    }

    for (id selectedId in selected) {
        [clues addObject:[AvailableClue get:selectedId]];
    }
    return [clues copy];
}

- (BOOL)tryGuess:(NSString*)guess {
    return [[[[[guess lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""] MD5Digest] lowercaseString] isEqualToString:[self.answer lowercaseString]];
}

@end