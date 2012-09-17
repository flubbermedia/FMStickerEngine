//
//  FMSticker.h
//
//  Created by Maurizio Cremaschi on 9/8/12.
//  Copyright (c) 2012 Flubber Media Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

/** FMSticker is the class that defines images and settings used by
 FMStickerCaptureView to generate both the preview and final image.
 
 setEyesFeatureWithImage:leftEyePosition:rightEyePosition: and
 setMouthFeatureWithImage:mouthPosition: are used to define images used by each 
 feature.
 */

@class FMStickerFeatureLayer;

@interface FMSticker : NSObject


/** The eyesFeature object currently used (readonly).
 
 */
@property (nonatomic, strong, readonly) FMStickerFeatureLayer *eyesFeature;

/** The mouthFeature object currently used (readonly).

 */
@property (nonatomic, strong, readonly) FMStickerFeatureLayer *mouthFeature;

/**---------------------------------------------------------------------------------------
 * @name Setting feature images
 *  ---------------------------------------------------------------------------------------
 */

/** Sets the image to be used with eyes.
 
 Defines the image to be used for the eyes feature. The two parameters
 leftEyePosition and rightEyePosition define the points (in pixels) on the image
 where the eyes will get aligned. The origin of the coordinate system is the top
 left corner of the image. It's not necessary to include any trasparent area if
 the points fall outside the boundaries of the image.
 
 @param image A UIImage that will be overlayed on the eyes.
 @param leftEyePosition A CGPoint which defines the point on the image that
 should be aligned with the left eye position returned by the face detection API.
 @param rightEyePosition A CGPoint which defines the point on the image that
 should be aligned with the right eye position returned by the face detection API.
 */
- (void)setEyesFeatureWithImage:(UIImage *)image leftEyePosition:(CGPoint)leftEyePosition rightEyePosition:(CGPoint)rightEyePosition;

/** Sets the image to be used with the mouth.
 
 Defines the image to be used for the mouth feature. The mouthPosition parameter
 defines the point (in pixels) on the image where the mouth will get aligned.
 The origin of the coordinate system is the top left corner of the image.
 It's not necessary to include any trasparent area if the points fall outside 
 the boundaries of the image.
 
 @param image A UIImage that will be overlayed on the mouth.
 @param mouthPosition A CGPoint which defines the point on the image that
 should be aligned with the mouth position returned by the face detection API.
 */
- (void)setMouthFeatureWithImage:(UIImage *)image mouthPosition:(CGPoint)mouthPosition;

@end
