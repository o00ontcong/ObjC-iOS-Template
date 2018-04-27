//
//  BaseViewController.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "UIView+FrameAdjustments.h"
#import "UIViewController+LGSideMenuController.h"
#import "LGSideMenuController.h"
@interface BaseViewController : UIViewController <UITextFieldDelegate>{
    UITapGestureRecognizer *tap;
    
    UIPanGestureRecognizer *panGesture;
    UIScrollView *view;
    UITextField *currentTextField;
    BOOL resized;
    
    float fieldsDivider;
    float sideMargins;
    float fieldWidth;
    
    MBProgressHUD *loadingIndicator;
    
}

@property(nonatomic, retain)UIButton *btnDone;
@property(nonatomic, retain)UIButton *btnNext;
@property(nonatomic, retain)UIButton *btnPrevious;
@property(nonatomic, retain)UIBarButtonItem *customBackButton;
-(IBAction)backAction:(id)sender;

-(UIView *)getInputAccessoryView;
-(void)configureView;
-(void)dismissKeyboard;
-(void)keyboardDidHide:(NSNotification *)notification;
-(void)alertWithTitle:(NSString *)title andMessage:(NSString *)message;
-(void)alertWithTitle:(NSString *)title andMessage:(NSString *)message andCompletion:(void (^ __nullable)(void))completion;
-(void)showLoadingView;
-(void)hideLoadingView;
-(void)addBackgroundView;
@end
