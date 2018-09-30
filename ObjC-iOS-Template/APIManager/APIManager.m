//
//  APIManager.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 04/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "APIManager.h"
@interface APIManager () {
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
   setParams:(NSDictionary*)params
     isToken:(BOOL)isToken
         tag:(NSString*)tag
    setDelegate:(id<APIManagerDelegate>)delegateRef
{
    if (isToken){
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=UTF-8;" forHTTPHeaderField:@"Content-Type"];
        [self.requestSerializer setTimeoutInterval:180];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        [self.requestSerializer setValue:sessionToken forHTTPHeaderField:URL_TOKEN];

    }
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
        if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setParams:tag:failed:)]) {
            [self.delegate APIManager:pathString setAction:action setParams:params tag:tag failed:error];
        }
    } else if ((isToken == YES) && ([sessionToken isEqualToString:@""] || sessionToken == nil)) {
        NSError* error = [[NSError alloc] initWithDomain:URL_HOST
                                                    code:NSURLErrorUnknown
                                                userInfo:nil];
        //Logout of the applications
        if (!self.isHideAlert){
            self.alertInvalid = [[UIAlertView alloc] initWithTitle:@"Error" message:[error.userInfo objectForKey:NSLocalizedDescriptionKey] delegate:self cancelButtonTitle:NSLocalizedString(@"btn_ok",nil) otherButtonTitles: nil];
            [self.alertInvalid show];
            [Utility deleteKey:PROJECT_SESSIONKEY];
            [Helper authenticationChange];
        }
        if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setParams:tag:failed:)]) {
            [self.delegate APIManager:pathString setAction:action setParams:params tag:tag failed:error];
        }
    } else {
        if ([action isEqualToString:HTTP_METHOD_GET]) {
            [self GET:urlString
                parameters:params
                progress:nil
                success:^(NSURLSessionDataTask* _Nonnull task,
                    id _Nullable responseObject) {
                    if (self.isShowResponse){
                    }
                    if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setParams:tag:completed:)]){
                        [self.delegate APIManager:pathString setAction:action setParams:params tag:tag completed:responseObject];
                    }
                }
                failure:^(NSURLSessionDataTask* _Nullable task,
                    NSError* _Nonnull error) {
                    
                    if (!self.isHideAlert){
                        self.alertInvalid = [[UIAlertView alloc] initWithTitle:@"Error" message:[error.userInfo objectForKey:NSLocalizedDescriptionKey] delegate:self cancelButtonTitle:NSLocalizedString(@"btn_ok",nil) otherButtonTitles: nil];
                        [self.alertInvalid show];
                    }
                    
                    if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setParams:tag:failed:)]) {
                        [self.delegate APIManager:pathString setAction:action setParams:params tag:tag failed:error];
                    }
                
                }];
        } else if ([action isEqualToString:HTTP_METHOD_POST]) {
            
            [self POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                //do nothing
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                //do nothing
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (self.isShowResponse){
                }
                if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setParams:tag:completed:)]){
                    [self.delegate APIManager:pathString setAction:action setParams:params tag:tag completed:responseObject];
                }
            } failure:^(NSURLSessionDataTask* _Nullable task, NSError*  _Nullable error) {
                if (!self.isHideAlert){
                    self.alertInvalid = [[UIAlertView alloc] initWithTitle:@"Error" message:[error.userInfo objectForKey:NSLocalizedDescriptionKey] delegate:self cancelButtonTitle:NSLocalizedString(@"btn_ok",nil) otherButtonTitles: nil];
                    [self.alertInvalid show];
                }
                if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setParams:tag:failed:)]) {
                    [self.delegate APIManager:pathString setAction:action setParams:params tag:tag failed:error];
                }
            }];
            
        } else {
            NSError* error = [[NSError alloc] initWithDomain:URL_HOST
                                                        code:NSURLErrorUnknown
                                                    userInfo:@{NSLocalizedDescriptionKey :
                                                                   @"Wrong method"}];
            if (!self.isHideAlert){
                self.alertInvalid = [[UIAlertView alloc] initWithTitle:@"Error" message:[error.userInfo objectForKey:NSLocalizedDescriptionKey] delegate:self cancelButtonTitle:NSLocalizedString(@"btn_ok",nil) otherButtonTitles: nil];
                [self.alertInvalid show];
            }
            if ([self.delegate respondsToSelector:@selector(APIManager:setAction:setParams:tag:failed:)]) {
                [self.delegate APIManager:pathString setAction:action setParams:params tag:tag failed:error];
            }
        }
    }
}
- (void)call:(NSString*)pathString
      setAction:(NSString*)action
   setParams:(NSDictionary*)params
         tag:(NSString*)tag
    setDelegate:(id<APIManagerDelegate>)delegateRef{
    [self call:pathString setAction:action setParams:params isToken: YES tag:tag setDelegate:delegateRef];
}
- (void)call:(NSString*)pathString
   setAction:(NSString*)action
   setParams:(NSDictionary*)params
 setDelegate:(id<APIManagerDelegate>)delegateRef{
    [self call:pathString setAction:action setParams:params isToken: YES tag:@"" setDelegate:delegateRef];
}

- (void)mock:(NSString*)pathString
   setAction:(NSString*)action
   setParams:(NSDictionary*)params
     isToken:(BOOL) isToken
         tag:(NSString*)tag
 setDelegate:(id<APIManagerDelegate>)delegateRef{
    self.delegate = delegateRef;
    
    NSString * str = [pathString componentsSeparatedByString:@"/"].lastObject;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:str ofType:@"json"];
    NSData *dataParse = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:dataParse options:0 error:nil];
    [self.delegate APIManager:pathString setAction:action setParams:params tag:tag completed:json];
}

- (void)mock:(NSString*)pathString
   setAction:(NSString*)action
   setParams:(NSDictionary*)params
         tag:(NSString*)tag
 setDelegate:(id<APIManagerDelegate>)delegateRef{
    [self mock:pathString setAction:action setParams:params isToken:YES tag:tag setDelegate:delegateRef];
}
- (void)mock:(NSString*)pathString
   setAction:(NSString*)action
   setParams:(NSDictionary*)params
 setDelegate:(id<APIManagerDelegate>)delegateRef{
    [self mock:pathString setAction:action setParams:params isToken:YES tag:@"" setDelegate:delegateRef];

}
@end
