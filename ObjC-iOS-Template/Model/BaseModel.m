//
//  BaseModel.m
//  ObjC-iOS-Template
//
//  Created by Cong Nguyen on 11/05/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[self alloc] initWithJSONDictionary:dict] : nil;
}
- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = [self properties][key];
    if (resolved) [super setValue:value forKey:resolved];
}
- (NSDictionary<NSString *, NSString *> *)properties
{
    return [[NSDictionary alloc] init];
}
- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:[self properties].allValues] mutableCopy];
    
    // Rewrite property names that differ in JSON
    for (id jsonName in [self properties]) {
        id propertyName = [self properties][jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    return dict;
}
@end
