//
//  Constants.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@class UserModel;
@interface Constants : NSObject
@property (nonatomic, strong) UserModel *userModel;

+ (Constants*)shared;
@end
#define LEFT_SLIDER_VIEW_WIDTH ([[UIScreen mainScreen] bounds].size.width) / 1.5

#ifdef DEV
#define LogEnable YES
#elif QA
#define LogEnable NO
#elif PROD
#define LogEnable NO
#endif
#define DebugLog(__FORMAT__, ...)                                                                                                                                              \
{                                                                                                                                                                          \
if (LogEnable)                                                                                                                                                         \
NSLog((@"🔶%@ FUNCTION%s 🔷LINE-%d " __FORMAT__), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); \
}

#pragma mark Define Color

#define UIColorFromRGB(rgbValue)                                         \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8)) / 255.0  \
blue:((float)((rgbValue & 0x0000FF) >> 0)) / 255.0  \
alpha:1.0]

//New Theming Constants
#define HEADER_BAR [UIColor colorWithRed:7.0 / 255.0 green:134.0 / 255.0 blue:231.0 / 255.0 alpha:1.0]
#define HEADER_BAR_TEXT_COLOR [UIColor whiteColor]
#define BACKGROUND UIColorFromRGB(0xF1F2F7) //[UIColor colorWithRed:241.0/255.0 green:242.0/255.0 blue:247.0/255.0 alpha:1.0]
#define BOTTOM_BAR_GRADIENT_START_COLOR [UIColor colorWithRed:19.0 / 255.0 green:201.0 / 255.0 blue:254.0 / 255.0 alpha:1.0]
#define BOTTOM_BAR_GRADIENT_END_COLOR [UIColor colorWithRed:41.0 / 255.0 green:128.0 / 255.0 blue:184.0 / 255.0 alpha:1.0]
//Old Theming
#define FOOTER_BG_COLOR [UIColor whiteColor]
#define FOOTER_UNSELECTED [UIColor colorWithRed:109.0 / 255.0 green:109.0 / 255.0 blue:109.0 / 255.0 alpha:1.0]
#define FOOTER_SELECTED HEADER_BAR
