//
//  UserInfo.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 14/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo
- (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"branchName": @"branchName",
                                                    @"fullName": @"fullName",
                                                    @"id": @"identifier",
                                                    @"notificationCount": @"notificationCount",
                                                    @"phone": @"phone",
                                                    @"roleType": @"roleType",
                                                    @"shopId": @"shopID",
                                                    @"urlAvatar": @"urlAvatar",
                                                    @"userName": @"userName",
                                                    };
    
}
@end
