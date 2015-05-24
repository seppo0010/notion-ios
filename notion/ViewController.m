//
//  ViewController.m
//  notion
//
//  Created by Seppo on 5/22/15.
//  Copyright (c) 2015 seppo0010. All rights reserved.
//

#import "ViewController.h"
#import "SelectedConceptListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize clue = _clue;

- (void) awakeFromNib {
    [super awakeFromNib];
    self.clue = @"Nzg3ZjQwYThlMzA5YjgwNGI0NTkzNmM4NjEwNWE4ZjAtNC0xNy0xMC0xMC0xMF8yOV8zOV8zOF8xMTVfMy0xMTVfMTA2XzExMF84MS0yXzM0XzU4XzEwNl8xMDgtODNfMTAwXzFfMzc=";
}

- (void) viewModeAnimated:(BOOL)animated {
    if (!controller) {
        controller = [[SelectedConceptListViewController alloc] initWithBase64Clue:self.clue];
    }
    [self.navigationController pushViewController:controller animated:animated];
}

- (IBAction)viewMode {
    [self viewModeAnimated:TRUE];
}

- (IBAction)editMode {
    
}


- (void)setClue:(NSString *)clue {
    _clue = clue;
    controller = nil;
}

- (NSString*)clue {
    return _clue;
}

@end