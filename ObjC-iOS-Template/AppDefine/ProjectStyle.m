//
//  ProjectStyle.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 02/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "ProjectStyle.h"

@implementation ProjectStyle

+(float)getFormattedFontSize:(float)size{
    
    if(size <= 10.0){
        return size;
    } else if (size >= 36){
        if (IS_IPHONE_4_OR_LESS_NEW) {
            return size - 8.0;
        }else if (IS_IPHONE_5_NEW){
            return size - 4.0;
        }else if (IS_IPHONE_6_NEW){
            return  size - 2.0;
        }else{
            return size;
        }
    } else {
        if (IS_IPHONE_4_OR_LESS_NEW) {
            return size - 4.0;
        }else if (IS_IPHONE_5_NEW){
            return size - 2.0;
        }else if (IS_IPHONE_6_NEW){
            return  size - 1.0;
        }else{
            return size;
        }
    }
}

+(CGRect)getFormattedViewSize:(CGRect)frame{
    
    
    if (IS_IPHONE_4_OR_LESS_NEW) {
        //less 25% height
        return CGRectMake(frame.origin.x, frame.origin.y - 2.0, frame.size.width, frame.size.height - ((frame.size.height * 20.0) / 100.0));
    }else if (IS_IPHONE_5_NEW){
        //less 15% height
        return CGRectMake(frame.origin.x, frame.origin.y - 1.0, frame.size.width, frame.size.height - ((frame.size.height * 15.0) / 100.0));
    }else if (IS_IPHONE_6_NEW){
        //less 10% height
        return CGRectMake(frame.origin.x, frame.origin.y - 1.0, frame.size.width, frame.size.height - ((frame.size.height * 10.0) / 100.0));
    }else{
        return frame;
    }
    
}

+(CGRect)getProportionalFormattedViewSize:(CGRect)frame{
    
    DebugLog(@"size = %lf, %lf",frame.size.width, frame.size.height);
    float proportionalValue = 0.0;
    if (IS_IPHONE_4_OR_LESS_NEW) {
        //less 40% height
        proportionalValue = ((frame.size.width * 50.0) / 100.0);
        return CGRectMake(frame.origin.x, frame.origin.y - 2.0, frame.size.width - proportionalValue, frame.size.height - proportionalValue);
    }else if (IS_IPHONE_5_NEW){
        //less 20% height
        proportionalValue = ((frame.size.width * 40.0) / 100.0);
        return CGRectMake(frame.origin.x, frame.origin.y - 1.0, frame.size.width - proportionalValue, frame.size.height - proportionalValue);
    }else if (IS_IPHONE_6_NEW){
        //less 10% height
        proportionalValue = ((frame.size.width * 20.0) / 100.0);
        return CGRectMake(frame.origin.x, frame.origin.y - 1.0, frame.size.width - proportionalValue, frame.size.height - proportionalValue);
    }else{
        return frame;
    }
    
}

+(UIImage *)getSolidColorImage:(UIColor *)color{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}

+(float)getRespectiveFieldHeight {
    
    if(IS_IPHONE_4_OR_LESS_NEW){
        return DEFAULT_TEXTFIELD_SIZE_4;
    }else if (IS_IPHONE_5_NEW) {
        return  DEFAULT_TEXTFIELD_SIZE_5;
    }else if (IS_IPHONE_6_NEW){
        return  DEFAULT_TEXTFIELD_SIZE_6;
    }
    return  DEFAULT_TEXTFIELD_SIZE_6P;
}

