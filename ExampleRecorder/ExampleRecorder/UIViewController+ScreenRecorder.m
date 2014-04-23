//
//  UIViewController+ScreenRecorder.m
//  ExampleRecorder
//
//  Created by Alan Skipp on 23/04/2014.
//  Copyright (c) 2014 Alan Skipp. All rights reserved.
//

#import "UIViewController+ScreenRecorder.h"
#import "ASScreenRecorder.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation UIViewController (ScreenRecorder)

- (void)prepareScreenRecorder;
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(recorderGesture:)];
    tapGesture.numberOfTapsRequired = 2;
    tapGesture.delaysTouchesBegan = YES;
    [self.view addGestureRecognizer:tapGesture];
}

- (void)recorderGesture:(UIGestureRecognizer *)recognizer
{
    ASScreenRecorder *recorder = [ASScreenRecorder sharedInstance];
    
    if (recorder.isRecording) {
        [recorder stopRecordingWithCompletion:^{
            NSLog(@"Finished recording");
            [self playEndSound];
        }];
    } else {
        [recorder startRecording];
        NSLog(@"Start recording");
        [self playStartSound];
    }
}

- (void)playStartSound
{
    NSURL *url = [NSURL URLWithString:@"/System/Library/Audio/UISounds/begin_record.caf"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

- (void)playEndSound
{
    NSURL *url = [NSURL URLWithString:@"/System/Library/Audio/UISounds/end_record.caf"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

@end
