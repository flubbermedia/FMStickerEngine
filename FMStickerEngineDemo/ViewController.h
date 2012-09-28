//
//  ViewController.h
//  StickersEngine
//
//  Created by Maurizio Cremaschi on 9/8/12.
//  Copyright (c) 2012 Flubber Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FMStickerCaptureView;

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) IBOutlet FMStickerCaptureView *captureView;
@property (strong, nonatomic) IBOutlet UIButton *photoLibraryButton;

@end
