//
//  Utility.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "Utility.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonKeyDerivation.h>
#import <sys/utsname.h>
#import "Reachability.h"
@implementation Utility

+ (UIImage *)setTintColor:(UIColor *)color forImage:(UIImage *)image
{
    UIImage *newImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, newImage.scale);
    [color set];
    [newImage drawInRect:CGRectMake(0, 0, image.size.width, newImage.size.height)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContext(size);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIFont *)primaryFont:(float)_size{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:_size];
}

+(UIFont *)primaryFontBold:(float)_size{
    return [UIFont fontWithName:@"HelveticaNeue" size:_size];
}

+(UIFont *)fontHelveticaNeue:(float)_size{
    //  return [UIFont fontWithName:@"HelveticaNeue" size:_size];
    return [UIFont systemFontOfSize:_size weight:UIFontWeightRegular];
}

+(UIFont *)fontHelveticaNeueMedium:(float)_size{
    // return [UIFont fontWithName:@"HelveticaNeue-Medium" size:_size];
    return [UIFont systemFontOfSize:_size weight:UIFontWeightMedium];
}

+(UIFont *)fontHelveticaNeueLight:(float)_size{
    
    //  return [UIFont fontWithName:@"HelveticaNeue-Light" size:_size];
    return [UIFont systemFontOfSize:_size weight:UIFontWeightLight];
}
+(UIFont *)fontHelveticaNeueSemibold:(float)_size{
    // return [UIFont fontWithName:@"HelveticaNeue-Bold" size:_size];
    return [UIFont systemFontOfSize:_size weight:UIFontWeightSemibold];
}
+(UIFont *)fontHelveticaNeueBold:(float)_size{
    // return [UIFont fontWithName:@"HelveticaNeue-Bold" size:_size];
    return [UIFont systemFontOfSize:_size weight:UIFontWeightBold];
}


+(UIFont *)fontHelveticaNeueThin:(float)_size{
    // return [UIFont fontWithName:@"HelveticaNeue-Thin" size:_size];
    return [UIFont systemFontOfSize:_size weight:UIFontWeightThin];
}

+(UIFont *)fontHelveticaNeueThinItalic:(float)_size{
    return [UIFont italicSystemFontOfSize:_size];
    
    // return [UIFont fontWithName:@"HelveticaNeue-ThinItalic" size:_size];
}

+(UIFont *)fontCalibri:(float)_size{
    return [UIFont fontWithName:@"Calibri" size:_size];
}



+(UIFont *)fontStyleBold:(float)_size{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:_size];
}
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize{
    /* UIGraphicsBeginImageContext( newSize );
     [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
     UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();*/
    @autoreleasepool {
        UIGraphicsBeginImageContextWithOptions(newSize, NO, UIScreen.mainScreen.scale);
        [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
    }
    
}

+(char)convertToChar:(BOOL)boolean{
    return (boolean)?[@'Y' charValue]:[@'N' charValue];
}

+(void)alert:(NSString *)title setMessage:(NSString *)message {
    [self alert:title setMessage:message cancenButtonTitle:NSLocalizedString(@"btn_ok",nil)];
}


+(void)alert:(NSString *)title setMessage:(NSString *)message cancenButtonTitle:(NSString *)cancelTitle{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelTitle otherButtonTitles: nil];
    
    [alert show];
    
    
}

+(UIAlertController *)alertC:(NSString *)title Message:(NSString *)message cancelTitle:(NSString *)cancelTitle
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okayAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okayAction];
    
    return alertController;
}

+(UIAlertController *)alertC:(NSString *)title Message:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okayAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"btn_ok", nil) style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okayAction];
    
    return alertController;
    
    
}

+(BOOL)checkAuthentication{
    return [self checkKeyIdentifier:@"SESSIONKEY"];
}

+(BOOL)checkKeyIdentifier:(NSString *)identifier{
    return [[UYLPasswordManager sharedInstance] validKey:nil forIdentifier:identifier];
}

+(BOOL)registerKey:(NSString *)identifier withValue:(NSString *)value{
    value = [self parseString:value];
    [[UYLPasswordManager sharedInstance] registerKey:value forIdentifier:identifier];
    return YES;
}

+(void)registerSessionTimeStamp{
    
    NSDate *sessionTimeStamp = [NSDate date];
    [[NSUserDefaults standardUserDefaults] setObject:sessionTimeStamp forKey:@"SessionTimeStamp"];
}

+(void)removeSessionTimeStamp{
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"SessionTimeStamp"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+(BOOL)isSessionExpired{
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"SessionTimeStamp"] == nil)
        return NO;
    
    NSDate *sessionTimeStamp = [[NSUserDefaults standardUserDefaults] objectForKey:@"SessionTimeStamp"];
    NSDate *currentTimeStamp = [NSDate date];
    
    NSTimeInterval timeDifference = [currentTimeStamp timeIntervalSinceDate:sessionTimeStamp];
    if(timeDifference <SESSIONTIMEOUTINTERVAL30)
    {
        return NO;
    }
    [Utility removeSessionTimeStamp];
    return YES;
}

+(BOOL)isAccountActivated
{
    BOOL isActivate = NO;
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"AccountActivate"] == nil)
        return isActivate;
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"AccountActivate"])
        isActivate = YES;
    
    
    return isActivate;
}

+(void)setAccountActivate:(BOOL)isActivate
{
    [[NSUserDefaults standardUserDefaults] setBool:isActivate forKey:@"AccountActivate"];
}

+(void)deleteAccountActivate
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"AccountActivate"];
    
}

+(BOOL)isAllowTransfer
{
    BOOL isAllowed = NO;
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"AllowTransfer"] == nil)
        return isAllowed;
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"AllowTransfer"])
        isAllowed = YES;
    
    
    return isAllowed;
}

+(void)setAllowTransfer:(BOOL)isAllowed
{
    [[NSUserDefaults standardUserDefaults] setBool:isAllowed forKey:@"AllowTransfer"];
}

+(void)deleteAllowTransfer
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"AllowTransfer"];
    
}


+(NSString*) getDeviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}

