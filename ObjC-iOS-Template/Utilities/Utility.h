//
//  Utility.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UYLPasswordManager.h"
#import <sys/utsname.h>
#import <UIKit/UIKit.h>
//URLs
#define SERVICE_URL_DEV @"v1/dev"
#define SERVICE_URL_QA @"v1/qa"
#define SERVICE_URL_PROD @"v1/prod"

//Service Actions
#define HTTP_METHOD_GET @"GET"
#define HTTP_METHOD_POST @"POST"
#define HTTP_METHOD_DELETE @"DELETE"

#define RESPONSE_PARAM_CODE @"code"
#define RESPONSE_PARAM_DESCRIPTION @"description"

#define TIMEOUTINTERVAL30 30.0f
#define SESSIONTIMEOUTINTERVAL30 1800.0f

typedef NS_OPTIONS(NSUInteger, ProjectSortStyle) {
    ProjectSortStyleString = 1 << 0,
    ProjectSortStyleNumber = 1 << 1,
    ProjectSortStyleFloat = 1 << 2

};

typedef NS_OPTIONS(NSUInteger, ProjectRoundType) {
    ProjectRoundTypeActual = 1 << 0,
    ProjectRoundTypeRoundUp = 1 << 1,
    ProjectRoundTypeRoundDown = 1 << 2

};

typedef NS_OPTIONS(NSInteger, ComfortViewType) {
    ComfortViewTypeNotBooked = 0,
    ComfortViewTypeSearching = 1,
    ComfortViewTypeWaitingForTaxi = 2,
    ComfortViewTypeBooked = 3,
    ComfortViewTypeJourneyInTransit = 4
};

@interface Utility : NSObject

+ (UIFont*)primaryFont:(float)_size;
+ (UIFont*)primaryFontBold:(float)_size;
+ (UIFont*)fontCalibri:(float)_size;
+ (UIFont*)fontStyleBold:(float)_size;
+ (UIFont*)fontHelveticaNeue:(float)_size;
+ (UIFont*)fontHelveticaNeueLight:(float)_size;
+ (UIFont*)fontHelveticaNeueBold:(float)_size;
+ (UIFont*)fontHelveticaNeueThin:(float)_size;
+ (UIFont*)fontHelveticaNeueThinItalic:(float)_size;
+ (UIFont*)fontHelveticaNeueMedium:(float)_size;
+ (UIFont*)fontHelveticaNeueSemibold:(float)_size;

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (char)convertToChar:(BOOL)boolean;
+ (void)alert:(NSString*)title setMessage:(NSString*)message;
+ (void)alert:(NSString*)title setMessage:(NSString*)message cancenButtonTitle:(NSString*)cancelTitle;
+ (BOOL)checkAuthentication;
+ (BOOL)registerKey:(NSString*)identifier withValue:(NSString*)value;
+ (BOOL)checkKeyIdentifier:(NSString*)identifier;
+ (BOOL)deleteKey:(NSString*)identifier;
+ (NSString*)getKeyValue:(NSString*)identifier;

+ (UIImage*)imageFromColor:(UIColor*)color;
+ (UIImage*)imageFromColor:(UIColor*)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius;
+ (void)addLabelBorderEdgeLine:(UILabel*)label andRectEdge:(UIRectEdge)edge andColor:(UIColor*)color andThickness:(CGFloat)thickness;
+ (void)addTextFieldBorderEdgeLine:(UITextField*)txtField andRectEdge:(UIRectEdge)edge andColor:(UIColor*)color andThickness:(CGFloat)thickness;
+ (NSString*)getAmountString:(NSString*)strAmount;
+ (NSString*)getAmountWithoutDecimalPoint:(NSString*)strAmount;
+ (NSString*)getAmtFormattedStrFromDouble:(double)dAmount;
+ (double)getAmtDoubleFromString:(NSString*)strAmt;
+ (BOOL)isBalanceGreaterOrEqual:(double)dBalance toAmount:(double)dAmt;
+ (NSString*)getDecimalSymbol;

+ (float)getFloatValue:(id)inValue;

+ (NSString*)getDeviceUTCOffsetString;
+ (float)getDeviceUTCOffset;
+ (NSString*)getDeviceDateTimeFROMUTC:(NSString*)inDateTime;
+ (NSString*)getDeviceTimeFROMUTC:(NSString*)inDateTime andTimeFormate:(NSString*)inTimeFormat;
+ (NSString*)getDeviceDateFROMUTC:(NSString*)inDateTime andDateFormate:(NSString*)inDateFormat;
+ (NSString*)getLocalizedDeviceDateFROMUTC:(NSString*)inDateTime andDateFormate:(NSString*)inDateFormat;
+ (NSDate*)getDateFromString:(NSString*)inDateTime;
+ (void)registerSessionTimeStamp;
+ (BOOL)isSessionExpired;
+ (void)removeSessionTimeStamp;

