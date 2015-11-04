//
//  AppDelegate.m
//  ReceiverDemo
//
//  Created by Hirat on 15/1/19.
//  Copyright (c) 2015年 Hirat. All rights reserved.
//

#import "AppDelegate.h"
#import <HRTFontToolkit.h>
#import <JLRoutes.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIViewController* fontListViewController = [HRTFontToolkit sharedInstance].rootViewController;
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: fontListViewController];
    self.window.rootViewController = nav;
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([url.scheme isEqualToString: @"hrtfonttoolkit"])
    {
        return [JLRoutes routeURL: url];
    }
    else
    {
        return NO;
    }
}

@end