+(NSString *)getDeviceOSVersion
{
    return [NSString stringWithFormat:@"%@ %@", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
}

+(NSString *)getDeviceID{
    
    NSString *strDeviceID = [[NSUserDefaults standardUserDefaults] valueForKey:@"LQD_DEVICETOKEN"];
    if(!strDeviceID)
        strDeviceID = @"";
    
    return strDeviceID;
}
+(BOOL)deleteKey:(NSString *)identifier{
    [[UYLPasswordManager sharedInstance] deleteKeyForIdentifier:identifier];
    return YES;
}

+(NSString *)getKeyValue:(NSString *)identifier{
    return [[UYLPasswordManager sharedInstance] keyForIdentifier:identifier];
}
+(UILabel*)createTitleLabelWithText: (NSString*)titleText andFrame:(CGRect)frame andTag:(NSInteger)tag andView:(UIView *)view{
    CGFloat lblFontSize = 15.0f;
    UILabel * lbl = [[UILabel alloc] initWithFrame: frame];
    lbl.text = titleText;
    lbl.textColor =  [UIColor blackColor];
    lbl.font = [Utility fontHelveticaNeueMedium:lblFontSize];
    lbl.tag = tag;
    [view addSubview:lbl];
    return lbl;
}

+(void)addTextFieldBorderEdgeLine:(UITextField*)txtField andRectEdge:(UIRectEdge)edge andColor:(UIColor *)color andThickness:(CGFloat)thickness{
    
    CALayer *border = [CALayer layer];
    
    switch (edge) {
        case UIRectEdgeTop:
            border.frame = CGRectMake(0, 0, CGRectGetWidth(txtField.frame), thickness);
            break;
        case UIRectEdgeBottom:
            border.frame = CGRectMake(0, CGRectGetHeight(txtField.frame) - thickness, CGRectGetWidth(txtField.frame), thickness);
            break;
        case UIRectEdgeLeft:
            border.frame = CGRectMake(0, 0, thickness, CGRectGetHeight(txtField.frame));
            break;
        case UIRectEdgeRight:
            border.frame = CGRectMake(CGRectGetWidth(txtField.frame) - thickness, 0, thickness, CGRectGetHeight(txtField.frame));
            break;
        case UIRectEdgeAll:
            break;
        case UIRectEdgeNone:
        default:
            return;
            break;
    }
    
    border.backgroundColor = color.CGColor;
    
    [txtField.layer addSublayer:border];
    
}

+(void)addLabelBorderEdgeLine:(UILabel*)label andRectEdge:(UIRectEdge)edge andColor:(UIColor *)color andThickness:(CGFloat)thickness{
    
    CALayer *border = [CALayer layer];
    switch (edge) {
        case UIRectEdgeTop:
            border.frame = CGRectMake(0, 0, CGRectGetWidth(label.frame), thickness);
            break;
        case UIRectEdgeBottom:
            border.frame = CGRectMake(0, CGRectGetHeight(label.frame) - thickness, CGRectGetWidth(label.frame), thickness);
            break;
        case UIRectEdgeLeft:
            border.frame = CGRectMake(0, 0, thickness, CGRectGetHeight(label.frame));
            break;
        case UIRectEdgeRight:
            border.frame = CGRectMake(CGRectGetWidth(label.frame) - thickness, 0, thickness, CGRectGetHeight(label.frame));
            break;
        case UIRectEdgeAll:
            break;
        case UIRectEdgeNone:
        default:
            return;
            break;
    }
    border.backgroundColor = color.CGColor;
    [label.layer addSublayer:border];
    
}

+ (void)drawDashedBorderAroundView:(UIView *)v borderColor:(UIColor *)color thickness:(CGFloat)thickness dashWidth:(CGFloat)width
{
    //border definitions
    CGFloat cornerRadius = v.layer.cornerRadius;
    CGFloat borderWidth = thickness;
    NSInteger dashPattern1 = width;
    NSInteger dashPattern2 = width;
    UIColor *lineColor = color;
    
    //drawing
    CGRect frame = v.bounds;
    
    CAShapeLayer *_shapeLayer = [CAShapeLayer layer];
    
    //creating a path
    CGMutablePathRef path = CGPathCreateMutable();
    
    //drawing a border around a view
    CGPathMoveToPoint(path, NULL, 0, frame.size.height - cornerRadius);
    CGPathAddLineToPoint(path, NULL, 0, cornerRadius);
    CGPathAddArc(path, NULL, cornerRadius, cornerRadius, cornerRadius, M_PI, -M_PI_2, NO);
    CGPathAddLineToPoint(path, NULL, frame.size.width - cornerRadius, 0);
    CGPathAddArc(path, NULL, frame.size.width - cornerRadius, cornerRadius, cornerRadius, -M_PI_2, 0, NO);
    CGPathAddLineToPoint(path, NULL, frame.size.width, frame.size.height - cornerRadius);
    CGPathAddArc(path, NULL, frame.size.width - cornerRadius, frame.size.height - cornerRadius, cornerRadius, 0, M_PI_2, NO);
    CGPathAddLineToPoint(path, NULL, cornerRadius, frame.size.height);
    CGPathAddArc(path, NULL, cornerRadius, frame.size.height - cornerRadius, cornerRadius, M_PI_2, M_PI, NO);
    
    //path is set as the _shapeLayer object's path
    _shapeLayer.path = path;
    CGPathRelease(path);
    
    _shapeLayer.backgroundColor = [[UIColor clearColor] CGColor];
    _shapeLayer.frame = frame;
    _shapeLayer.masksToBounds = NO;
    [_shapeLayer setValue:[NSNumber numberWithBool:NO] forKey:@"isCircle"];
    _shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    _shapeLayer.strokeColor = [lineColor CGColor];
    _shapeLayer.lineWidth = borderWidth;
    _shapeLayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInteger:dashPattern1], [NSNumber numberWithInteger:dashPattern2], nil];
    _shapeLayer.lineCap = kCALineCapRound;
    
    //_shapeLayer is added as a sublayer of the view, the border is visible
    [v.layer addSublayer:_shapeLayer];
    
}

+(NSString *)getAmountWithoutDecimalPoint:(NSString *)strAmount
{
    if (strAmount == nil || strAmount == NULL || [strAmount isEqual:@""] || [strAmount isEqual:@"<null>"] || [strAmount isEqual:@"null"] || [strAmount isEqual:@"(null)"] || (NSNull *)strAmount == [NSNull null]) {
        strAmount = @"0";
    }
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:0];
    
    NSString *formattedAmtBalance = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[strAmount doubleValue]]];
    return formattedAmtBalance;
    
}

+(NSString *)getAmountString:(NSString *)strAmount{
    if (strAmount == nil || strAmount == NULL || [strAmount isEqual:@""] || [strAmount isEqual:@"<null>"] || [strAmount isEqual:@"null"] || [strAmount isEqual:@"(null)"] || (NSNull *)strAmount == [NSNull null]) {
        strAmount = @"0";
    }
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:2];
    [numberFormatter setMinimumFractionDigits:2];
    
    NSString *formattedAmtBalance = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[strAmount doubleValue]]];
    return formattedAmtBalance;
}

