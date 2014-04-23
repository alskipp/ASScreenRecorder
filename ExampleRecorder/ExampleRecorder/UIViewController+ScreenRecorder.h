//
//  UIViewController+ScreenRecorder.h
//  ExampleRecorder
//
//  Created by Alan Skipp on 23/04/2014.
//  Copyright (c) 2014 Alan Skipp. All rights reserved.
//

#import <UIKit/UIKit.h>

// Include this UIViewController category into any viewController to support screen recording.
// Just call [self prepareScreenRecorder] in viewDidLoad
// It adds a UITapGestureRecognizer to the view
// Tap twice to start/stop screen recording
@interface UIViewController (ScreenRecorder)
- (void)prepareScreenRecorder;
@end
