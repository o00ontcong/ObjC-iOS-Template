//
//  UserModel.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 11/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "UserInfo.h"
@interface UserModel : BaseModel
@property (nonatomic, copy)   NSString *message;
@property (nonatomic, copy)   NSString *token;
@property (nonatomic, copy)   NSString *code;
@property (nonatomic, strong) UserInfo *userInfo;
@property (nonatomic, copy)   NSString *subToken;
@end