+(double)getAmtDoubleFromString:(NSString *)strAmt{
    double dAmount;
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:2];
    [numberFormatter setMinimumFractionDigits:2];
    [numberFormatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    
    dAmount = [[numberFormatter numberFromString:strAmt] doubleValue];
    return dAmount;
}

+(NSString *)getDecimalSymbol{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    return [formatter decimalSeparator];
}


+(BOOL)isBalanceGreaterOrEqual:(double)dBalance toAmount:(double)dAmt
{
    dBalance = [self getAmtDoubleFromString:[self getAmtFormattedStrFromDouble:dBalance]];
    dAmt = [self getAmtDoubleFromString:[self getAmtFormattedStrFromDouble:dAmt]];
    
    if(dBalance >=dAmt)
        return YES;
    else
        return NO;
}

+(BOOL)isBalanceGreaterOrEqual:(NSString *)strBalance withAmount:(NSString *)strAmt
{
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:2];
    [numberFormatter setMinimumFractionDigits:2];
    
    NSNumber *numberBalance = [numberFormatter numberFromString:strBalance];
    NSNumber *numberAmount = [numberFormatter numberFromString:strAmt];
    
    if([numberBalance compare:numberAmount] == NSOrderedSame){
        DebugLog(@"NSOrderedSame");
        return YES;
    }
    else if([numberBalance compare:numberAmount] == NSOrderedDescending)
    {
        DebugLog(@"NSOrderedDescending");
        return YES;
    }
    else if([numberBalance compare:numberAmount] == NSOrderedAscending)
    {
        DebugLog(@"NSOrderedAscending");
        return NO;
    }
    
    return NO;
}


+(NSString *)getAmtFormattedStrFromDouble:(double)dAmount{
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:2];
    [numberFormatter setMinimumFractionDigits:2];
    [numberFormatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    NSString *formattedAmtBalance = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:dAmount]];
    return formattedAmtBalance;
}

+(NSString *)getAmtFormattedStrFromString:(NSString *)strAmount{
    
    if (strAmount == nil || strAmount == NULL || [strAmount isEqual:@""] || [strAmount isEqual:@"<null>"] || [strAmount isEqual:@"null"] || [strAmount isEqual:@"(null)"] || (NSNull *)strAmount == [NSNull null]) {
        strAmount = @"0";
    }
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:2];
    [numberFormatter setMinimumFractionDigits:2];
    [numberFormatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    
    NSNumber *numberAmount =[numberFormatter numberFromString:strAmount];
    return [numberFormatter stringFromNumber:numberAmount];
}


+(float)getFloatValue:(id)inValue
{
    float retVal = 0.0f;
    if(inValue == (id)[NSNull null]){
        DebugLog(@"null");
        retVal = 0.0f;
    }
    if([inValue isKindOfClass:[NSString class]]){
        DebugLog(@"NSString");
        
        retVal = [inValue floatValue];
    }
    else if([inValue isKindOfClass:[NSNumber class]]){
        DebugLog(@"NSNumber");
        retVal = [inValue floatValue];
    }
    
    DebugLog(@"retVal : %.2f", retVal);
    return retVal;
    
}

+(NSString *)getFloatStringwith2decimals:(id)inValue
{
    return [NSString stringWithFormat:@"%.02f", [self getFloatValue:inValue]];
}

+(NSString *)getiOSversion{
    NSString *strOSVersion;
    
    
    return strOSVersion;
}

+(NSString *)getiPhoneModel{
    NSString *striPhoneModel;
    
    
    return striPhoneModel;
}

