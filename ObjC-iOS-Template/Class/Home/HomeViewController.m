//
//  HomeViewController.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "HomeViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fs_voucher_left_arrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = backButton;
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = self.burgerIcon;

}

-(void)configureView{
    //UITextField
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
//    textField.font = [Utility fontHelveticaNeueSemibold:[LiquidPayStyle getFormattedFontSize:33]];
    textField.placeholder = @"enter text";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyNext;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.delegate = self;
    [view addSubview:textField];
    
    //UITextField
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 750, 300, 40)];
    textField1.borderStyle = UITextBorderStyleRoundedRect;
//    textField1.font = [Utility fontHelveticaNeueSemibold:[LiquidPayStyle getFormattedFontSize:33]];
    textField1.placeholder = @"vao text";
    textField1.autocorrectionType = UITextAutocorrectionTypeNo;
    textField1.keyboardType = UIKeyboardTypeDefault;
    textField1.returnKeyType = UIReturnKeyDone;
    textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField1.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField1.delegate = self;
    [view addSubview:textField1];
    
    
}
@end
