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

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!controller) {
        NSString* clue = @"Nzg3ZjQwYThlMzA5YjgwNGI0NTkzNmM4NjEwNWE4ZjAtNC0xNy0xMC0xMC0xMF8yOV8zOV8zOF8xMTVfMy0xMTVfMTA2XzExMF84MS0yXzM0XzU4XzEwNl8xMDgtODNfMTAwXzFfMzc=";
        controller = [[SelectedConceptListViewController alloc] initWithBase64Clue:clue];
    }
    [self.navigationController pushViewController:controller animated:NO];
}

@end