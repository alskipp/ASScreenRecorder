//
//  DetailViewController.m
//  ExampleRecorder
//
//  Created by Alan Skipp on 23/04/2014.
//  Copyright (c) 2014 Alan Skipp. All rights reserved.
//

#import "DetailViewController.h"
#import "UIViewController+ScreenRecorder.h"

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareScreenRecorder];
}

- (void)setColor:(UIColor *)newColor
{
    if (_color != newColor) {
        _color = newColor;
        self.view.backgroundColor = self.color;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
