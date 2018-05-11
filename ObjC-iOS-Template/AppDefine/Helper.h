//
//  Helper.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIManager.h"
@interface Helper : NSObject
+(BOOL)isCheckAuthentication;
+(UITextField *) CustomizedTextFieldWithFrame:(CGRect)frame andPlaceholderTextName:(NSString *)name;
+(UIButton *)getThemedBlueButtonWithTitleForNormalState:(NSString *)title
                                               andFrame:(CGRect)frame;
+(void)authenticationChange;
@end
