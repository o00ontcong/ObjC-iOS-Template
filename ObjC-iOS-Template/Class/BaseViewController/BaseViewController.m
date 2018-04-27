//
//  BaseViewController.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController{
    
    UIView *inputAccView;
    CGRect viewFrameOri;
    CGFloat heightKeyboard;
    
}
@synthesize btnDone;
@synthesize btnNext;
@synthesize btnPrevious;
@synthesize customBackButton;

#define kOFFSET_FOR_KEYBOARD 80.0

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setBackBarButtonItem: [[UIBarButtonItem alloc] initWithTitle: @"" style: UIBarButtonItemStylePlain target: nil action: nil]];
    
    fieldsDivider = 7.0;
    sideMargins = 20.0;
    fieldWidth = self.view.width - (sideMargins * 2.0);
    
    customBackButton =  [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"arrow_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] style:UIBarButtonItemStylePlain target:self action:@selector(goBackButton:)];
    
    [self addBackgroundView];
    [self willConfigureView];
    [self configureView];
    [self didConfiguredView];
}

#pragma mark View Configuration
-(void)addBackgroundView{
    
}
-(void)willConfigureView{
    resized = NO;
    view = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    self.view.backgroundColor = BACKGROUND;
    
    view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:view];

}

-(void)configureView{
}

-(void)didConfiguredView{
    
    
    //Register InputAccessory View and tag for each textfields
    NSInteger tagNum = 1;
    for (id object in [view subviews]) {
        if([object isKindOfClass:[UITextField class]]){
            //DebugLog(@"%@",object);
            UITextField *textField = object;
            textField.delegate = self;
            textField.tag = tagNum++;
            [textField setInputAccessoryView:[self getInputAccessoryView]];
        }
    }
    
    //Update Scollview contentSize
    //CGRect contentRect = CGRectZero;
    CGFloat scrollViewHeight = 0.0f;
    NSInteger iCount=0;
    for (UIView *viewObject in view.subviews) {
        
        //contentRect = CGRectUnion(contentRect, viewObject.frame);
        if (!view.hidden)
        {
            CGFloat y = viewObject.frame.origin.y;
            CGFloat h = viewObject.frame.size.height;
            if (y + h > scrollViewHeight)
            {
                scrollViewHeight = h + y;
            }
        }
        iCount++;
    }
    if (!self.navigationController.navigationBar.translucent){
        scrollViewHeight = scrollViewHeight+80;
    } else {
        scrollViewHeight = scrollViewHeight+16;
    }
    if (!self.tabBarController.tabBar.hidden){
        scrollViewHeight = scrollViewHeight+40;
    }
    view.contentSize = CGSizeMake(self.view.frame.size.width, scrollViewHeight);
    viewFrameOri = [view frame];
}

#pragma mark TextField Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    UIResponder* nextResponder = [currentTextField.superview viewWithTag:currentTextField.tag + 1];
    if (!nextResponder) {
        [currentTextField resignFirstResponder];
        return NO;
    }
    [self nextTextField];
    return NO; // We do not want UITextField to insert line-breaks.
}

- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    currentTextField = textField;
}

#pragma mark InputAccessoryView
-(void)nextTextField
{
    NSInteger nextTag = currentTextField.tag + 1;
    UIResponder* nextResponder = [currentTextField.superview viewWithTag:nextTag];
    
    if (nextResponder) {
        
        [nextResponder becomeFirstResponder];
    } else {
        [currentTextField resignFirstResponder];
    }
}

-(void)previousTextField
{
    NSInteger previousTag = currentTextField.tag - 1;
    UIResponder* previousResponder = [currentTextField.superview viewWithTag:previousTag];
    if (previousResponder && previousTag != 0) {
        [previousResponder becomeFirstResponder];
    } else {
        [currentTextField resignFirstResponder];
    }
}

