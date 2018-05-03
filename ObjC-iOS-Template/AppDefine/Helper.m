//
//  Helper.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "Helper.h"

@implementation Helper
+(BOOL)isCheckAuthentication{
    return [self checkKeyIdentifier:PROJECT_SESSIONKEY];
}
+(BOOL)checkKeyIdentifier:(NSString *)identifier{
    return [[UYLPasswordManager sharedInstance] validKey:nil forIdentifier:identifier];
}
+(UITextField*) CustomizedTextFieldWithFrame:(CGRect)frame andPlaceholderTextName:(NSString *)name{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [Utility fontHelveticaNeueLight:[ProjectStyle getFormattedFontSize:18]];
    textField.placeholder = name;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyNext;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    return textField;
}

+(UIButton *)getThemedBlueButtonWithTitleForNormalState:(NSString *)title
                                               andFrame:(CGRect)frame{
    
    UIButton *themeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [themeButton setTitle:title forState:UIControlStateNormal];
    themeButton.frame = frame;
    themeButton.titleLabel.font = [Utility fontHelveticaNeueMedium:[ProjectStyle getFormattedFontSize:18.0]];
    themeButton.height = [ProjectStyle getRespectiveFieldHeight];
    themeButton.layer.borderWidth = 1.0f;
    themeButton.layer.cornerRadius = 5.0f;
    themeButton.clipsToBounds = YES;
    themeButton.layer.borderColor = [[UIColor colorWithRed:19.0/255.0 green:201.0/255.0 blue:254.0/255.0 alpha:1.0] CGColor];
    
    [themeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [themeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    [themeButton setBackgroundImage:[ProjectStyle getSolidColorImage:BUTTON_BG] forState:UIControlStateNormal];
    [themeButton setBackgroundImage:[ProjectStyle getSolidColorImage:[UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0]] forState:UIControlStateDisabled];
    
    return themeButton;
}
+(void)authenticationChange{
    [[NSNotificationCenter defaultCenter] postNotificationName:AUTHENTICATION_CHANGE object:nil];
}

@end
