//
//  ViewController.m
//  StickersEngine
//
//  Created by Maurizio Cremaschi on 9/8/12.
//  Copyright (c) 2012 Flubber Media Ltd. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <FMStickerEngine/FMStickerEngine.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //create the sticker
    FMSticker *sticker = [FMSticker new];
    [sticker setEyesFeatureWithImage:[UIImage imageNamed:@"sticker-eyes.png"] leftEyePosition:CGPointMake(434., 920.) rightEyePosition:CGPointMake(859., 920.)];
    [sticker setMouthFeatureWithImage:[UIImage imageNamed:@"sticker-mouth.png"] mouthPosition:CGPointMake(376., 173.)];
    
    //let's start
    [_captureView setSticker:sticker];
    [_captureView startCapture];
}

#pragma mark - Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)takePicture:(id)sender
{
    //show that something is working and pause the detection
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    [_captureView pauseFaceDetection];
    
    //take the picture
    [_captureView takePicture:^(UIImage *picture, NSError *error) {
        
        if (error == nil)
        {
            //no errors, save the picture
            ALAssetsLibrary *assetsLibrary = [ALAssetsLibrary new];
            [assetsLibrary writeImageToSavedPhotosAlbum:picture.CGImage orientation:(ALAssetOrientation)picture.imageOrientation completionBlock:
             ^(NSURL *assetURL, NSError *error){
                if (error == nil) {
                    [SVProgressHUD showSuccessWithStatus:@""];
                } else {
                    [SVProgressHUD showErrorWithStatus:@""];
                }
            }];
        }
        
        //in any case resume the detection and hide the activity view, we finished to work
        [_captureView resumeFaceDetection];
        [SVProgressHUD dismiss];
    }];
}

- (IBAction)switchCamera:(id)sender
{
    [_captureView switchCamera:^{
        
    }];
}

@end
