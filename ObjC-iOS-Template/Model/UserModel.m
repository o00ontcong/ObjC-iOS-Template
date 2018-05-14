//
//  TeacherModel.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 14/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"message": @"message",
                                                    @"token": @"token",
                                                    @"code": @"code",
                                                    @"userInfo": @"userInfo",
                                                    @"subToken": @"subToken",
                                                    };
    
}
@end

