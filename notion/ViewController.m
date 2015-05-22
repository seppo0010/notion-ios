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

- (void) awakeFromNib {
    [super awakeFromNib];
    controller = [[SelectedConceptListViewController alloc] init];
}

- (void) viewDidLoad {
    [controller.view setFrame:self.view.frame];
    [self.view addSubview:controller.view];
}

@end