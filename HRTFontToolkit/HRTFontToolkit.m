//
//  HRTFontToolkit.m
//  HRTFontToolkit
//
//  Created by Hirat on 15/1/21.
//  Copyright (c) 2015年 Hirat. All rights reserved.
//

#import "HRTFontToolkit.h"
#import <JLRoutes.h>

#import "HRTFontListTableViewController.h"
#import "HRTFontDetailTableViewController.h"

@interface HRTFontToolkit ()
@property (nonatomic, strong) UIStoryboard* storyboard;
@property (nonatomic, strong) NSMutableDictionary* routes;
@end

@implementation HRTFontToolkit

+ (void)load
{
    [HRTFontToolkit sharedInstance];
}

+ (instancetype)sharedInstance
{
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        self.storyboard = [UIStoryboard storyboardWithName: @"HRTFontToolkit" bundle: nil];
        
        [self map: @"font" toControllerClass: [HRTFontListTableViewController class]];
        [self map: @"font/detail" toControllerClass: [HRTFontDetailTableViewController class]];
    }
    
    return self;
}

- (NSMutableDictionary*)routes
{
    if (!_routes)
    {
        _routes = [[NSMutableDictionary alloc] init];
    }
    return _routes;
}

- (void)map:(NSString*)route toControllerClass:(Class)controllerClass
{
    self.routes[route] = controllerClass;
    
    [JLRoutes addRoute: route handler:^BOOL(NSDictionary *parameters) {
        
        UIViewController* vc = [[HRTFontToolkit sharedInstance] viewControllerForRoute: route];
        if (vc)
        {
            vc.parameters = parameters;
            [[HRTFontToolkit sharedInstance].navigationController pushViewController: vc animated: YES];
            return YES;
        }
        else
        {
            return NO;
        }
    }];
}

- (UIViewController*)viewControllerForRoute:(NSString*)route;
{
    if ([self.routes.allKeys containsObject: route])
    {
        UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier: NSStringFromClass(self.routes[route])];
        return vc;
    }
    else
    {
        return nil;
    }
}

- (UIViewController*)rootViewController
{
    return [self viewControllerForRoute: @"font"];
}

- (UINavigationController*)navigationController
{
    if (!_navigationController)
    {
        _navigationController = (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    }

    return _navigationController;
}

@end
