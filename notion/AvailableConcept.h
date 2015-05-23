//
//  AvailableConcept.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "OOCModel.h"

@interface AvailableConcept : OOCModel

+ (void) ensureCreated;

@property NSString* sp_names;
@property NSString* en_names;
@property NSString* imageName;
@property NSString* author;
@property NSString* authorUrl;

@end