//getting timezone offset for UTC/GMT, return float value
+(float)getDeviceUTCOffset{
    //"2015-06-26T08:18:57+00:00"
    NSDate * currentDate = [NSDate date];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"Z"];
    [dateFormatter1 setTimeZone:[NSTimeZone systemTimeZone]];
    
    //  NSString *strDateTime = [dateFormatter1 stringFromDate:currentDate];
    //  NSArray *arratTimezone = [NSTimeZone knownTimeZoneNames];
    // DebugLog(@"arratTimezone:%@", arratTimezone);
    
    [dateFormatter1 setDateFormat:@"Z"];
    NSString *strTry = [dateFormatter1 stringFromDate:currentDate];
    DebugLog(@"strTry : %@",strTry);
    
    [dateFormatter1 setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Singapore"]];
    NSString *strTry1 = [dateFormatter1 stringFromDate:currentDate];
    DebugLog(@"Asia/Singapore : %@",strTry1);
    
    [dateFormatter1 setTimeZone:[NSTimeZone timeZoneWithName:@"America/New_York"]];
    NSString *strTry2 = [dateFormatter1 stringFromDate:currentDate];
    DebugLog(@"America/New_York : %@",strTry2);
    
    [dateFormatter1 setTimeZone:[NSTimeZone timeZoneWithName:@"Europe/London"]];
    strTry2 = [dateFormatter1 stringFromDate:currentDate];
    DebugLog(@"Europe/London : %@",strTry2);
    
    [dateFormatter1 setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Kathmandu"]];
    strTry2 = [dateFormatter1 stringFromDate:currentDate];
    DebugLog(@"Asia/Kathmandu : %@",strTry2);
    
    [dateFormatter1 setTimeZone:[NSTimeZone timeZoneWithName:@"Pacific/Chatham"]];
    strTry2 = [dateFormatter1 stringFromDate:currentDate];
    DebugLog(@"Pacific/Chatham : %@",strTry2);
    
    [dateFormatter1 setTimeZone:[NSTimeZone timeZoneWithName:@"Australia/Lord_Howe"]];
    strTry2 = [dateFormatter1 stringFromDate:currentDate];
    DebugLog(@"Australia/Lord_Howe : %@",strTry2);
    
    NSString *dateDescStr = [currentDate descriptionWithLocale:[NSLocale systemLocale]];
    
    DebugLog(@"dateDescStr : %@",dateDescStr);
    DebugLog(@"currentDate : %@",currentDate);
    
    NSDate *sourceDate = currentDate;
    NSTimeZone* destinationTimeZone = [NSTimeZone systemTimeZone];
    float timeZoneOffset = [destinationTimeZone secondsFromGMTForDate:currentDate] / 3600.0;
    float timeZoneOffset2 = [[NSTimeZone localTimeZone] secondsFromGMT] / 3600.0;
    DebugLog(@"sourceDate=%@ timeZoneOffset=%f, timezone2=%f", sourceDate, timeZoneOffset,timeZoneOffset2);
    
    DebugLog(@"timezone%@:%f", @"Pacific/Chatham", ([[NSTimeZone timeZoneWithName:@"Pacific/Chatham"] secondsFromGMT])/3600.0);
    
    return [[NSTimeZone localTimeZone] secondsFromGMT] / 3600.0;
    
}

+(NSString *)getDeviceDateTimeFROMUTC:(NSString *)inDateTime{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    //    NSDate *myDate = [dateFormatter dateFromString:inDateTime];
    [dateFormatter setLocale:[NSLocale systemLocale]];
    //   NSDate *myDate2 = [dateFormatter dateFromString:inDateTime];
    
    //   NSString *dateDescStr = [myDate descriptionWithLocale:[NSLocale systemLocale]];
    
    NSString *dateFormat = @"yyyy-mm-dd'T'HH:mm:ssZ";
    
    NSTimeZone *inputTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
    [inputDateFormatter setTimeZone:inputTimeZone];
    [inputDateFormatter setDateFormat:dateFormat];
    
    NSString *dateFormat1 = @"yyyy-mm-dd hh:mm:ss a";
    
    NSDate *date = [inputDateFormatter dateFromString:inDateTime];
    NSTimeZone *outputTimeZone = [NSTimeZone localTimeZone];
    NSDateFormatter *outputDateFormatter = [[NSDateFormatter alloc] init];
    [outputDateFormatter setTimeZone:outputTimeZone];
    [outputDateFormatter setDateFormat:dateFormat1];
    NSString *outputString = [outputDateFormatter stringFromDate:date];
    
    
    return outputString;
}

+(NSString *)getLocalizedDeviceDateFROMUTC:(NSString *)inDateTime andDateFormate:(NSString *)inDateFormat{
    
    
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    NSTimeZone *inputTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
    [inputDateFormatter setTimeZone:inputTimeZone];
    [inputDateFormatter setDateFormat:dateFormat];
    [inputDateFormatter setLocale:[NSLocale systemLocale]];
    
    NSDate *date = [inputDateFormatter dateFromString:inDateTime];
    NSTimeZone *outputTimeZone = [NSTimeZone localTimeZone];
    NSDateFormatter *outputDateFormatter = [[NSDateFormatter alloc] init];
    [outputDateFormatter setTimeZone:outputTimeZone];
    [outputDateFormatter setDateFormat:inDateFormat];
    
    [outputDateFormatter setLocale:[NSLocale currentLocale]];
    [outputDateFormatter setDateStyle:NSDateFormatterLongStyle];
    
    NSString *outputString = [outputDateFormatter stringFromDate:date];
    
    
    return outputString;
}

+(NSString *)getShortLocalizedDeviceDateFROMUTC:(NSString *)inDateTime andDateFormate:(NSString *)inDateFormat{
    
    
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    NSTimeZone *inputTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
    [inputDateFormatter setTimeZone:inputTimeZone];
    [inputDateFormatter setDateFormat:dateFormat];
    [inputDateFormatter setLocale:[NSLocale systemLocale]];
    
    NSDate *date = [inputDateFormatter dateFromString:inDateTime];
    NSTimeZone *outputTimeZone = [NSTimeZone localTimeZone];
    NSDateFormatter *outputDateFormatter = [[NSDateFormatter alloc] init];
    [outputDateFormatter setTimeZone:outputTimeZone];
    [outputDateFormatter setDateFormat:inDateFormat];
    
    [outputDateFormatter setLocale:[NSLocale currentLocale]];
    //  [outputDateFormatter setDateStyle:kCFDateFormatterShortStyle];
    
    NSString *outputString = [outputDateFormatter stringFromDate:date];
    
    
    return outputString;
}



+(NSString *)getLocalizedDeviceDateFROMUTC:(NSString *)inDateTime WithInputFormat:(NSString *)inputFormate andOutputFormate:(NSString *)inDateFormat{
    
    NSString *dateFormat = inputFormate;
    NSTimeZone *inputTimeZone = [NSTimeZone localTimeZone];
    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
    [inputDateFormatter setTimeZone:inputTimeZone];
    [inputDateFormatter setDateFormat:dateFormat];
    [inputDateFormatter setLocale:[NSLocale systemLocale]];
    
    NSDate *date = [inputDateFormatter dateFromString:inDateTime];
    NSTimeZone *outputTimeZone = [NSTimeZone localTimeZone];
    NSDateFormatter *outputDateFormatter = [[NSDateFormatter alloc] init];
    [outputDateFormatter setTimeZone:outputTimeZone];
    [outputDateFormatter setDateFormat:inDateFormat];
    [outputDateFormatter setLocale:[NSLocale currentLocale]];
    
    NSString *outputString = [outputDateFormatter stringFromDate:date];
    
    return outputString;
}

+(NSString *)getDeviceDateFROMUTC:(NSString *)inDateTime andDateFormate:(NSString *)inDateFormat{
    
    
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    NSTimeZone *inputTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
    [inputDateFormatter setTimeZone:inputTimeZone];
    [inputDateFormatter setDateFormat:dateFormat];
    
    NSDate *date = [inputDateFormatter dateFromString:inDateTime];
    NSTimeZone *outputTimeZone = [NSTimeZone localTimeZone];
    NSDateFormatter *outputDateFormatter = [[NSDateFormatter alloc] init];
    [outputDateFormatter setTimeZone:outputTimeZone];
    [outputDateFormatter setDateFormat:inDateFormat];
    NSString *outputString = [outputDateFormatter stringFromDate:date];
    
    
    return outputString;
}

+(NSString *)getDeviceTimeFROMUTC:(NSString *)inDateTime andTimeFormate:(NSString *)inTimeFormat{
    
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    NSTimeZone *inputTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
    [inputDateFormatter setTimeZone:inputTimeZone];
    [inputDateFormatter setDateFormat:dateFormat];
    NSDate *date = [inputDateFormatter dateFromString:inDateTime];
    
    //  NSString *dateFormat1 = @"hh:mm:ss a";
    
    NSTimeZone *outputTimeZone = [NSTimeZone localTimeZone];
    NSDateFormatter *outputDateFormatter = [[NSDateFormatter alloc] init];
    [outputDateFormatter setTimeZone:outputTimeZone];
    [outputDateFormatter setDateFormat:inTimeFormat];
    NSString *outputString = [outputDateFormatter stringFromDate:date];
    
    
    return outputString;
}

+(NSDate *)getDateFromString:(NSString *)inDateTime
{
    
    
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    NSTimeZone *inputTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
    [inputDateFormatter setTimeZone:inputTimeZone];
    [inputDateFormatter setDateFormat:dateFormat];
    
    NSDate *date = [inputDateFormatter dateFromString:inDateTime];
    return date;
    
}

//getting timezone offset for UTC/GMT in "GMT+-HHMM" format string
+(NSString *)getDeviceUTCOffsetString{
    //  NSArray *arratTimezone = [NSTimeZone knownTimeZoneNames];
    // DebugLog(@"arratTimezone:%@", arratTimezone);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"Z"];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    return [dateFormatter stringFromDate:[NSDate date]];
    
}


+(NSString *)getCardColor:(NSInteger)intCard{
    NSString *colorCard;
    switch (intCard) {
        case 0:
            colorCard = CARD_COLOR_0;
            break;
        case 1:
            colorCard = CARD_COLOR_1;
            break;
        case 2:
            colorCard = CARD_COLOR_2;
            break;
        case 3:
            colorCard = CARD_COLOR_3;
            break;
        case 4:
            colorCard = CARD_COLOR_4;
            break;
        case 5:
            colorCard = CARD_COLOR_5;
            break;
        case 6:
            colorCard = CARD_COLOR_6;
            break;
        case 7:
            colorCard = CARD_COLOR_7;
            break;
        case 8:
            colorCard = CARD_COLOR_8;
            break;
        case 9:
            colorCard = CARD_COLOR_9;
            break;
        case 10:
            colorCard = CARD_COLOR_10;
            break;
        case 11:
            colorCard = CARD_COLOR_11;
            break;
        default:
            colorCard = CARD_COLOR_11;
            break;
    }
    return colorCard;
}

+(NSInteger)getCardColorInt:(NSString *)strColorCode{
    //UIColor *colorCard;
    NSInteger colorCardInt;
    if([strColorCode isEqualToString:CARD_COLOR_0]){
        colorCardInt = 0;
    }
    else if([strColorCode isEqualToString:CARD_COLOR_1]){
        colorCardInt = 1;
    }
    else if([strColorCode isEqualToString:CARD_COLOR_2]){
        colorCardInt = 2;
    }
    else if([strColorCode isEqualToString:CARD_COLOR_3]){
        colorCardInt = 3;
    }
    else if([strColorCode isEqualToString:CARD_COLOR_4]){
        colorCardInt = 4;
    }
    else if([strColorCode isEqualToString:CARD_COLOR_5]){
        colorCardInt = 5;
    }
    else if([strColorCode isEqualToString:CARD_COLOR_6]){
        colorCardInt = 6;
    }
    else if([strColorCode isEqualToString:CARD_COLOR_7]){
        colorCardInt = 7;
    }
    else if([strColorCode isEqualToString:CARD_COLOR_8]){
        colorCardInt = 8;
    }
    else if([strColorCode isEqualToString:CARD_COLOR_9]){
        colorCardInt = 9;
    }
    else if([strColorCode isEqualToString:CARD_COLOR_10]){
        colorCardInt = 10;
    }
    else if([strColorCode isEqualToString:CARD_COLOR_11]){
        colorCardInt = 11;
    }
    else {
        colorCardInt = 11;
    }
    return colorCardInt;
}


+(UIColor *)getCardColor1:(NSString *)strColorCode{
    UIColor *colorCard;
    if([strColorCode isEqualToString:CARD_COLOR_0]){
        colorCard = UIColorFromRGB(Aqua_0);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_1]){
        colorCard = UIColorFromRGB(GreyDaVinci_0);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_2]){
        colorCard = UIColorFromRGB(RedLexie_0);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_3]){
        colorCard = UIColorFromRGB(OrangeDawn_0);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_4]){
        colorCard = UIColorFromRGB(PurpleTzeMin_0);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_5]){
        colorCard = UIColorFromRGB(GreenKelvin_0);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_6]){
        colorCard = UIColorFromRGB(PinkMay_0);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_7]){
        colorCard = UIColorFromRGB(WhiteErnest_0);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_8]){
        colorCard = UIColorFromRGB(RomanceBernard_0);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_9]){
        colorCard = UIColorFromRGB(RedScarlet_0);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_10]){
        colorCard = UIColorFromRGB(BlackJT_0);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_11]){
        colorCard = UIColorFromRGB(Mint_0);
    }
    else {
        colorCard = UIColorFromRGB(Mint_0);
    }
    return colorCard;
}

