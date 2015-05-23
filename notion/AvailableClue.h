//
//  AvailableConcept.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "OOCModel.h"

@class UIColor;
@interface AvailableClue : OOCModel

+ (void) ensureCreated;
+ (UIColor*)colorForPosition:(NSUInteger)position;

@property NSString* sp_names;
@property NSString* en_names;
@property NSString* imageName;
@property NSString* author;
@property NSString* authorUrl;

@end