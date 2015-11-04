//
//  HRTFontToolkit.h
//  HRTFontToolkit
//
//  Created by Hirat on 15/1/21.
//  Copyright (c) 2015年 Hirat. All rights reserved.
//

#import "HRTAppModule.h"
#import <UIViewController+HRTAppModule.h>

@interface HRTFontToolkit : NSObject <HRTAppModule>

/**
 *  单例
 *
 *  @return Font模块单例
 */
+ (instancetype)sharedInstance;

/// 通过这个 NavigationController弹出子视图
@property (nonatomic, strong) UINavigationController* navigationController;

/// 该模块对应的所有 scheme
@property(strong, nonatomic, readonly) NSMutableDictionary* routes;

/// 该模块对应的 rootViewController
@property(strong, nonatomic, readonly) UIViewController* rootViewController;

/**
 *  将 url 与 UIViewController 关联起来
 *
 *  @param route           url
 *  @param controllerClass UIViewController 对应的 Class
 */
- (void)map:(NSString*)route toControllerClass:(Class)controllerClass;

/**
 *  url 对应的 UIViewController
 *
 *  @param route url
 *
 *  @return VC
 */
- (UIViewController*)viewControllerForRoute:(NSString*)route;


@end
