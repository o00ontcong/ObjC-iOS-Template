//
//  UIView+UIViewUtils.h
//  LiquidPay
//
//  Created by Liu Zhengqi
//  Copyright (c) 2015 LiquidPay. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIView (UIViewUtils)

+(instancetype)newAutolayout;

-(CGFloat)frameX;
-(CGFloat)frameY;
-(CGFloat)frameCenterX;
-(CGFloat)frameCenterY;
-(CGFloat)frameEndX;
-(CGFloat)frameEndY;
-(CGPoint)setFrameCenterX:(CGFloat)x;
-(CGPoint)setFrameCenterY:(CGFloat)y;
-(CGFloat)frameWidth;
-(CGFloat)frameHeight;
-(CGSize)frameSize;
-(CGFloat)endY;
-(CGRect)setFrameX:(CGFloat)X;
-(CGRect)setFrameY:(CGFloat)Y;
-(CGRect)setFrameWidth:(CGFloat)width;
-(CGRect)setFrameHeight:(CGFloat)height;

-(void)addBorderTop:(CGFloat)size;
-(void)addBorderBottom:(CGFloat)size;
-(void)addBorderLeft:(CGFloat)size;
-(void)addBorderRight:(CGFloat)size;
-(void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
-(void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
-(void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
-(void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;

-(UIView *)addDivider:(CGRect)rect;
-(UIView *)addDivider:(CGRect)rect color:(UIColor *)color;
@end
