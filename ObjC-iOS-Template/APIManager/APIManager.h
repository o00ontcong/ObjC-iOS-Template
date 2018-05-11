//
//  APIManager.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 04/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Reachability.h"
#import "ServerAPI.h"
#import <UIKit/UIKit.h>
@class APIManager;

@protocol APIManagerDelegate <NSObject>

@required
- (void)APIManager:(NSString*)path
         setAction:(NSString*)action
           setData:(NSDictionary*)data
         completed:(NSDictionary*)JSON;
@optional
- (void)APIManager:(NSString*)path
         setAction:(NSString*)action
           setData:(NSDictionary*)data
            failed:(NSError*)error;

@end
@interface APIManager : AFHTTPSessionManager
@property (strong, nonatomic) NSData* dataWebResponse;
@property (weak, nonatomic) id<APIManagerDelegate> delegate;
@property (strong, nonatomic) UIAlertView *alertInvalid;
@property (assign, nonatomic) BOOL isHideAlert;

+ (APIManager*)sharedManager;
+ (BOOL)isInternetAvailable;
- (void)call:(NSString*)pathString
   setAction:(NSString*)action
     setData:(NSDictionary*)data
     isToken:(BOOL) isToken
 setDelegate:(id<APIManagerDelegate>)delegateRef;

- (void)call:(NSString*)pathString
   setAction:(NSString*)action
     setData:(NSDictionary*)data
 setDelegate:(id<APIManagerDelegate>)delegateRef;

@end
//service actions
#define HTTP_METHOD_GET @"GET"
#define HTTP_METHOD_POST @"POST"
#define HTTP_METHOD_DELETE @"DELETE"
