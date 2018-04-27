//
//  AppDelegate.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "AppDelegate.h"
#import "UnifiedTabBarViewController.h"
#import "LeftSliderViewController.h"
#import "LGSideMenuController.h"
@interface AppDelegate ()
@property (strong, nonatomic) LeftSliderViewController *leftVC;

@end

@implementation AppDelegate
@synthesize leftVC;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self checkUserAuthentication];
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

-(void)checkUserAuthentication{
    if ([Helper isCheckAuthentication]){
        self.window.rootViewController = nil;
        UnifiedTabBarViewController *unifiedController = [[UnifiedTabBarViewController alloc] init];
        leftVC = [[LeftSliderViewController alloc] init];
        LGSideMenuController *sideMenuController = [LGSideMenuController sideMenuControllerWithRootViewController:unifiedController
                                leftViewController:leftVC
                               rightViewController:nil];
        sideMenuController.leftViewWidth = LEFT_SLIDER_VIEW_WIDTH;
        sideMenuController.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideAbove;
        sideMenuController.delegate = leftVC;
        [sideMenuController setLeftViewSwipeGestureEnabled:NO];
        self.window.rootViewController = sideMenuController;
        

    } else {
        
    }
}
@end
