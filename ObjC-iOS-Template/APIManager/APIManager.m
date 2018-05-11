//
//  APIManager.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 04/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "APIManager.h"
@interface APIManager () <NSURLSessionDelegate> {
    NSMutableData* webData;

    int timeoutInterval;
    NSString* sessionToken;
}

@end
@implementation APIManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        timeoutInterval = 20.0;
        sessionToken = [Utility getKeyValue:PROJECT_SESSIONKEY];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.requestSerializer setValue:sessionToken forHTTPHeaderField:URL_TOKEN];

    }
    return self;
}

+ (APIManager*)sharedManager
{
    static APIManager* _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [APIManager manager];
    });

    return _sharedManager;
}

+ (BOOL)isInternetAvailable
{
    Reachability* networkReachability =
        [Reachability reachabilityForInternetConnection];

    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];

    return (networkStatus != NotReachable);
}

- (void)call:(NSString*)pathString
      setAction:(NSString*)action
        setData:(NSDictionary*)data
        isToken:(BOOL)isToken
    setDelegate:(id<APIManagerDelegate>)delegateRef
{
    NSString * urlString = [NSString stringWithFormat:@"%@%@",URL_HOST,pathString];
    self.delegate = delegateRef;
    if (![APIManager isInternetAvailable]) {
        [Utility alert:NSLocalizedString(@"error_internet_connectivity", nil)
            setMessage:NSLocalizedString(@"error_phone_settings", nil)];

        NSError* error = [[NSError alloc]
            initWithDomain:URL_HOST
                      code:NSURLErrorNotConnectedToInternet
                  userInfo:@{
                      NSLocalizedDescriptionKey :
                          NSLocalizedString(@"error_internet_connectivity", nil)
                  }];
        if (!self.isHideAlert){
            self.alertInvalid = [[UIAlertView alloc] initWithTitle:@"Error" message:[error.userInfo objectForKey:NSLocalizedDescriptionKey] delegate:self cancelButtonTitle:NSLocalizedString(@"btn_ok",nil) otherButtonTitles: nil];
            [self.alertInvalid show];

        }
        if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setData:failed:)]) {
            [self.delegate APIManager:pathString setAction:action setData:data failed:error];
        }
    } else if ((isToken == YES) && ([sessionToken isEqualToString:@""] || sessionToken == nil)) {
        NSError* error = [[NSError alloc] initWithDomain:URL_HOST
                                                    code:NSURLErrorUnknown
                                                userInfo:nil];
        //Logout of the applications
        if (!self.isHideAlert){
            self.alertInvalid = [[UIAlertView alloc] initWithTitle:@"Error" message:[error.userInfo objectForKey:NSLocalizedDescriptionKey] delegate:self cancelButtonTitle:NSLocalizedString(@"btn_ok",nil) otherButtonTitles: nil];
            [self.alertInvalid show];
            [Utility deleteKey:@"SESSIONKEY"];
            [Helper authenticationChange];
        }
        if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setData:failed:)]) {
            [self.delegate APIManager:pathString setAction:action setData:data failed:error];
        }
    } else {
        if ([action isEqualToString:HTTP_METHOD_GET]) {
            [self GET:urlString
                parameters:data
                progress:nil
                success:^(NSURLSessionDataTask* _Nonnull task,
                    id _Nullable responseObject) {
                    if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setData:completed:)]){
                        [self.delegate APIManager:pathString setAction:action setData:data completed:responseObject];
;
                    } else {
                        DebugLog(@"❌APIManager.delegate is NULL❌");
                    }
                }
                failure:^(NSURLSessionDataTask* _Nullable task,
                    NSError* _Nonnull error) {
                    if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setData:failed:)]) {
                        [self.delegate APIManager:pathString setAction:action setData:data failed:error];
                    }else {
                        DebugLog(@"❌APIManager.delegate is NULL❌");
                    }
                }];
        } else if ([action isEqualToString:HTTP_METHOD_POST]) {
            [self POST:urlString
                parameters:data
                progress:nil
                success:^(NSURLSessionDataTask* _Nonnull task,
                    id _Nullable responseObject) {
                    if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setData:completed:)]){
                        [self.delegate APIManager:pathString setAction:action setData:data completed:responseObject];
                    } else {
                        DebugLog(@"❌APIManager.delegate is NULL❌");
                    }
                }
                failure:^(NSURLSessionDataTask* _Nullable task,
                    NSError* _Nonnull error) {
                    if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setData:failed:)]) {
                        [self.delegate APIManager:pathString setAction:action setData:data failed:error];
                    }else {
                        DebugLog(@"❌APIManager.delegate is NULL❌");
                    }
                }];
        } else {
            NSError* error = [[NSError alloc] initWithDomain:@" " code:NSURLErrorUnknown userInfo:nil];

            if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setData:failed:)]) {
                [self.delegate APIManager:pathString setAction:action setData:data failed:error];
            }else {
                DebugLog(@"❌APIManager.delegate is NULL❌");
            }
        }
    }
}
- (void)call:(NSString*)pathString
      setAction:(NSString*)action
        setData:(NSDictionary*)data
    setDelegate:(id<APIManagerDelegate>)delegateRef{
    [self call:pathString setAction:action setData:data isToken:YES setDelegate:delegateRef];
}


@end