//
//  LeftSliderViewController.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "LeftSliderViewController.h"
#import "LGSideMenuController.h"
#define SIDE_MENU_TABLE_VIEW_SEPERATOR_COLOR [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.2]

#define MENU_OPTION_0 @"Account Information"
#define MENU_OPTION_1 @"History"
#define MENU_OPTION_2 @"Setting"
#define MENU_OPTION_3 @"Contact US"
#define MENU_OPTION_4 @"Logout"

@interface LeftSliderViewController ()<LGSideMenuDelegate, UITableViewDelegate, UITableViewDataSource>{
    UITableView *menuListTableView;
    NSMutableArray *listOptions;

}

@end

@implementation LeftSliderViewController

#pragma mark - Lifecycle
- (void)dealloc {}
- (void)viewDidLoad {
    [super viewDidLoad];
    listOptions = [NSMutableArray new];
    
    [listOptions addObject:MENU_OPTION_0];
    [listOptions addObject:MENU_OPTION_1];
    [listOptions addObject:MENU_OPTION_2];
    [listOptions addObject:MENU_OPTION_3];
    [listOptions addObject:MENU_OPTION_4];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

#pragma mark - Custom Accessors
-(void)configureView{
    [self.view setBackgroundColor:HEADER_BAR];

    //ImageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,47.5*SCALE_W,50*SCALE_W,50*SCALE_W)];
    imageView.centerX = LEFT_SLIDER_VIEW_WIDTH/2;
    UIImage *image = [UIImage imageNamed:@"avatar_placeholder_50x50"];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    imageView.image = image;
    [view addSubview:imageView];
    //UILabel
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, imageView.bottom , LEFT_SLIDER_VIEW_WIDTH - 40, 44*SCALE_W)];
    label.textColor = HEADER_BAR_TEXT_COLOR;
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [label setText:@"CONG NGUYEN"];
    [view addSubview:label];
    
    
    //Then Show Menu Options below
    menuListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, label.bottom + 25.0, LEFT_SLIDER_VIEW_WIDTH, (view.height - (label.bottom + 25.0)))
                                                     style:UITableViewStylePlain];
    [menuListTableView setBackgroundColor:[UIColor clearColor]];
    [menuListTableView setDelegate:self];
    [menuListTableView setDataSource:self];
    [menuListTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [menuListTableView setSeparatorInset:UIEdgeInsetsMake(0.0, -3.0, 0.0, 0.0)];
    [menuListTableView setSeparatorColor:SIDE_MENU_TABLE_VIEW_SEPERATOR_COLOR];
    [menuListTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [view addSubview:menuListTableView];
    
    menuListTableView.scrollEnabled = NO;
    view.scrollEnabled = NO;
}

#pragma mark - IBActions

- (IBAction)submitData:(id)sender {}

#pragma mark - Public

- (void)publicMethod {}

#pragma mark - Private

- (void)privateMethod {}

#pragma mark - TableView

#pragma mark - UITableView Datasources

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [listOptions count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"CellIdentifer-SlideMenu";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [listOptions objectAtIndex:indexPath.row];
    cell.textLabel.textColor = HEADER_BAR_TEXT_COLOR;
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
#pragma mark - UITableView Delegates
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *optionTitle =  [listOptions objectAtIndex:indexPath.row];
    if ([optionTitle isEqualToString:MENU_OPTION_4]){
        [Utility deleteKey:PROJECT_SESSIONKEY];
        [Helper authenticationChange];
    }
}

#pragma mark -  Call API

#pragma mark -  Web Service


@end