+(UIColor *)getCardColor2:(NSString *)strColorCode{
    UIColor *colorCard;
    if([strColorCode isEqualToString:CARD_COLOR_0]){
        colorCard = UIColorFromRGB(Aqua_1);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_1]){
        colorCard = UIColorFromRGB(GreyDaVinci_1);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_2]){
        colorCard = UIColorFromRGB(RedLexie_1);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_3]){
        colorCard = UIColorFromRGB(OrangeDawn_1);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_4]){
        colorCard = UIColorFromRGB(PurpleTzeMin_1);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_5]){
        colorCard = UIColorFromRGB(GreenKelvin_1);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_6]){
        colorCard = UIColorFromRGB(PinkMay_1);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_7]){
        colorCard = UIColorFromRGB(WhiteErnest_1);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_8]){
        colorCard = UIColorFromRGB(RomanceBernard_1);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_9]){
        colorCard = UIColorFromRGB(RedScarlet_1);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_10]){
        colorCard = UIColorFromRGB(BlackJT_1);
    }
    else if([strColorCode isEqualToString:CARD_COLOR_11]){
        colorCard = UIColorFromRGB(Mint_1);
    }
    else {
        colorCard = UIColorFromRGB(Mint_1);
    }
    return colorCard;
}


+ (void)setGradientcolor:(NSString *) gradientcolor toView:(UIView *)inView{
    
    UIColor* startColor = [Utility getCardColor1:gradientcolor];
    UIColor* endColor = [Utility getCardColor2:gradientcolor];
    
    UIView *pView = inView;
    CGColorRef clr1 = [startColor CGColor];
    CGColorRef clr2 = [endColor CGColor];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    [gradient setValue:@"1" forKey:kGradientLayerKey];
    
    //   pView.bounds = pView.bounds;
    gradient.frame = pView.bounds;
    gradient.cornerRadius=pView.layer.cornerRadius;
    gradient.startPoint = CGPointMake(0.0, 0.0);
    gradient.endPoint = CGPointMake(1.0, 1.0);
    gradient.colors = [NSArray arrayWithObjects: (__bridge id)clr1, (__bridge id)clr2,nil];
    
    CALayer *pGradientLayer = nil;
    NSArray *ar = pView.layer.sublayers;
    for (CALayer *pLayer in ar) {
        if ([pLayer valueForKey:kGradientLayerKey]) {
            pGradientLayer = pLayer;
            break;
        }
    }
    if (!pGradientLayer) [pView.layer insertSublayer:gradient atIndex:0];
    else [pView.layer replaceSublayer:pGradientLayer with:gradient];
    
    pView.backgroundColor = nil; //free memory !
    startColor = nil;
    endColor = nil;
    
}