+ (BOOL)isAccountActivated;
+ (void)setAccountActivate:(BOOL)isActivate;
+ (void)deleteAccountActivate;

+ (BOOL)isAllowTransfer;
+ (void)setAllowTransfer:(BOOL)isAllowed;
+ (void)deleteAllowTransfer;

+ (UILabel*)createTitleLabelWithText:(NSString*)titleText andFrame:(CGRect)frame andTag:(NSInteger)tag andView:(UIView*)view;

+ (NSString*)getCardColor:(NSInteger)intCard;
+ (UIColor*)getCardColor1:(NSString*)strColorCode;
+ (UIColor*)getCardColor2:(NSString*)strColorCode;
+ (NSInteger)getCardColorInt:(NSString*)strColorCode;
+ (void)setGradientcolor:(NSString*)gradientcolor toView:(UIView*)inView;
+ (NSString*)getCardBrandImageFileName:(NSString*)cardBrand;
+ (CGRect)labelWidthFromText:(UILabel*)label;

+ (NSString*)sha256HashFor:(NSString*)input;
+ (NSString*)sha512HashFor:(NSString*)input;
+ (NSString*)getDeviceID;
+ (NSString*)getDeviceModel;
+ (NSString*)getDeviceOSVersion;
+ (CAShapeLayer*)drawShapeWithArray:(NSArray*)pointArray;

+ (BOOL)isWalletFirstTab;

+ (NSData*)getCardData;
+ (void)storeCardData:(NSData*)inDataWebResponse;
+ (BOOL)isCardDataUpdated:(NSData*)inDataWebResponse;

+ (NSData*)getPurseData;
+ (void)storePurseData:(NSData*)inDataWebResponse;
+ (BOOL)isPurseDataUpdated:(NSData*)inDataWebResponse;

+ (UIAlertController*)alertC:(NSString*)title Message:(NSString*)message cancelTitle:(NSString*)cancelTitle;
+ (UIAlertController*)alertC:(NSString*)title Message:(NSString*)message;

+ (void)setAccBalance:(NSString*)strBalance;
+ (NSString*)parseAmountIntoValid2DecimalPointAmount:(NSNumber*)number;
+ (NSString*)parseString:(NSString*)string;
+ (NSString*)parsePercentageIntoValidTwoDecimalValue:(NSString*)percentage;
+ (NSString*)relativeDateStringForDate:(NSDate*)date;
+ (NSString*)relativeTimeStringForOneDay:(NSDate*)date;
+ (NSString*)encodeStringForDatabase:(NSString*)string;
+ (NSString*)decodeStringForDatabase:(NSString*)string;
+ (NSDictionary*)parseDictionary:(NSDictionary*)dict;
+ (NSArray*)parseArray:(NSArray*)array;
+ (NSString*)getAmtFormattedStrFromString:(NSString*)strAmount;
+ (BOOL)isBalanceGreaterOrEqual:(NSString*)strBalance withAmount:(NSString*)strAmt;
+ (NSString*)parseStrAmountIntoValidTwoDecimalValue:(NSString*)strAmount;
+ (UIImage*)setTintColor:(UIColor*)color forImage:(UIImage*)image;
+ (NSString*)getShortLocalizedDeviceDateFROMUTC:(NSString*)inDateTime andDateFormate:(NSString*)inDateFormat;
+ (void)popupView:(UIView*)viewPopUp onView:(UIView*)onView;
+ (NSString*)convertDictionaryIntoJSON:(NSDictionary*)dictionary;
+ (NSDictionary*)convertJSONIntoDictionary:(NSString*)jsonString;
+ (NSString*)getLocalizedDeviceDateFROMUTC:(NSString*)inDateTime WithInputFormat:(NSString*)inputFormate andOutputFormate:(NSString*)inDateFormat;

+ (NSAttributedString*)setTextShadow:(UILabel*)inLabel;
+ (void)addShadow:(UIView*)selectedView offset:(CGSize)offsetSize opacity:(float)shadowOpacity color:(UIColor*)shadowColor radius:(CGFloat)shadowRadius;
//constant name
+ (NSMutableAttributedString*)styleSalePriceLabel:(NSString*)salePrice withFont:(UIFont*)font rangeSmallerText:(NSRange)range;
+ (void)drawDashedBorderAroundView:(UIView*)v borderColor:(UIColor*)color thickness:(CGFloat)thickness dashWidth:(CGFloat)width;

