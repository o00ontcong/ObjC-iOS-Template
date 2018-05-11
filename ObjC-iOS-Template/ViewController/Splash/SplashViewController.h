//
//  SplashViewController.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 02/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTTTAnimatedScrollViewController.h"

@interface SplashViewController : IFTTTAnimatedScrollViewController
@property (strong, nonatomic)  UIPageControl *pageControl;

@property (strong, nonatomic) UIImageView *page1Image;
@property (strong, nonatomic) UIImageView *page2Image;
@property (strong, nonatomic) UIImageView *page3Image;
@property (strong, nonatomic) UIImageView *page4Image;
@end