+(NSString *)getCardBrandImageFileName:(NSString *)cardBrand
{
    NSInteger intCardBrand = [cardBrand integerValue];
    NSString *retImageName = @"image";
    switch (intCardBrand) {
            
        case 2:
            retImageName = [retImageName stringByAppendingString:@"JCB"];
            break;
        case 3:
            retImageName = [retImageName stringByAppendingString:@"AMEX"];
            break;
        case 4:
            retImageName = [retImageName stringByAppendingString:@"VISA"];
            break;
        case 5:
            retImageName = [retImageName stringByAppendingString:@"MASTERCARD"];
            break;
        case 6:
            retImageName = [retImageName stringByAppendingString:@"DISCOVER"];
            break;
        case 7:
            retImageName = [retImageName stringByAppendingString:@"UnionPay"];
            break;
        case 8:
            retImageName = [retImageName stringByAppendingString:@"MAESTRO"];
            break;
        case 11:
            retImageName = [retImageName stringByAppendingString:@"Diners"];
            break;
        default:
            retImageName = [retImageName stringByAppendingString:@""];
            //   retImageName = [retImageName stringByAppendingString:@"OTHERS"];
            
            break;
    }
    
    return retImageName;
    
}

+(CGRect)labelWidthFromText: (UILabel *)label{
    return [label.text boundingRectWithSize:label.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:label.font} context:nil];
}

+(NSString*)sha256HashFor:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    
    
    return ret;
}
+(NSString*)sha512HashFor:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA512_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    
    
    
    
    return ret;
}
+(BOOL)isWalletFirstTab{
    BOOL isFirstTab = YES;
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"cardCount"]  >0){
        isFirstTab = NO;
    }
    return isFirstTab;
}

+(void)setAccBalance:(NSString *)strBalance
{
    [[NSUserDefaults standardUserDefaults] setValue:strBalance forKey:@"accBalance"];
    
    float amount = [strBalance floatValue];
    
    NSUserDefaults *usrDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.liquid.app"];
    [usrDefault setFloat:amount forKey:@"LQDMBR_BALANCE"];
    [usrDefault synchronize];
    
    DebugLog(@"LQDMBR_BALANCE : %f",[usrDefault floatForKey:@"LQDMBR_BALANCE"]);
    
    
}

+(CAShapeLayer *)drawShapeWithArray:(NSArray *)pointArray{
    UIBezierPath* path = [UIBezierPath bezierPath];
    for (int i=0; i<[pointArray count]; i++) {
        CGPoint point = CGPointFromString(pointArray[i]);
        if (i==0)
            [path moveToPoint:point];
        else
            [path addLineToPoint:point];
        if (i == [pointArray count]-1)
            [path closePath];
    }
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    [maskLayer setPath:path.CGPath];
    return maskLayer;
}

+ (NSMutableAttributedString *)styleSalePriceLabel:(NSString *)salePrice withFont:(UIFont *)font rangeSmallerText:(NSRange)range
{
    NSMutableAttributedString *stylizedPriceLabel = [[NSMutableAttributedString alloc] initWithString:salePrice];
    UIFont *smallFont = [UIFont fontWithName:font.fontName size:(font.pointSize / 2)];
    NSNumber *offsetAmount = @(font.capHeight - smallFont.capHeight);
    [stylizedPriceLabel addAttribute:NSFontAttributeName value:smallFont range:range];
    [stylizedPriceLabel addAttribute:NSBaselineOffsetAttributeName value:offsetAmount range:range];
    return stylizedPriceLabel;
}

#pragma mark - store local data


+(NSData *)getCardData{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"LQDCARDDATA"];
}
//store all JSON response
+(void)storeCardData:(NSData *)inDataWebResponse{
    [[NSUserDefaults standardUserDefaults] setObject:inDataWebResponse forKey:@"LQDCARDDATA"];
}

+(BOOL)isCardDataUpdated:(NSData *)inDataWebResponse{
    BOOL isUpdated = YES;
    NSData *cardData = [self getCardData];
    if(cardData != nil){
        isUpdated = ![inDataWebResponse isEqualToData:cardData];
    }
    
    return isUpdated;
}


+(NSData *)getPurseData{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"LQDPURSEDATA"];
}

+(void)storePurseData:(NSData *)inDataWebResponse{
    [[NSUserDefaults standardUserDefaults] setObject:inDataWebResponse forKey:@"LQDPURSEDATA"];
}

+(BOOL)isPurseDataUpdated:(NSData *)inDataWebResponse{
    BOOL isUpdated = YES;
    NSData *purseData = [self getPurseData];
    if(purseData != nil){
        isUpdated = ![inDataWebResponse isEqualToData:purseData];
        
    }
    
    return isUpdated;
}

