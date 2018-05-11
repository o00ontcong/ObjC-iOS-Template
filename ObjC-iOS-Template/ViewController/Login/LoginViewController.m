//
//  LoginViewController.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 03/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController ()<APIManagerDelegate>{
    UITextField *textFieldUser, *textFieldPassword;
    UIButton* btnLogin;
    APIManager* manager;

}

@end

@implementation LoginViewController

#pragma mark - Lifecycle
- (void)dealloc
{
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.customBackButton;
    self.navigationItem.title = @"Login";
    [self.navigationController.navigationBar setTitleTextAttributes:@{
        NSForegroundColorAttributeName : [UIColor whiteColor]
    }];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    manager = [[APIManager alloc] init];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - Custom Accessors
- (void)addBackgroundView
{
    UIImageView* imageView = [[UIImageView alloc]
        initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,
                          self.view.frame.size.height)];
    imageView.image = [UIImage imageNamed:@"backgroundView"];

    [self.view addSubview:imageView];
}
- (void)configureView
{
    // ImageView
    UIImageView* imageView = [[UIImageView alloc]
        initWithFrame:CGRectMake(0, 90, 101 * SCALE_W, 35 * SCALE_W)];
    imageView.centerX = view.centerX;
    UIImage* image = [UIImage imageNamed:@"Flow"];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.image = image;
    [view addSubview:imageView];

    // UITextField
    textFieldUser =
        [[UITextField alloc] initWithFrame:CGRectMake(10, imageView.bottom + 20,
                                               SCREEN_WIDTH - 60, 40)];
    textFieldUser.centerX = view.centerX;
    textFieldUser.borderStyle = UITextBorderStyleRoundedRect;
    textFieldUser.font =
        [Utility fontHelveticaNeueLight:[ProjectStyle getFormattedFontSize:18]];
    textFieldUser.placeholder = @"User name";
    textFieldUser.autocorrectionType = UITextAutocorrectionTypeNo;
    textFieldUser.keyboardType = UIKeyboardTypeDefault;
    textFieldUser.returnKeyType = UIReturnKeyNext;
    textFieldUser.clearButtonMode = UITextFieldViewModeWhileEditing;
    textFieldUser.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textFieldUser.delegate = self;
    [textFieldUser addTarget:self
                      action:@selector(textFieldEditingChanged:)
            forControlEvents:UIControlEventEditingChanged];
    [view addSubview:textFieldUser];

    // UITextFieldd
    textFieldPassword = [[UITextField alloc]
        initWithFrame:CGRectMake(10, textFieldUser.bottom + 20, SCREEN_WIDTH - 60,
                          40)];
    textFieldPassword.centerX = view.centerX;
    textFieldPassword.borderStyle = UITextBorderStyleRoundedRect;
    textFieldPassword.font = [Utility
        fontHelveticaNeueSemibold:[ProjectStyle getFormattedFontSize:18]];
    textFieldPassword.placeholder = @"Password";
    textFieldPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    textFieldPassword.keyboardType = UIKeyboardTypeDefault;
    textFieldPassword.returnKeyType = UIReturnKeyDone;
    textFieldPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    textFieldPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [textFieldPassword addTarget:self
                          action:@selector(textFieldEditingChanged:)
                forControlEvents:UIControlEventEditingChanged];
    textFieldPassword.delegate = self;
    [view addSubview:textFieldPassword];

    btnLogin = [Helper
        getThemedBlueButtonWithTitleForNormalState:@"Login"
                                          andFrame:(CGRectMake(
                                                       0,
                                                       textFieldPassword.bottom + 20,
                                                       textFieldPassword.width,
                                                       40))];
    [btnLogin addTarget:self
                  action:@selector(loginAction:)
        forControlEvents:UIControlEventTouchUpInside];
    btnLogin.centerX = view.centerX;
    [view addSubview:btnLogin];

    UILabel* registerLabel = [[UILabel alloc]
        initWithFrame:CGRectMake(sideMargins, btnLogin.bottom + 25 * SCALE_H,
                          self.view.width - (sideMargins * 2.0), 20)];
    registerLabel.textColor = [UIColor whiteColor];
    [registerLabel
        setFont:[Utility
                    fontHelveticaNeue:[ProjectStyle getFormattedFontSize:13]]];
    registerLabel.textAlignment = NSTextAlignmentCenter;
    registerLabel.numberOfLines = 0;
    NSString* fullString =
        [NSString stringWithFormat:@"%@ %@", @"Don’t have an account?",
                  NSLocalizedString(@"btn_register", nil)];
    NSString* registerString = [NSString
        stringWithFormat:@"%@", NSLocalizedString(@"btn_register", nil)];
    NSRange rangeLabelRegister = [fullString rangeOfString:registerString];
    NSMutableAttributedString* textRegisterString =
        [[NSMutableAttributedString alloc] initWithString:fullString];
    [textRegisterString setAttributes:@{
        NSFontAttributeName :
            [Utility fontHelveticaNeueBold:[ProjectStyle getFormattedFontSize:13]]
    }
                                range:rangeLabelRegister];
    [textRegisterString
        addAttribute:NSUnderlineStyleAttributeName
               value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]
               range:rangeLabelRegister];
    [registerLabel setAttributedText:textRegisterString];

    [view addSubview:registerLabel];

    // UIButton
    UIButton* btnRegister = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRegister setFrame:registerLabel.frame];
    [btnRegister setBackgroundColor:[UIColor clearColor]];
    [btnRegister addTarget:self
                    action:@selector(registerAction:)
          forControlEvents:UIControlEventTouchUpInside];
    btnRegister.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

    [view addSubview:btnRegister];
   
    [btnLogin setEnabled:NO];
    textFieldUser.text = [Utility getKeyValue:PROJECT_SESSIONKEY];
    textFieldUser.text = @"0909836478";
    textFieldPassword.text = @"123456a@";
    if ([textFieldUser.text isEqualToString:@""] ||
        [textFieldPassword.text isEqualToString:@""]) {
        [btnLogin setBackgroundColor:[UIColor colorWithRed:155 / 255.0f
                                                     green:155 / 255.0f
                                                      blue:155 / 255.0f
                                                     alpha:1.0]];
        [btnLogin setEnabled:NO];
    } else {
        [btnLogin setBackgroundColor:BUTTON_BG];
        [btnLogin setEnabled:YES];
    }
}

