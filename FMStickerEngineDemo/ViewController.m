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

@property (nonatomic, strong) UIPopoverController *photoLibraryPopover;

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
			[self saveImageToPhotoLibrary:picture completion:^(NSError *error) {
				if (error == nil) {
					[SVProgressHUD showSuccessWithStatus:@""];
				} else {
					[SVProgressHUD showErrorWithStatus:@""];
				}
			}];
		}
		else
		{
			[SVProgressHUD showErrorWithStatus:@""];
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

- (IBAction)showPhotoLibrary:(id)sender
{
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	
	if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
	{
		[self presentModalViewController:picker animated:YES];
	}
	else
	{
		_photoLibraryPopover = [[UIPopoverController alloc] initWithContentViewController:picker];
		_photoLibraryPopover.delegate = self;
		[_photoLibraryPopover presentPopoverFromRect:_photoLibraryButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	}
}
#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	//show that something is working and pause the detection
	[SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
	[_captureView pauseFaceDetection];
	
	if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
	{
		[self dismissModalViewControllerAnimated:YES];
	}
	else
	{
		[_photoLibraryPopover dismissPopoverAnimated:NO];
		_photoLibraryPopover = nil;
	}
	
	double delayInSeconds = 0.3;
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
	dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
		
		UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
		
		[_captureView processPicture:image completion:^(UIImage *picture, NSError *error) {
			
			if (error == nil)
			{
				[self saveImageToPhotoLibrary:picture completion:^(NSError *error) {
					if (error == nil) {
						[SVProgressHUD showSuccessWithStatus:@""];
					} else {
						[SVProgressHUD showErrorWithStatus:@""];
					}
				}];
			}
			else
			{
				[SVProgressHUD showErrorWithStatus:@""];
			}
			
			//in any case resume the detection and hide the activity view, we finished to work
			[_captureView resumeFaceDetection];
			[SVProgressHUD dismiss];
		}];
	});
}

#pragma mark - UIPopoverControllerDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
	if (popoverController == _photoLibraryPopover)
	{
		_photoLibraryPopover = nil;
	}
}

#pragma mark - Utilities

- (void)saveImageToPhotoLibrary:(UIImage *)image completion:(void (^)(NSError *error))completion
{
	//no errors, save the picture
	ALAssetsLibrary *assetsLibrary = [ALAssetsLibrary new];
	[assetsLibrary writeImageToSavedPhotosAlbum:image.CGImage orientation:(ALAssetOrientation)image.imageOrientation completionBlock:
	 ^(NSURL *assetURL, NSError *error){
		 if (completion)
			 completion(error);
	 }];
}

@end