-(UIView *)getInputAccessoryView{
    
    
    CGFloat widthScreen = self.view.frame.size.width;
    widthScreen = [[UIScreen mainScreen] bounds].size.width;
    if(inputAccView != nil) return inputAccView;
    inputAccView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, widthScreen -10.0, 40.0)];
    [inputAccView setBackgroundColor:TEXTFIELD_BG_COLOR];
    
    
    btnPrevious = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnPrevious setImage:[[UIImage imageNamed:@"Leftarrow-icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [btnPrevious setFrame:CGRectMake(10.0, 0.0f, 30.0f, 40.0f)];
    [btnPrevious setTitle:@"" forState:UIControlStateNormal];
    [btnPrevious setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnPrevious addTarget:self action:@selector(previousTextField) forControlEvents:UIControlEventTouchUpInside];
    [btnPrevious setTintColor:BUTTON_BG];
    [inputAccView addSubview:btnPrevious];
    
    btnNext = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNext setFrame:CGRectMake(45.0, 0.0f, 30.0f, 40.0f)];
    [btnNext setImage:[[UIImage imageNamed:@"Rightarrow-icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [btnNext setTitle:@"" forState:UIControlStateNormal];
    [btnNext setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnNext addTarget:self action:@selector(nextTextField) forControlEvents:UIControlEventTouchUpInside];
    [btnNext setTintColor:BUTTON_BG];
    [inputAccView addSubview:btnNext];
    
    
    
    
    btnDone = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake((widthScreen- 80.0), 0.0f, 80.0f, 40.0f)];
    [btnDone setTitle:NSLocalizedString(@"btn_done",nil) forState:UIControlStateNormal];
    [btnDone setTitleColor:TEXT_COLOR forState:UIControlStateNormal];
    [btnDone addTarget:self action:@selector(dismissKeyboard) forControlEvents:UIControlEventTouchUpInside];
    [inputAccView addSubview:btnDone];
    
    return inputAccView;
}

#pragma mark View Delegate
- (void)viewWillAppear:(BOOL)animated
{
    if(tap == nil){
        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
        tap.numberOfTapsRequired = 1;
        tap.cancelsTouchesInView = YES;
    }
    if(panGesture == nil){
        panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
        
        panGesture.minimumNumberOfTouches =1;
        panGesture.cancelsTouchesInView = YES;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardFrameDidChange:)
                                                 name:UIKeyboardDidChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    
    
}

-(void)restoreViewFrame
{
    view.frame = viewFrameOri;
    
}
-(void)keyboardFrameDidChange:(NSNotification*)notification{
}
#pragma mark Notification Area
-(void)keyboardWillShow:(NSNotification *)notification {
    if(resized) return; else resized = true;
    [view addGestureRecognizer:tap];
    [view addGestureRecognizer:panGesture];
    
    CGRect keyboardRect = [self.view convertRect:[[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue] fromView:nil];
    
    heightKeyboard =keyboardRect.size.height;
    CGRect viewFrame = [view frame];
    
    viewFrame.size.height -= heightKeyboard;
    if (!self.navigationController.navigationBar.translucent){
        viewFrame.size.height -= (inputAccView.height + ([Utility getRespectiveFieldHeight] / 2.0)); //Space for inputAccessoryView
    }
    view.frame = viewFrame;
    
    
    CGRect textFieldRect = currentTextField.frame;
    [view scrollRectToVisible:textFieldRect animated:YES];
}

-(void)keyboardWillHide:(NSNotification *)notification {
    resized = false;
    [view removeGestureRecognizer:tap];
    [view removeGestureRecognizer:panGesture];
    
    CGRect viewFrame = [view frame];
    
    
    viewFrame.size.height += heightKeyboard;
    viewFrame.size.height += (inputAccView.height + ([Utility getRespectiveFieldHeight] / 2.0)); //Space for inputAccessoryView
    
    view.frame = viewFrame;
    [view scrollsToTop];
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    // DebugLog(@"keyboard did hide");
    view.frame = viewFrameOri;
}
#pragma mark Utility
-(IBAction)goBackButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)dismissKeyboard {
    [currentTextField resignFirstResponder];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    
    tap = nil;
    panGesture = nil;
    view=nil;
    // viewMain=nil;
    //  userData=nil;
    currentTextField=nil;
    resized=nil;
    inputAccView=nil;
    btnDone=nil;
    btnNext=nil;
    btnPrevious=nil;
    
}

-(void)alertWithTitle:(NSString *)title andMessage:(NSString *)message
{
    [self presentViewController:[Utility alertC:title Message:message] animated:YES completion:nil];
    
}


-(void)alertWithTitle:(NSString *)title andMessage:(NSString *)message andCompletion:(void (^ __nullable)(void))completion
{
    [self presentViewController:[Utility alertC:title Message:message] animated:YES completion:completion];
    
}

#pragma mark - loadingView when needed in view contriller(not in service)
-(void)showLoadingView {
    [[[UIApplication sharedApplication] keyWindow].rootViewController.view endEditing:YES]; //To fix keyboard appear bug
    loadingIndicator = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow].rootViewController.view animated:YES];
    loadingIndicator.labelText = NSLocalizedString(@"message_loading", nil);
    [[[UIApplication sharedApplication] keyWindow] addSubview:loadingIndicator];
    [loadingIndicator show:YES];
}

-(void)hideLoadingView {
    [loadingIndicator hide:YES];
}

-(IBAction)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}




@end

