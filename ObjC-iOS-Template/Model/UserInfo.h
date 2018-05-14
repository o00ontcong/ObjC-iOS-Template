//
//  UserInfo.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 14/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
@property (nonatomic, copy)   NSString *branchName;
@property (nonatomic, copy)   NSString *fullName;
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, assign) NSInteger notificationCount;
@property (nonatomic, copy)   NSString *phone;
@property (nonatomic, assign) NSInteger roleType;
@property (nonatomic, assign) NSInteger shopID;
@property (nonatomic, copy)   NSString *urlAvatar;
@property (nonatomic, copy)   NSString *userName;

@end
