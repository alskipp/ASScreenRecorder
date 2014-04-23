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

- (void)setColor:(UIColor *)newColor
{
    if (_color != newColor) {
        _color = newColor;
        [self configureView];
    }
}

- (void)configureView
{
    self.view.backgroundColor = self.color;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareScreenRecorder];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
