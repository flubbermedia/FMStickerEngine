//
//  AppDelegate.m
//  StickersEngine
//
//  Created by Maurizio Cremaschi on 9/8/12.
//  Copyright (c) 2012 Flubber Media Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <FMStickerEngine/FMStickerEngine.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //-----------------------
    // The framework license
    //-----------------------
    //
    // To test the framework in your app set the Bundle ID and license string as below.
    //
    // BundleID: com.flubbermedia.fmstickerengine
    // License:  00f8c575b7f2a77d3ab00198c01203976832d463b52c66ea74db752946380c24
    //
    // In order to use your own Bundle ID you need to purchase a full license and update the following line.
    [FMStickerCaptureView setLicense:@"00f8c575b7f2a77d3ab00198c01203976832d463b52c66ea74db752946380c24"];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
