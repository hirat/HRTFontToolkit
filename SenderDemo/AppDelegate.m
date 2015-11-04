//
//  AppDelegate.m
//  SenderDemo
//
//  Created by Hirat on 15/1/19.
//  Copyright (c) 2015年 Hirat. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSURL* url = [NSURL URLWithString: @"hrtfonttoolkit://font/detail?fontName=Avenir-Black"];
    if ([application canOpenURL: url])
    {
        [application openURL: url];
    }
    
    return YES;
}

@end