+(UIView *)getDialPadViewWithFrame:(CGRect)frame
                      onController:(id)controller {
    
    UIView *dialPadView = [[UIView alloc] initWithFrame:frame];
    [dialPadView setBackgroundColor:[UIColor clearColor]];
    [dialPadView setClipsToBounds:YES];
    
    float numberOfRows = 4.0;
    float numberOfColumns = 3.0;
    float marginsX = 20.0;
    float marginsY = 10.0;
    if (IS_IPHONE_6P_NEW) {
        marginsX = 20.0;
        marginsY = 20.0;
    }
    float cellWidth = ((dialPadView.width) - (marginsX * 2.0)) /  numberOfColumns;
    float cellHeight = ((dialPadView.height) - (marginsY * 3.0)) / numberOfRows;
    
    
    float XPoint = 0.0;
    float YPoint = 0.0;
    for (int i = 1; i <= (numberOfColumns * numberOfRows); i++) {
        
        UIButton *cell =  [UIButton buttonWithType:UIButtonTypeCustom];
        [cell setFrame:CGRectMake(XPoint, YPoint, cellWidth, cellHeight)];
        cell.clipsToBounds = YES;
        [cell setTag:i];
        [cell.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [cell addTarget:controller action:@selector(numberPadButtonPressed:) forControlEvents:UIControlEventTouchDown];
        
        if (i == 10) { //if 'i' is "10", add clear all button
            
            [cell setImage:[UIImage imageNamed:@"clear_normal"] forState:UIControlStateNormal];
            [cell setImage:[UIImage imageNamed:@"clear_active"] forState:UIControlStateHighlighted];
            
        }else if (i == 11) { //if 'i' is "11", add a "0" button.
            
            [cell setImage:[UIImage imageNamed:@"pad_0_normal"] forState:UIControlStateNormal];
            [cell setImage:[UIImage imageNamed:@"pad_0_active"] forState:UIControlStateHighlighted];
            
        }else if(i == 12){ // if 'i' is "12", add a "back button".
            
            [cell setImage:[UIImage imageNamed:@"back_normal"] forState:UIControlStateNormal];
            [cell setImage:[UIImage imageNamed:@"back_active"] forState:UIControlStateHighlighted];
            
        }else{
            
            [cell setImage:[UIImage imageNamed:[NSString stringWithFormat:@"pad_%d_normal",i]] forState:UIControlStateNormal];
            [cell setImage:[UIImage imageNamed:[NSString stringWithFormat:@"pad_%d_active",i]] forState:UIControlStateHighlighted];
            
        }
        
        if (i%3 == 0) {
            XPoint = 0.0;
            YPoint += marginsY + cellHeight;
        }else{
            XPoint += marginsX + cellWidth;
            
        }
        
        [dialPadView addSubview:cell];
        
    }// end of loop
    
    
    return dialPadView;
}
+(UIView *)getDialPadBlackViewWithFrame:(CGRect)frame
                           onController:(id)controller {
    UIView *dialPadView = [[UIView alloc] initWithFrame:frame];
    [dialPadView setBackgroundColor:[UIColor clearColor]];
    [dialPadView setClipsToBounds:YES];
    
    float numberOfRows = 4.0;
    float numberOfColumns = 3.0;
    float marginsX = 20.0;
    float marginsY = 10.0;
    if (IS_IPHONE_6P_NEW) {
        marginsX = 20.0;
        marginsY = 20.0;
    }
    float cellWidth = ((dialPadView.width) - (marginsX * 2.0)) /  numberOfColumns;
    float cellHeight = ((dialPadView.height) - (marginsY * 3.0)) / numberOfRows;
    
    
    float XPoint = 0.0;
    float YPoint = 0.0;
    for (int i = 1; i <= (numberOfColumns * numberOfRows); i++) {
        
        UIButton *cell =  [UIButton buttonWithType:UIButtonTypeCustom];
        [cell setFrame:CGRectMake(XPoint, YPoint, cellWidth, cellHeight)];
        cell.clipsToBounds = YES;
        [cell setTag:i];
        [cell.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [cell addTarget:controller action:@selector(numberPadButtonPressed:) forControlEvents:UIControlEventTouchDown];
        
        if (i == 10) { //if 'i' is "10", add clear all button
            
            [cell setImage:[UIImage imageNamed:@"number_delete"] forState:UIControlStateNormal];
            
        }else if (i == 11) { //if 'i' is "11", add a "0" button.
            
            [cell setImage:[UIImage imageNamed:@"number_0"] forState:UIControlStateNormal];
            
        }else if(i == 12){ // if 'i' is "12", add a "back button".
            
            [cell setImage:[UIImage imageNamed:@"number_back"] forState:UIControlStateNormal];
            
        }else{
            
            [cell setImage:[UIImage imageNamed:[NSString stringWithFormat:@"number_%d",i]] forState:UIControlStateNormal];
            
        }
        
        if (i%3 == 0) {
            XPoint = 0.0;
            YPoint += marginsY + cellHeight;
        }else{
            XPoint += marginsX + cellWidth;
            
        }
        
        [dialPadView addSubview:cell];
        
    }// end of loop
    
    
    return dialPadView;
}

+(UIView *)getPINInputViewWithFrame:(CGRect)frame {
    
    UIView *enterPINView = [[UIView alloc] initWithFrame:frame];
    [enterPINView setBackgroundColor:[UIColor clearColor]];
    
    float widthOfPIN = [UIImage imageNamed:@"pin_active"].size.width;
    float heightOfPIN = widthOfPIN;
    float numberOfPINs = 6.0;
    float PINGap = 10.0;
    float XPoint = 0.0;
    float YPoint = 10.0;
    
    [enterPINView setWidth:(widthOfPIN * 6.0) + (PINGap * 5.0)];
    
    for (int i = 0; i < numberOfPINs; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(XPoint, YPoint, widthOfPIN, heightOfPIN)];
        [imageView setContentMode:UIViewContentModeCenter];
        [imageView setImage:[UIImage imageNamed:@"pin_normal"]];
        [imageView setTag:i];
        [imageView setCenterY:enterPINView.height / 2.0];
        
        [enterPINView addSubview:imageView];
        XPoint += widthOfPIN + PINGap;
    }
    
    return enterPINView;
    
}

+(UISearchBar *)getSearchBarForNavigationBarWithPlaceHolderText:(NSString *)placeHolderText {
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    [searchBar sizeToFit];
    [searchBar setSearchBarStyle:UISearchBarStyleDefault];
    [searchBar setBarTintColor:HEADER_BAR];
    [searchBar setTintColor:HEADER_BAR_TEXT_COLOR];
    
    //Customize It
    //Remove Bottom Line
    CGRect rect = searchBar.frame;
    UIView *bottomLineView = [[UIView alloc]initWithFrame:CGRectMake(0, rect.size.height-1.0,rect.size.width, 1.0)];
    bottomLineView.backgroundColor = HEADER_BAR;
    [searchBar addSubview:bottomLineView];
    
    //Remove Top Line
    UIView *topLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0.0,rect.size.width, 1.0)];
    topLineView.backgroundColor = HEADER_BAR;
    [searchBar addSubview:topLineView];
    
    //Change Text Field Appearance
    UITextField *searchField = [searchBar valueForKey:@"searchField"];
    searchField.backgroundColor = HEADER_BAR_TEXT_COLOR;
    searchField.textColor = TEXT_COLOR;
    searchField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeHolderText];
    
    UILabel *placeholderLabel = [searchField valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = SUB_MEDIUM_TEXT_COLOR;
    
    //Update Clear Button color
    UIButton *btnClear = (UIButton*)[searchField valueForKey:@"clearButton"];
    [btnClear setImage:[btnClear.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    btnClear.tintColor = HEADER_BAR;
    
    
    //Update Search Icon Color
    UIImageView *imgView = (UIImageView*)searchField.leftView;
    imgView.image = [imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imgView.tintColor = HEADER_BAR;
    
    //For iOS 11 onwards set its heigght
    if (@available(iOS 11.0, *)) {
        [[searchBar.heightAnchor constraintEqualToConstant:44.0] setActive:YES];
    }
    return searchBar;
}


@end
