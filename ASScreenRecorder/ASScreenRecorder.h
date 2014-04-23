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
@property (nonatomic, weak) id <ASScreenRecorderDelegate> delegate;

// if saveURL is nil, video will be saved into camera roll
@property (strong, nonatomic) NSURL *videoURL;

+ (instancetype)sharedInstance;
- (BOOL)startRecording;
- (void)stopRecordingWithCompletion:(VideoCompletionBlock)completionBlock;
@end


@protocol ASScreenRecorderDelegate <NSObject>
- (void)writeBackgroundFrameInContext:(CGContextRef*)contextRef;
@end
