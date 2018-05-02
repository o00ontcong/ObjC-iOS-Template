//
//  UIView+UIViewUtils.m
//  LiquidPay
//
//  Created by Liu Zhengqi
//  Copyright (c) 2015 LiquidPay. All rights reserved.
//


#import "UIView+UIViewUtils.h"
#define defBorderColor [UIColor colorWithRed:0.80392156862745098 green:0.80392156862745098 blue:0.80392156862745098 alpha:1]

@implementation UIView (UIViewUtils)

+(instancetype)newAutolayout{
    UIView *view = [self new];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    return view;
}

-(void)updateFrameHeight:(CGFloat)height{
    CGRect temp = self.frame;
    temp.size.height = height;
    self.frame = temp;
}

-(void)addBorderTop:(CGFloat)size{
    CALayer *border = [CALayer layer];
    border.frame = CGRectMake(0, 0, self.frameWidth , size);
    [border setBackgroundColor:defBorderColor.CGColor];
    [self.layer addSublayer:border];
}

-(void)addBorderBottom:(CGFloat)size{
    CALayer *border = [CALayer layer];
    border.frame = CGRectMake(0, self.frameHeight, self.frameWidth , size);
    [border setBackgroundColor:defBorderColor.CGColor];
    [self.layer addSublayer:border];
}

-(void)addBorderLeft:(CGFloat)size{
    CALayer *border = [CALayer layer];
    border.frame = CGRectMake(0, 0, size , self.frameHeight);
    [border setBackgroundColor:defBorderColor.CGColor];
    [self.layer addSublayer:border];
}

-(void)addBorderRight:(CGFloat)size{
    CALayer *border = [CALayer layer];
    border.frame = CGRectMake(self.frameWidth, 0, size , self.frameHeight);
    [border setBackgroundColor:defBorderColor.CGColor];
    [self.layer addSublayer:border];
}

- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

-(CGFloat)frameX{
    return self.frame.origin.x;
}

-(CGFloat)frameCenterX{
    return self.center.x;
}

-(CGFloat)frameCenterY{
    return self.center.y;
}

-(CGRect)setFrameX:(CGFloat)x{
    CGRect temp = self.frame;
    temp.origin.x = x;
    self.frame = temp;
    return self.frame;
}

-(CGRect)setFrameY:(CGFloat)y{
    CGRect temp = self.frame;
    temp.origin.y = y;
    self.frame = temp;
    return self.frame;
}

-(CGPoint)setFrameCenterX:(CGFloat)x
{
    CGPoint temp = self.center;
    temp.x =x;
    self.center = temp;
    return temp;
}
-(CGPoint)setFrameCenterY:(CGFloat)y
{
    CGPoint temp = self.center;
    temp.y =y;
    self.center = temp;
    return temp;
}
-(CGRect)setFrameWidth:(CGFloat)width{
    CGRect temp = self.frame;
    temp.size.width = width;
    self.frame = temp;
    return self.frame;
}

-(CGRect)setFrameHeight:(CGFloat)height{
    CGRect temp = self.frame;
    temp.size.height = height;
    self.frame = temp;
    return self.frame;
}

-(CGFloat)frameY{
    return self.frame.origin.y;
}

-(CGFloat)frameWidth{
    return self.frame.size.width;
}

-(CGFloat)frameHeight{
    return self.frame.size.height;
}

-(CGSize)frameSize{
    return CGSizeMake(self.frameWidth, self.frameHeight);
}

-(CGFloat)endY{
    return self.frameHeight + self.frame.origin.y;
}

-(CGFloat)frameEndX{
    return self.frameWidth + self.frame.origin.x;
}

-(CGFloat)frameEndY{
    return self.frameHeight + self.frame.origin.y;
}

-(UIView *)addDivider:(CGRect)rect{
    UIView *divider = [[UIView alloc] initWithFrame:rect];
    divider.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:divider];
    return divider;
}

-(UIView *)addDivider:(CGRect)rect color:(UIColor *)color{
    UIView *divider = [[UIView alloc] initWithFrame:rect];
    divider.backgroundColor = color;
    [self addSubview:divider];
    return divider;
}
@end
