//
//  BaseNavigationController.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UINavigationBar+FixedHeightWhenStatusBarHidden.h"

@implementation BaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) {

        [self.navigationBar setBarTintColor:HEADER_BAR];
        [self.navigationBar setTintColor:HEADER_BAR_TEXT_COLOR];
        
        
    }else{
        [self.navigationBar setTintColor:[UIColor colorWithRed:0 green:0.486 blue:0.8 alpha:1]];
    }
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIColor whiteColor],UITextAttributeTextColor,
                                               [UIColor clearColor], UITextAttributeTextShadowColor,
                                               [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    

    self.navigationBar.translucent = NO;
    UIImage *backButtonImage = [Utility imageWithImage:[UIImage imageNamed:@"arrow-back.png"] scaledToSize:CGSizeMake(25,25)];

    
    //set to remove navigation bar bottom image
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = HEADER_BAR;
    }
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:HEADER_BAR];
    
    self.navigationController.navigationBar.backgroundColor = HEADER_BAR;
    [self.navigationController.navigationBar setTintColor:HEADER_BAR_TEXT_COLOR];
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
}


@end
