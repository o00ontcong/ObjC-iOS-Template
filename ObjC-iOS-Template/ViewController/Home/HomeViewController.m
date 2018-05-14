//
//  HomeViewController.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "HomeViewController.h"
#import "APIManager.h"
@interface HomeViewController ()<APIManagerDelegate>

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
    textField.placeholder = @"enter text";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyNext;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.delegate = self;
    [view addSubview:textField];

    APIManager *manager = [[APIManager alloc] init];

    [manager call:PATH_OVERVIEW_REPORT
        setAction:HTTP_METHOD_POST
          setData:@{@"shopId":@"295778",
                    @"fromDate":@"05/01/2018",
                    @"toDate":@"05/03/2018"}
      setDelegate:self];
    
}
-(void)APIManager:(NSString *)path setAction:(NSString *)action setData:(NSDictionary *)data completed:(NSDictionary *)JSON{
    
}
@end
