//
//  SplashViewController.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 02/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "SplashViewController.h"
#import "LoginViewController.h"
@interface SplashViewController (){
    UIButton *btnSkip, *btnRegister, *btnLogin;
}

@end

@implementation SplashViewController
#pragma mark - Lifecycle
- (void)dealloc {}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UINavigationBar appearance] setTintColor:HEADER_BAR_TEXT_COLOR];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    self.scrollView.contentSize = CGSizeMake(4 * CGRectGetWidth(self.view.frame),
                                             (SCREEN_HEIGHT - 100));
    if (IS_IPHONE_X) {
        [self.scrollView setFrame:CGRectMake(0,-44,CGRectGetWidth(self.view.frame), (SCREEN_HEIGHT+44))];
        
    } else {
        [self.scrollView setFrame:CGRectMake(0,0,CGRectGetWidth(self.view.frame), (SCREEN_HEIGHT))];
    }
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    btnSkip = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSkip.frame =CGRectMake(76.5*SW, SCREEN_HEIGHT - 2*18*SH, 224*SW, 25*SH);
    [btnSkip addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"btn_skip_and_continue", nil)];
    UIFont *font2 = [Utility fontHelveticaNeue:[ProjectStyle getFormattedFontSize:16]];
    
    [text addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(0, text.length)];
    [text addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(0, text.length)];
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, text.length)];
    [btnSkip setAttributedTitle:text forState:UIControlStateNormal];
    
    [self.view addSubview:btnSkip];
    
    btnRegister = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRegister.frame =CGRectMake(29.5*SW, btnSkip.top - 20.5*SH - 45*SH, 150*SW, 45*SH);
    [btnRegister setTitle:NSLocalizedString(@"btn_register",nil) forState:UIControlStateNormal];
    [btnRegister addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnRegister.layer.cornerRadius = 4*SW;
    btnRegister.layer.borderWidth = 1;
    btnRegister.layer.borderColor = [UIColor whiteColor].CGColor;
    btnRegister.layer.masksToBounds = YES;
    [self.view addSubview:btnRegister]  ;
    
    btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLogin.frame =CGRectMake(btnRegister.right + 16*SW, btnSkip.top - 20.5*SH - 45*SH, 150*SW, 45*SH);
    [btnLogin setTitle:NSLocalizedString(@"btn_login",nil) forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnLogin setBackgroundColor:BUTTON_BG];
    btnLogin.layer.cornerRadius = 4*SW;
    btnLogin.layer.masksToBounds = YES;
    [self.view addSubview:btnLogin];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, btnRegister.top - 55*SH, SCREEN_WIDTH, 40*SH)];
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.tintColor = [UIColor grayColor];
    [self.view  addSubview:self.pageControl];
    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    self.pageControl.numberOfPages = 4;
    
    [self configureView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    self.navigationController.navigationBar.hidden = YES;

    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.navigationController.navigationBar.hidden = NO;
    
}
#pragma mark - Custom Accessors

