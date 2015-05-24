//
//  UIView+makeCircle.m
//  ios
//
//  Created by Seppo on 2/13/15.
//  Copyright (c) 2015 Demeterr. All rights reserved.
//

#import "UIView+makeCircle.h"

@implementation UIView (makeCircle)

- (void)makeCircle {
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.clipsToBounds = YES;
}

@end
