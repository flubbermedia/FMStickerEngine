FMStickerEngine
---------------

**FMStickerEngine** is a framework build on top of the face detection API introduced in iOS 5. It creates a UIView that displays the video feed coming from the camera and overlay a set of images to any face detected in the video, in real time.
A picture with the final composition is then returned when the shutter button is pressed.

For further details about the implementation, please check the documentation provided with the main two classes FMStickerCaptureView and FMSticker.

FMStickerEngine works with iOS >= 5.0.

Before building the project, please make sure to include the following frameworks:
 
 - AVFoundation.framework
 - CoreGraphics.framework
 - CoreImage.framework
 - CoreMedia.framework
 - CoreVideo.framework
 - Foundation.framework
 - QuartzCore.framework
 - UIKit.framework

Documentation
-------------
Documentation can be [browsed online](http://github.flubbermedia.com/FMStickerEngine) or installed in your Xcode Organizer via the [Atom Feed URL](http://github.flubbermedia.com/FMStickerEngine/FMStickerEngine.atom).

Credits
-------
FMStickerEngine was created by [Maurizio Cremaschi](http://cremaschi.me) and [Andrea Ottolina](http://andreaottolina.com) for [Flubber Media Ltd](http://flubbermedia.com).