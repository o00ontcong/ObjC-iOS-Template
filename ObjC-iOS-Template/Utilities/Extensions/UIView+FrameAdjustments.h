//
//  UIView+FrameAdjustments.h
//  LiquidPaySDK
//  Copyright © 2016 Liquid Pay Pte. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameAdjustments) 

@property (nonatomic, assign) CGFloat x, y, top, bottom, left, right, width, height, centerX, centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, readonly) CGFloat aspect;

@end
