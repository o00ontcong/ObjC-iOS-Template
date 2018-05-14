//
//  BaseModel.h
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 11/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end
NS_ASSUME_NONNULL_END
