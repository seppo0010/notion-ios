//
//  AvailableConcept.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "AvailableConcept.h"
#include <Ohmoc.h>

@implementation AvailableConcept

+ (void) ensureCreated {
    if ([[self all] size] == 0) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"db" ofType:@"csv"];
        NSString* csv = [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:path] encoding:NSUTF8StringEncoding];
        NSUInteger pos = 0;
        for (NSString* _row in [csv componentsSeparatedByString:@"\n"]) {
            NSArray* row = [_row componentsSeparatedByString:@","];
            if (row.count < 2) {
                continue;
            }
            AvailableConcept* item = [self create:@{@"id": [NSNumber numberWithUnsignedInteger:++pos]}];
            item.sp_names = [row objectAtIndex:0];
            [item.sp_names stringByReplacingOccurrencesOfString:@"á" withString:@"a"];
            [item.sp_names stringByReplacingOccurrencesOfString:@"é" withString:@"e"];
            [item.sp_names stringByReplacingOccurrencesOfString:@"í" withString:@"i"];
            [item.sp_names stringByReplacingOccurrencesOfString:@"ó" withString:@"o"];
            [item.sp_names stringByReplacingOccurrencesOfString:@"ú" withString:@"u"];
            [item.sp_names stringByReplacingOccurrencesOfString:@"ñ" withString:@"ny"];
            item.en_names = [row objectAtIndex:1];
            if ([row count] > 2) { // missing some images
                item.imageName = [row objectAtIndex:2];
                item.author = [row objectAtIndex:3];
                item.authorUrl = [row objectAtIndex:4];
                if ([[row objectAtIndex:2] isEqualToString:@"15864.png"]) {
                    NSLog(@"asd");
                }
            }
            [item save];
        }
    }
}

@end