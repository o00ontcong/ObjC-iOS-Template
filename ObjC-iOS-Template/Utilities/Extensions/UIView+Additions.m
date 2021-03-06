//
//  UIView+Additions.m
//  LiquidPaySDK
//  Copyright © 2016 Liquid Pay Pte. Ltd. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (void)printAllSubviews:(NSString*)indent
{
//     (@"%@%@",indent,self);
     (@"%@(RESP %@)",indent,[self nextResponder]);
    for (UIView *subview in self.subviews) {
        [subview printAllSubviews:[NSString stringWithFormat:@"   %@",indent]];
    }
}

- (void)printAllSubviews
{
     (@"**** SUB VIEWS ****");
    [self printAllSubviews:@""];
     (@"**** ********* ****");
}

- (UIViewController*)findViewController
{
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return  nextResponder;
    } else if (self.subviews.count) {
        for (UIView *subview in self.subviews) {
            id result = [subview findViewController];
            if (result) {
                return result;
            }
        }
    }
    return nil;
}


@end