-(void)configureView{
    CGFloat widthImage =[[UIScreen mainScreen] bounds].size.width>320?[[UIScreen mainScreen] bounds].size.width:320;
    CGFloat heightImage =self.view.frame.size.height;
    CGFloat offsetX=0;
    CGFloat offsetY=0;
    
    //Page 1
    
    self.page1Image = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, offsetY, widthImage, heightImage)];
    self.page1Image.image =[UIImage imageNamed:@"splashScreenImg1"];
    self.page1Image.contentMode = UIViewContentModeScaleAspectFill;
    [self.page1Image setClipsToBounds:YES];
    [self.scrollView addSubview:self.page1Image];
    
    //UILabel
    UILabel *page1Label = [[UILabel alloc] initWithFrame:CGRectMake(20*SW + offsetX, 404*SH, SCREEN_WIDTH - 40*SW, 60*SH)];
    page1Label.textColor = [UIColor whiteColor];
    if ( IS_IPHONE_5_NEW){
        [page1Label setFont:[Utility fontHelveticaNeueBold:[ProjectStyle getFormattedFontSize:24]]];
        page1Label.frameY = 340;
        page1Label.height = 60;
    } else {
        [page1Label setFont:[Utility fontHelveticaNeueBold:[ProjectStyle getFormattedFontSize:26]]];
    }
    page1Label.textAlignment = NSTextAlignmentCenter;
    [page1Label setText:@"Discover exclusive deals\nand offers"];
    page1Label.numberOfLines = 0;
    [self.scrollView addSubview:page1Label];
    
    
    //UILabel
    UILabel *page1Label2 = [[UILabel alloc] initWithFrame:CGRectMake(29.5*SW  + offsetX, 467*SH, 315.5*SW, 36*SH)];
    page1Label2.textColor = [UIColor whiteColor];
    if (IS_IPHONE_5_NEW){
        [page1Label2 setFont:[Utility fontHelveticaNeueMedium:[ProjectStyle getFormattedFontSize:14]]];
    } else {
        [page1Label2 setFont:[Utility fontHelveticaNeueMedium:[ProjectStyle getFormattedFontSize:16]]];
    }
    page1Label2.textAlignment = NSTextAlignmentCenter;
    [page1Label2 setText:@"Access the best deals and share\nthem with friends"];
    page1Label2.numberOfLines = 0;
    [self.scrollView addSubview:page1Label2];
    
    //Page 2
    offsetX +=self.view.frameWidth;
    
    self.page2Image = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, offsetY, widthImage, heightImage)];
    self.page2Image.image =[UIImage imageNamed:@"splashScreenImg2"];
    self.page2Image.contentMode = UIViewContentModeScaleAspectFill;
    [self.page2Image setClipsToBounds:YES];
    [self.scrollView addSubview:self.page2Image];
    
    //UILabel
    UILabel *page2Label = [[UILabel alloc] initWithFrame:CGRectMake(20*SW + offsetX, 404*SH, SCREEN_WIDTH - 40*SW, 60*SH)];
    page2Label.textColor = [UIColor whiteColor];
    if ( IS_IPHONE_5_NEW){
        [page2Label setFont:[Utility fontHelveticaNeueBold:[ProjectStyle getFormattedFontSize:24]]];
        page2Label.height = 60;
        page2Label.frameY = 340;
        
    } else {
        [page2Label setFont:[Utility fontHelveticaNeueBold:[ProjectStyle getFormattedFontSize:26]]];
    }
    page2Label.textAlignment = NSTextAlignmentCenter;
    [page2Label setText:@"Pay quickly with your\nphone"];
    page2Label.numberOfLines = 0;
    [self.scrollView addSubview:page2Label];
    
    //UILabel
    UILabel *page2Label2 = [[UILabel alloc] initWithFrame:CGRectMake(29.5*SW  + offsetX, 467*SH, 315.5*SW, 36*SH)];
    page2Label2.textColor = [UIColor whiteColor];
    if (IS_IPHONE_5_NEW){
        [page2Label2 setFont:[Utility fontHelveticaNeueMedium:[ProjectStyle getFormattedFontSize:14]]];
        
    } else {
        [page2Label2 setFont:[Utility fontHelveticaNeueMedium:[ProjectStyle getFormattedFontSize:16]]];
    }
    page2Label2.textAlignment = NSTextAlignmentCenter;
    [page2Label2 setText:@"No fuss - just scan, pay and enjoy!"];
    page2Label2.numberOfLines = 0;
    [self.scrollView addSubview:page2Label2];
    
    //page 3
    offsetX +=self.view.frameWidth;
    
    self.page3Image = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, offsetY, widthImage, heightImage)];
    self.page3Image.image =[UIImage imageNamed:@"splashScreenImg3"];
    self.page3Image.contentMode = UIViewContentModeScaleAspectFill;
    [self.page3Image setClipsToBounds:YES];
    [self.scrollView addSubview:self.page3Image];
    
    //UILabel
    UILabel *page3Label = [[UILabel alloc] initWithFrame:CGRectMake(20*SW + offsetX, 404*SH, SCREEN_WIDTH - 40*SW, 60*SH)];
    page3Label.textColor = [UIColor whiteColor];
    if ( IS_IPHONE_5_NEW){
        [page3Label setFont:[Utility fontHelveticaNeueBold:[ProjectStyle getFormattedFontSize:24]]];
        page3Label.height = 60;
        page3Label.frameY = 340;
        
    } else {
        [page3Label setFont:[Utility fontHelveticaNeueBold:[ProjectStyle getFormattedFontSize:26]]];
    }
    page3Label.textAlignment = NSTextAlignmentCenter;
    [page3Label setText:@"Redeem deals instantly\nand hassle-free"];
    page3Label.numberOfLines = 0;
    [self.scrollView addSubview:page3Label];
    
    //UILabel
    UILabel *page3Label2 = [[UILabel alloc] initWithFrame:CGRectMake(29.5*SW  + offsetX, 467*SH, 315.5*SW, 36*SH)];
    page3Label2.textColor = [UIColor whiteColor];
    if (IS_IPHONE_5_NEW){
        [page3Label2 setFont:[Utility fontHelveticaNeueMedium:[ProjectStyle getFormattedFontSize:14]]];
        
    } else {
        [page3Label2 setFont:[Utility fontHelveticaNeueMedium:[ProjectStyle getFormattedFontSize:16]]];
    }
    page3Label2.textAlignment = NSTextAlignmentCenter;
    [page3Label2 setText:@"Discounts and rewards are applied\ninstantly when you pay"];
    page3Label2.numberOfLines = 0;
    [self.scrollView addSubview:page3Label2];
    
    //page 4
    offsetX +=self.view.frameWidth;
    self.page4Image = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, offsetY, widthImage, heightImage)];
    self.page4Image.image =[UIImage imageNamed:@"splashScreenImg4"];
    self.page4Image.contentMode = UIViewContentModeScaleAspectFill;
    [self.page4Image setClipsToBounds:YES];
    [self.scrollView addSubview:self.page4Image];
    
    //UILabel
    UILabel *page4Label = [[UILabel alloc] initWithFrame:CGRectMake(20*SW + offsetX, 404*SH, SCREEN_WIDTH - 40*SW, 60*SH)];
    page4Label.textColor = [UIColor whiteColor];
    if ( IS_IPHONE_5_NEW){
        [page4Label setFont:[Utility fontHelveticaNeueBold:[ProjectStyle getFormattedFontSize:24]]];
        page4Label.height = 60;
        page4Label.frameY = 340;
        
    } else {
        [page4Label setFont:[Utility fontHelveticaNeueBold:[ProjectStyle getFormattedFontSize:26]]];
    }
    page4Label.textAlignment = NSTextAlignmentCenter;
    [page4Label setText:@"Peace of mind with \nsecure payments"];
    page4Label.numberOfLines = 0;
    [self.scrollView addSubview:page4Label];
    
    //UILabel
    UILabel *page4Label2 = [[UILabel alloc] initWithFrame:CGRectMake(29.5*SW  + offsetX, 467*SH, 315.5*SW, 36*SH)];
    page4Label2.textColor = [UIColor whiteColor];
    if (IS_IPHONE_5_NEW){
        [page4Label2 setFont:[Utility fontHelveticaNeueMedium:[ProjectStyle getFormattedFontSize:14]]];
    } else {
        [page4Label2 setFont:[Utility fontHelveticaNeueMedium:[ProjectStyle getFormattedFontSize:16]]];
    }
    page4Label2.textAlignment = NSTextAlignmentCenter;
    [page4Label2 setText:@"Transactions are encrypted \nand no data is stored on your phone"];
    page4Label2.numberOfLines = 0;
    [self.scrollView addSubview:page4Label2];
    
}

#pragma mark - IBActions


-(IBAction)btnClicked:(id)sender{
    
    if(sender == btnSkip){
        
    }
    else if(sender == btnRegister){
     
//        [self.navigationController pushViewController:[[RegisterFormViewController alloc] init] animated:YES];
        
        
    }
    else if(sender == btnLogin){
        [self.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];
        
    }
    
}

#pragma mark - Public

- (void)publicMethod {}

#pragma mark - Private


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    CGFloat pageWidth = CGRectGetWidth(self.view.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    self.pageControl.currentPage = roundf(pageFraction);
}



- (IBAction)changePage:(id)sender {
    
    UIPageControl *pager=sender;
    NSInteger page = pager.currentPage;
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
}

#pragma mark - Protocol conformance

#pragma mark -  Call API

#pragma mark -  Web Service
@end
