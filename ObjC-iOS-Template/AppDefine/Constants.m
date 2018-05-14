//
//  Constants.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 26/04/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "Constants.h"

@implementation Constants
+ (Constants*)shared
{
    static Constants* _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
@end
