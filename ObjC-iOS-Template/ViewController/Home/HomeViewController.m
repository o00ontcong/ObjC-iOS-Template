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

    
    //UILabel
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0*SW, 0*SW, 0*SW, 0*SW)];
    label.textColor = TEXT_COLOR;
    label.adjustsFontSizeToFitWidth = YES;
    [label setFont:[Utility fontHelveticaNeueMedium:[ProjectStyle getFormattedFontSize:11]]];
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0;
    [label setText:NSLocalizedString(@"title_my_qrcode", nil)];
    [view addSubview:label];

    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
//    APIManager *manager = [[APIManager alloc] init];

//    [manager call:PATH_OVERVIEW_REPORT
//        setAction:HTTP_METHOD_POST
//          setData:@{@"shopId":@"295778",
//                    @"fromDate":@"05/01/2018",
//                    @"toDate":@"05/03/2018"}
//      setDelegate:self];
    
}
-(void)APIManager:(NSString *)path setAction:(NSString *)action setData:(NSDictionary *)data completed:(NSDictionary *)JSON{
    
}
@end
