ASScreenRecorder
========

ASScreenRecorder is a screen recorder for iOS. It allows you to easily create demo videos of your iOS apps. It doesn't use any private APIs and is pretty easy to use. By default the video will be saved to the camera roll, though you can save to a specified file URL if you prefer.

Some sample videos can be found [here](https://vimeo.com/chromophore/videos). Make sure you select HD playback to see the full quality video.


Which files are needed?
---

* ASScreenRecorder.h
* ASScreenRecorder.m


How to use it
---

To instantiate the screen recorder, use `[ASScreenRecorder sharedInstance]`, a sharedInstance singleton is convenient because you can begin recording in one view controller, navigate through your app and stop recording in a different view controller without having to pass ASScreenRecorder instances from one controller to another.

If you want to record a demo video of your app, I'd recommend adding a UIGestureRecognizer to your view. You can then start and stop recording without needing to add extra buttons to your User Interface.

Add a UIGestureRecognizer (in viewDidLoad etc):
```objective-c
UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(recorderGesture:)];
tapGesture.numberOfTapsRequired = 2;
tapGesture.delaysTouchesBegan = YES;
[self.view addGestureRecognizer:tapGesture];
```

Respond to UIGestureRecognizer:
```objective-c
- (void)recorderGesture:(UIGestureRecognizer *)recognizer
{
    ASScreenRecorder *recorder = [ASScreenRecorder sharedInstance];
    
    if (recorder.isRecording) {
        [recorder stopRecordingWithCompletion:^{
            NSLog(@"Finished recording");
        }];
    } else {
        [recorder startRecording];
        NSLog(@"Start recording");
    }
}
```

The included example project demonstrates the use of a UIViewController category to simplify adding ASScreenRecorder to your view controllers.

* * *

If you need the ability to pause and resume recording, this feature has been added by [arturdev](https://github.com/arturdev), please checkout the [development branch](https://github.com/alskipp/ASScreenRecorder/tree/development).
