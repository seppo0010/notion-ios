//
//  ViewController.h
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSString* _clue;
}

- (void) viewModeAnimated:(BOOL)animated;
- (IBAction)viewMode;
- (IBAction)editMode;

@property NSString* clue;

@end