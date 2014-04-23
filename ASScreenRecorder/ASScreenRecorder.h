//
//  ASScreenRecorder.h
//  ScreenRecorder
//
//  Created by Alan Skipp on 23/04/2014.
//  Copyright (c) 2014 Alan Skipp. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^VideoCompletionBlock)(void);
@protocol ASScreenRecorderDelegate;

@interface ASScreenRecorder : NSObject
@property (nonatomic, readonly) BOOL isRecording;

// delegate is only required when implementing ASScreenRecorderDelegate - see below
@property (nonatomic, weak) id <ASScreenRecorderDelegate> delegate;

// if saveURL is nil, video will be saved into camera roll
@property (strong, nonatomic) NSURL *videoURL;

+ (instancetype)sharedInstance;
- (BOOL)startRecording;
- (void)stopRecordingWithCompletion:(VideoCompletionBlock)completionBlock;
@end


// If your view contains an AVCaptureVideoPreviewLayer or an openGL view
// you'll need to write that data into the CGContextRef yourself.
// In the viewcontroller responsible for the AVCaptureVideoPreviewLayer / openGL view
// set yourself as the delegate for ASScreenRecorder.
// [ASScreenRecorder sharedInstance].delegate = self
// Then implement 'writeBackgroundFrameInContext:(CGContextRef*)contextRef'
// use 'CGContextDrawImage' to draw your view into the provided CGContextRef
@protocol ASScreenRecorderDelegate <NSObject>
- (void)writeBackgroundFrameInContext:(CGContextRef*)contextRef;
@end