//Get screeshot image of selected view
+ (UIImage*)getScreenShotImage:(UIView*)selectedView;
//Get screeshot image Data of selected view
+ (NSData*)getScreenShotImageData:(UIView*)selectedView;
+ (BOOL)isValidDictionary:(NSDictionary*)dictionary;

+ (NSString*)parseDataParamsForWebService:(NSString*)string;

+ (BOOL)isInternetReachable;
+ (BOOL)isValidDictionary:(NSDictionary*)dictionary;
+ (NSString*)getNumberOfDaysLeftFromDate:(NSString*)futureDate;
+ (BOOL)isFirstTimeOfSimpleMode;
+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate;
+ (void)activeButton:(UIButton*)button isEnable:(BOOL)enable;
+ (float)getRespectiveFieldHeight;

#define LogEnable YES

//#ifdef DEV
//#define LogEnable YES
//#elif QA
//#define LogEnable NO
//#elif PROD
//#define LogEnable NO
//#endif
#define DebugLog(__FORMAT__, ...)                                                                                                                                              \
{                                                                                                                                                                          \
if (LogEnable)                                                                                                                                                         \
NSLog((@"🔶%@ FUNCTION%s 🔷LINE-%d " __FORMAT__), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); \
}

#pragma mark Define Color

#define UIColorFromRGB(rgbValue)                                         \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8)) / 255.0  \
blue:((float)((rgbValue & 0x0000FF) >> 0)) / 255.0  \
alpha:1.0]


//Screen sizes constants
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE_4_OR_LESS_NEW (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5_NEW (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6_NEW (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P_NEW (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH == 812)

#define SW SCREEN_WIDTH / 375
#define SH SCREEN_HEIGHT / 667

#define NAVIGATION_HEIGHT (self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height)

#define SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define CARD_COLOR_0 @"Aqua"
#define CARD_COLOR_1 @"GreyDaVinci"
#define CARD_COLOR_2 @"RedLexie"
#define CARD_COLOR_3 @"OrangeDawn"
#define CARD_COLOR_4 @"PurpleTzeMin"
#define CARD_COLOR_5 @"GreenKelvin"
#define CARD_COLOR_6 @"PinkMay"
#define CARD_COLOR_7 @"WhiteErnest"
#define CARD_COLOR_8 @"RomanceBernard"
#define CARD_COLOR_9 @"RedScarlet"
#define CARD_COLOR_10 @"BlackJT"
#define CARD_COLOR_11 @"Mint"

#define Aqua_0 0x00C6FF
#define Aqua_1 0x0072FF

#define GreyDaVinci_0 0x859398
#define GreyDaVinci_1 0x364160

#define RedLexie_0 0xEACDA3
#define RedLexie_1 0xD6AE7B

#define OrangeDawn_0 0xFF9068
#define OrangeDawn_1 0xFD746C

#define PurpleTzeMin_0 0xB16DD7
#define PurpleTzeMin_1 0x3C2CD3

#define GreenKelvin_0 0x97CB79
#define GreenKelvin_1 0x76B852

#define PinkMay_0 0xF15F79
#define PinkMay_1 0xB24592

#define WhiteErnest_0 0x94D6E6
#define WhiteErnest_1 0x8E9EAB

#define RomanceBernard_0 0x3CD3AD
#define RomanceBernard_1 0x4CB8C4

#define RedScarlet_1 0xF05B4D
#define RedScarlet_0 0xE62E7B

#define BlackJT_0 0x817E7E
#define BlackJT_1 0x4E4A4A

#define Mint_0 0x4F9AC8
#define Mint_1 0x324BA5
#define kGradientLayerKey @"MyGradientLayer"

#define TEXTFIELD_BG_COLOR [UIColor colorWithRed:245.0 / 255.0 green:245.0 / 255.0 blue:245.0 / 255.0 alpha:1.0]
#define BUTTON_BG [UIColor colorWithRed:19.0 / 255.0 green:201.0 / 255.0 blue:254.0 / 255.0 alpha:1.0]
#define TEXT_COLOR [UIColor colorWithRed:51.0 / 255.0 green:51.0 / 255.0 blue:51.0 / 255.0 alpha:1.0]
#define SUB_MEDIUM_TEXT_COLOR [UIColor colorWithRed:161.0 / 255.0 green:161.0 / 255.0 blue:161.0 / 255.0 alpha:1.0]

//textfield sizes for different devices
#define DEFAULT_TEXTFIELD_SIZE DEFAULT_TEXTFIELD_SIZE_6P
#define DEFAULT_TEXTFIELD_SIZE_6P 56.0f
#define DEFAULT_TEXTFIELD_SIZE_6 52.0f
#define DEFAULT_TEXTFIELD_SIZE_5 48.0f
#define DEFAULT_TEXTFIELD_SIZE_4 42.0f
@end

