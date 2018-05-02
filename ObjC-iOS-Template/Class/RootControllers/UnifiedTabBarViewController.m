//
//  UnifiedTabBarViewController.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "UnifiedTabBarViewController.h"
#import "BaseViewController.h"

#import "BaseNavigationController.h"
#import "HomeViewController.h"
@interface UnifiedTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation UnifiedTabBarViewController

#pragma mark - Lifecycle
- (void)dealloc {}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.view.backgroundColor = [UIColor blueColor];
    [self configureView];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setNeedsStatusBarAppearanceUpdate];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
}

#pragma mark - Custom Accessors
-(void)configureView{
    
    // Configure Wallet
    BaseNavigationController *vcWallet = [[BaseNavigationController alloc] initWithRootViewController:[[HomeViewController alloc]init]];
    vcWallet.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(TAB_BAR_ITEM, nil) image:[UIImage imageNamed:@"tapbar_wallet_icon_inactive"] tag:1];
    vcWallet.tabBarItem.image = [[UIImage imageNamed:@"tapbar_wallet_icon_inactive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcWallet.tabBarItem.selectedImage = [[UIImage imageNamed:@"tapbar_wallet_icon_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    
    //Configure Payment tab
    BaseNavigationController *vcPayment = [[BaseNavigationController alloc] initWithRootViewController:[[HomeViewController alloc]init]];
    vcPayment.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(TAB_BAR_ITEM,nil) image:[UIImage imageNamed:@"nPAY_inactive"] tag:3];
    vcPayment.tabBarItem.image = [[UIImage imageNamed:@"nPAY_inactive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcPayment.tabBarItem.selectedImage = [[UIImage imageNamed:@"nPAY_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    //Configure Home Tab
    BaseNavigationController *vcProfile = [[BaseNavigationController alloc] initWithRootViewController:[[HomeViewController alloc]init]];
    vcProfile.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(TAB_BAR_ITEM,nil) image:[UIImage imageNamed:@"Profile_icon"] tag:2];
    vcProfile.tabBarItem.image = [[UIImage imageNamed:@"Profile_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcProfile.tabBarItem.selectedImage = [[UIImage imageNamed:@"Profile_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    
    //configure Discount Tab
    BaseNavigationController *vcDiscount = [[BaseNavigationController alloc] initWithRootViewController:[[HomeViewController alloc]init]];
    vcDiscount.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(TAB_BAR_ITEM,nil) image:[UIImage imageNamed:@"tapbar_history_icon_inactive"] tag:5];
    vcDiscount.tabBarItem.image = [[UIImage imageNamed:@"iconMainMenuDiscount"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcDiscount.tabBarItem.selectedImage =[[UIImage imageNamed:@"iconMainMenuDiscountSelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    
    
    //Configure History Tab
    BaseNavigationController *vcHistory = [[BaseNavigationController alloc] initWithRootViewController:[[HomeViewController alloc]init]];
    vcHistory.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(TAB_BAR_ITEM,nil) image:[UIImage imageNamed:@"tapbar_history_icon_inactive"] tag:6];
    vcHistory.tabBarItem.image = [[UIImage imageNamed:@"tapbar_history_icon_inactive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcHistory.tabBarItem.selectedImage =[[UIImage imageNamed:@"tapbar_history_icon_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    
    //Configuring Shop tab
    BaseNavigationController *vcShop = [[BaseNavigationController alloc] initWithRootViewController:[[HomeViewController alloc]init]];
    vcShop.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(TAB_BAR_ITEM,nil) image:[UIImage imageNamed:@"Shop-Navigation"] tag:4];
    vcShop.tabBarItem.image = [[UIImage imageNamed:@"Shop-Navigation"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcShop.tabBarItem.selectedImage =[[UIImage imageNamed:@"Shop-Navigation-active"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self setViewControllers:@[vcHistory,vcShop, vcPayment, vcWallet, vcProfile]];

    NSInteger itemIndex = 2;
    CGFloat itemWidth = self.tabBar.frame.size.width/self.tabBar.items.count;
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(itemWidth * itemIndex, 0, itemWidth, self.tabBar.frame.size.height)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = bgView.bounds;
    gradient.startPoint = CGPointMake(0, 1);
    gradient.endPoint = CGPointMake(1, 0);
    gradient.colors = @[(id)BOTTOM_BAR_GRADIENT_START_COLOR.CGColor, (id)BOTTOM_BAR_GRADIENT_END_COLOR.CGColor];
    [bgView.layer insertSublayer:gradient atIndex:0];
    [[UITabBar appearance] insertSubview:bgView atIndex:0];
    [self setTabbarAppearance];

}

#pragma mark - Public

- (void)publicMethod {}

#pragma mark - Private
-(void)setTabbarAppearance {
    
    //set tabBarController attributes
    
    UIColor *backgroundColor = FOOTER_BG_COLOR;// [UIColor colorWithRed:22.0/255 green:30.0/255 blue:38.0/255 alpha:1.0];
    
    UIColor *selectedColor =  FOOTER_SELECTED; // DEFAULT_BUTTONBACKGROUND_COLOR;
    
    // set the bar background color
    [[UITabBar appearance] setBackgroundImage:[Utility imageFromColor:backgroundColor forSize:CGSizeMake(320, 49) withCornerRadius:0]];
    
    // set the text color for selected state
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:selectedColor, UITextAttributeTextColor, nil] forState:UIControlStateSelected];
    
    // set the text color for unselected state
    
    // set the selected icon color
    [[UITabBar appearance] setTintColor:HEADER_BAR];
    [[UITabBar appearance] setSelectedImageTintColor:HEADER_BAR];
    [[self.tabBar.items objectAtIndex:2] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromRGB(0xFFFFFF), NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [[self.tabBar.items objectAtIndex:2] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromRGB(0xFFFFFF), NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    // remove the shadow
    [[UITabBar appearance] setShadowImage:nil];
    
    
    //set nav color
    [[UINavigationBar appearance] setTintColor:HEADER_BAR_TEXT_COLOR];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

#pragma mark - UITabBarControllerdelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    BaseNavigationController *navController = (BaseNavigationController *)[self selectedViewController];
    [navController popToRootViewControllerAnimated:NO];
    [viewController viewDidAppear:YES];
    
}
#pragma mark -  Call API

#pragma mark -  Web Service
    


@end
