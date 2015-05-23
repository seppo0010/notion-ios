//
//  AvailableConcept.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "AvailableClue.h"
#include <Ohmoc.h>
#import <UIKit/UIKit.h>

@implementation AvailableClue

static UIColor* color1;
static UIColor* color2;
static UIColor* color3;
static UIColor* color4;

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
            AvailableClue* item = [self create:@{@"id": [NSNumber numberWithUnsignedInteger:++pos]}];
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

+ (UIColor*)colorForPosition:(NSUInteger)position {
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
        case 0: return color1;
        case 1: return color2;
        case 2: return color3;
        case 3: return color4;
    }
    return nil;
}
@end