+(NSMutableArray *)sortArray:(NSMutableArray *)array withKey:(NSString *)keyName andSortingType:(LiquidPaySortStyle)sortStyle andAscending:(BOOL)isAscending{
    
    NSSortDescriptor *aSortDescriptor;
    if(sortStyle == LiquidPaySortStyleString){
        
        aSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:keyName ascending:isAscending selector:@selector(caseInsensitiveCompare:)];
        
    }else if (sortStyle == LiquidPaySortStyleNumber){
        
        aSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:keyName ascending:isAscending comparator:^(id obj1, id obj2) {
            
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
    }else if(sortStyle == LiquidPaySortStyleFloat){
        
        aSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:keyName ascending:isAscending comparator:^(id obj1, id obj2) {
            
            if ([obj1 doubleValue] > [obj2 doubleValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            if ([obj1 doubleValue] < [obj2 doubleValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
    }else{
        
        aSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:keyName ascending:isAscending selector:@selector(compare:)];
        
    }
    
    NSMutableArray *sortedArray = [NSMutableArray arrayWithArray:[array sortedArrayUsingDescriptors:[NSArray arrayWithObject:aSortDescriptor]]];
    return sortedArray;
    
}

+(NSString *)parseAmountIntoValid2DecimalPointAmount:(NSNumber *)number{
    
    float parsedNumber = [number doubleValue];
    return [NSString stringWithString:[NSString stringWithFormat:@"%.2f",parsedNumber]];
    
}

+(NSString *)parseString:(NSString *)string{
    
    if (string == nil || string == NULL || [string isEqual:@""] || [string isEqual:@"<null>"] || [string isEqual:@"null"] || [string isEqual:@"(null)"] || (NSNull *)string == [NSNull null]) {
        return @"";
    }else{
        return [NSString stringWithString:string];
    }
    
}

+(NSString *)encodeStringForDatabase:(NSString *)string{
    
    if (string == nil || string == NULL || [string isEqual:@""] || [string isEqual:@"<null>"] || [string isEqual:@"null"] || [string isEqual:@"(null)"] || (NSNull *)string == [NSNull null]) {
        return @"";
    }else{
        NSString *value = [string stringByReplacingOccurrencesOfString:@"'" withString:@"(&apos)"];
        return [NSString stringWithString:value];
    }
    
}

+(NSString *)decodeStringForDatabase:(NSString *)string{
    
    if (string == nil || string == NULL || [string isEqual:@""] || [string isEqual:@"<null>"] || [string isEqual:@"null"] || [string isEqual:@"(null)"] || (NSNull *)string == [NSNull null]) {
        return @"";
    }else{
        NSString *value = [string stringByReplacingOccurrencesOfString:@"(&apos)" withString:@"'"];
        return [NSString stringWithString:value];
    }
    
}


+(NSString *)parsePercentageIntoValidTwoDecimalValue:(NSString *)percentage{
    
    percentage = [percentage stringByReplacingOccurrencesOfString:@"%" withString:@""];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSNumber *number = [formatter numberFromString:percentage];
    
    percentage = [Utility parseAmountIntoValid2DecimalPointAmount:number];
    return percentage;
    
}
+(NSString *)parseStrAmountIntoValidTwoDecimalValue:(NSString *)strAmount{
    
    if (strAmount == nil || strAmount == NULL || [strAmount isEqual:@""] || [strAmount isEqual:@"<null>"] || [strAmount isEqual:@"null"] || [strAmount isEqual:@"(null)"] || (NSNull *)strAmount == [NSNull null]) {
        strAmount = @"0";
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setLocale:[NSLocale systemLocale]];
    NSNumber *number = [formatter numberFromString:strAmount];
    strAmount = [Utility parseAmountIntoValid2DecimalPointAmount:number];
    
    return strAmount;
    
}

+(NSString *)parseDataParamsForWebService:(NSString *)string {
    
    string = [Utility parseString:string];
    string = [string stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    string = [string stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
    
    
    return string;
}

+ (NSString *)relativeDateStringForDate:(NSDate *)date
{
    NSCalendarUnit units = NSCalendarUnitDay | NSCalendarUnitWeekOfYear |
    NSCalendarUnitMonth | NSCalendarUnitYear;
    
    // if `date` is before "now" (i.e. in the past) then the components will be positive
    NSDateComponents *components = [[NSCalendar currentCalendar] components:units
                                                                   fromDate:date
                                                                     toDate:[NSDate date]
                                                                    options:0];
    
    if (components.year > 1) {
        return [NSString stringWithFormat:@"%ld years ago", (long)components.year];
    } else if (components.year == 1) {
        return [NSString stringWithFormat:@"%ld year ago", (long)components.year];
    } else if (components.month > 1) {
        return [NSString stringWithFormat:@"%ld months ago", (long)components.month];
    }else if (components.month == 1) {
        return [NSString stringWithFormat:@"%ld month ago", (long)components.month];
    } else if (components.weekOfYear > 1) {
        return [NSString stringWithFormat:@"%ld weeks ago", (long)components.weekOfYear];
    } else if (components.weekOfYear == 1) {
        return [NSString stringWithFormat:@"%ld week ago", (long)components.weekOfYear];
    } else if (components.day > 0) {
        if (components.day > 1) {
            return [NSString stringWithFormat:@"%ld days ago", (long)components.day];
        } else {
            return @"Yesterday";
        }
    } else {
        return [Utility relativeTimeStringForOneDay:date];
    }
}

+ (NSString *)relativeTimeStringForOneDay:(NSDate *)date{
    
    NSCalendarUnit units = NSCalendarUnitHour | NSCalendarUnitMinute |
    NSCalendarUnitSecond;
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:units
                                                                   fromDate:date
                                                                     toDate:[NSDate date]
                                                                    options:0];
    if (components.hour > 1) {
        return [NSString stringWithFormat:@"%ld hours ago",(long)components.hour];
    } else if (components.hour == 1) {
        return [NSString stringWithFormat:@"%ld hour ago",(long)components.hour];
    } else if (components.minute > 1) {
        return [NSString stringWithFormat:@"%ld minutes ago",(long)components.minute];
    } else if (components.minute == 1) {
        return [NSString stringWithFormat:@"%ld minute ago",(long)components.minute];
    } else if (components.second > 5) {
        return [NSString stringWithFormat:@"%ld seconds ago",(long)components.second];
    } else{
        return @"Just Now";
    }
    
}

+(NSDictionary *)parseDictionary:(NSDictionary *)dict
{
    if (dict == nil || dict == NULL || [dict isEqual:@""] || [dict isEqual:@"<null>"] || [dict isEqual:@"null"] || [dict isEqual:@"(null)"] || (NSNull *)dict == [NSNull null]) {
        return [[NSDictionary alloc] init];
    }else{
        return dict;
    }
    
}

+(NSArray *)parseArray:(NSArray *)array
{
    if (array == nil || array == NULL || [array isEqual:@""] || [array isEqual:@"<null>"] || [array isEqual:@"null"] || [array isEqual:@"(null)"] || (NSNull *)array == [NSNull null]) {
        return [[NSArray alloc] init];
    }else{
        return array;
    }
    
}

+(void)popupView:(UIView*)viewPopUp onView:(UIView *)onView{
    viewPopUp.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    [onView addSubview:viewPopUp];
    [UIView animateWithDuration:0.3/1.5 animations:^{
        viewPopUp.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            viewPopUp.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                viewPopUp.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
}


+(NSString *)convertDictionaryIntoJSON:(NSDictionary *)dictionary{
    
    NSData* data = [ NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
    
    return jsonString;
}

+(NSDictionary *)convertJSONIntoDictionary:(NSString *)jsonString {
    
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"%2B" withString:@"+"];
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *errorJson = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&errorJson];
    
    if (errorJson) {
        DebugLog(@"Error While Converting = %@",[errorJson localizedDescription]);
        return nil;
    }else{
        return json;
    }
    
    
}


+(NSAttributedString *)setTextShadow:(UILabel *)inLabel{
    
    NSString *strTest = [inLabel.text length]>0?inLabel.text:@"";
    
    NSMutableAttributedString* attString = [[NSMutableAttributedString alloc] initWithString:strTest];
    NSRange range = NSMakeRange(0, [attString length]);
    
    [attString addAttribute:NSFontAttributeName value:inLabel.font range:range];
    [attString addAttribute:NSForegroundColorAttributeName value:inLabel.textColor range:range];
    
    NSShadow* shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0/255 green:0.0/255 blue:0.0/255 alpha:0.5];
    shadow.shadowBlurRadius = 2.0f;
    
    shadow.shadowOffset = CGSizeMake(0.0f, 0.0f);
    [attString addAttribute:NSShadowAttributeName value:shadow range:range];
    
    
    return attString;
    
}

//+(void)addCollectionItemDataWithTitle:(NSString *)title inJSONWithKeyName:(NSString *)keyName{
//
//    /*
//     Here we have to get all the records from respective keyName from CACHE
//     Convert the JSON into array and check if respective title exist or not
//     if it does not exist then add it
//     otherwise no need to do anything
//     */
//    BOOL isObjectExist = NO;
//    for (NSDictionary *object in collectionItems) {
//        if ([[object objectForKey:HOME_COLLECTION_KEY_NAME] isEqualToString:title]) {
//            isObjectExist = YES;
//            break;
//        }
//    }
//
//    if (!isObjectExist) {
//        //Item does not exist
//        //get the item from all collection items
//        NSDictionary *objectToAdd = nil;
//        NSArray *allItems = [self getAllCollectionItemsDataFromCache];
//        for (NSDictionary *object in allItems) {
//            if ([[object objectForKey:HOME_COLLECTION_KEY_NAME] isEqualToString:title]) {
//                objectToAdd = object;
//                break;
//            }
//        }
//        //add it in the collectionItem at the end
//        [collectionItems addObject:objectToAdd];
//        //update the collection items cache
//        [self updateCollectionItemData];
//    }
//
//}
//
//+(void)removeDataFromAvailableCollectionItemsWithTitle:(NSString *)title {
//
//    /*
//     Here we have to check if respective title item exist in the available array or not.
//     if it exist then remove it from the available array
//     otherwise do nothing.
//     */
//    NSDictionary *objectToDelete = nil;
//    for (NSDictionary *object in collectionItems) {
//        if ([[object objectForKey:HOME_COLLECTION_KEY_NAME] isEqualToString:title]) {
//            objectToDelete = object;
//            break;
//        }
//    }
//    if (objectToDelete != nil) {
//        //Item exist
//        //Remove it
//        [collectionItems removeObject:objectToDelete];
//        //update user defaults
//        [self updateCollectionItemData];
//    }
//
//}



+(double)getDiscountedTwoDecimalAmount:(double)oriAmount andDiscounts:(double)percentage roundType:(LiquidPayRoundType)roundType
{
    double amtTwoDecimal = 0.0;
    
    if(oriAmount >0.0)
    {
        amtTwoDecimal = oriAmount*percentage;
        
        if(roundType == LiquidPayRoundTypeActual || roundType == LiquidPayRoundTypeRoundDown)
        {
            //            amtTwoDecimal = floor(amtTwoDecimal); // no round up/down, just return the 2 decimal point digits
            amtTwoDecimal = amtTwoDecimal/100;
            amtTwoDecimal = [Utility getAmtDoubleFromString:[NSString stringWithFormat:@"%.2f", amtTwoDecimal]];
        }
        else //roundType == LiquidPayRoundTypeRoundUp
        {
            amtTwoDecimal = round(amtTwoDecimal);
            amtTwoDecimal = amtTwoDecimal/100;
            amtTwoDecimal = [Utility getAmtDoubleFromString:[NSString stringWithFormat:@"%.2f", amtTwoDecimal]];
        }
    }
    return amtTwoDecimal;
    
}


+(BOOL)isInternetReachable{
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if([[NSUserDefaults standardUserDefaults] valueForKey:@"networkReachable"]==0)
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"networkReachable"];
        
        
        if (networkStatus == NotReachable) {
            [[NSUserDefaults standardUserDefaults] setValue:0 forKey:@"networkReachable"];
            
            NSError *anError = [[NSError alloc] initWithDomain:@"custom"
                                                          code:NSURLErrorNotConnectedToInternet userInfo:nil];
            
            
            return NO;
        } else {
            return YES;
        }
        
    }
    return YES;
    
}



+ (UIImage *)getScreenShotImage:(UIView *)selectedView {
    UIGraphicsBeginImageContextWithOptions(selectedView.bounds.size, NO, [UIScreen mainScreen].scale);
    [selectedView drawViewHierarchyInRect:selectedView.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (NSData *)getScreenShotImageData:(UIView *)selectedView
{
    UIImage *image = [self getScreenShotImage:selectedView];
    NSData * data = UIImagePNGRepresentation(image);
    return data;
}

+(void)addShadow:(UIView *)selectedView offset:(CGSize)offsetSize opacity:(float)shadowOpacity color:(UIColor *)shadowColor radius:(CGFloat)shadowRadius
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:selectedView.bounds];
    selectedView.layer.masksToBounds = NO;
    selectedView.layer.shadowColor = [shadowColor CGColor];
    selectedView.layer.shadowOffset = offsetSize;
    selectedView.layer.shadowOpacity = shadowOpacity;
    selectedView.layer.shadowPath = shadowPath.CGPath;
    selectedView.layer.shadowRadius = shadowRadius;
}



+(BOOL)isValidDictionary:(NSDictionary *)dictionary
{
    if (dictionary == nil || dictionary == NULL || [dictionary isEqual:@""] || [dictionary isEqual:@"<null>"] || [dictionary isEqual:@"null"] || [dictionary isEqual:@"(null)"] || (NSNull *)dictionary == [NSNull null]) {
        return NO;
    }else{
        return YES;
    }
    
}

+(NSString *)getNumberOfDaysLeftFromDate:(NSString *)futureDate {
    
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSTimeZone *inputTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
    [inputDateFormatter setTimeZone:inputTimeZone];
    [inputDateFormatter setDateFormat:dateFormat];
    [inputDateFormatter setLocale:[NSLocale systemLocale]];
    NSDate *date = [inputDateFormatter dateFromString:futureDate];
    
    //Convert Date
    NSCalendarUnit units = NSCalendarUnitDay;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:units
                                                                   fromDate:[NSDate date]
                                                                     toDate:date
                                                                    options:0];
    int days = (int)[components day];
    return [NSString stringWithFormat:@"%d",(int)days];
}

+(BOOL)isFirstTimeOfSimpleMode{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([[userDefaults objectForKey:@"FIRST_TIME_OF_SIMPLE_MODE"] boolValue]){
        return YES;
    } else {
        [userDefaults setBool:YES forKey:@"FIRST_TIME_OF_SIMPLE_MODE"];
        return NO;
    }
}
+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate
{
    if ([date compare:beginDate] == NSOrderedAscending)
        return NO;
    
    if ([date compare:endDate] == NSOrderedDescending)
        return NO;
    
    return YES;
}
+(void)activeButton:(UIButton *)button isEnable:(BOOL)enable{
    if (enable)
        [button setBackgroundColor:[UIColor blueColor]];
    else
        [button setBackgroundColor:[UIColor lightGrayColor]];
    button.enabled = enable;
}
@end
