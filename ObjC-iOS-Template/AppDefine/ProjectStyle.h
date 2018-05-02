//
//  ProjectStyle.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 02/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectStyle : NSObject
+(float)getFormattedFontSize:(float)size;
+(CGRect)getFormattedViewSize:(CGRect)frame;
+(CGRect)getProportionalFormattedViewSize:(CGRect)frame;
+(UIImage *)getSolidColorImage:(UIColor *)color;
+(float)getRespectiveFieldHeight;

+(UIView *)getDialPadViewWithFrame:(CGRect)frame
                      onController:(id)controller;
+(UIView *)getDialPadBlackViewWithFrame:(CGRect)frame
                           onController:(id)controller;
+(UIView *)getPINInputViewWithFrame:(CGRect)frame;
+(UISearchBar *)getSearchBarForNavigationBarWithPlaceHolderText:(NSString *)placeHolderText;

@end