#pragma mark - IBActions
- (IBAction)loginAction:(id)sender
{
    [manager call:PATH_LOGIN
          setAction:HTTP_METHOD_POST
          setData:@{@"userName":textFieldUser.text,@"password":textFieldPassword.text}
          isToken:NO
      setDelegate:self];
    //    [Utility registerKey:PROJECT_SESSIONKEY withValue:textFieldUser.text];
    //    [Helper authenticationChange];
}
- (IBAction)registerAction:(id)sender
{
}
#pragma mark - Public

- (void)publicMethod
{
}

#pragma mark - Private

- (void)textFieldEditingChanged:(UITextField*)textField
{
    if ([textFieldUser.text isEqualToString:@""] ||
        [textFieldPassword.text isEqualToString:@""]) {
        [btnLogin setBackgroundColor:[UIColor colorWithRed:155 / 255.0f
                                                     green:155 / 255.0f
                                                      blue:155 / 255.0f
                                                     alpha:1.0]];
        [btnLogin setEnabled:NO];
    } else {
        [btnLogin setBackgroundColor:BUTTON_BG];
        [btnLogin setEnabled:YES];
    }
}
#pragma mark - Protocol conformance

#pragma mark -  Call API

#pragma mark -  Web Service
-(void)APIManager:(NSString *)path setAction:(NSString *)action setData:(NSDictionary *)data completed:(NSDictionary *)JSON{
    NSLog(@"");
}
-(void)APIManager:(NSString *)path setAction:(NSString *)action setData:(NSDictionary *)data failed:(NSError *)error{
    NSLog(@"");

}
@end
