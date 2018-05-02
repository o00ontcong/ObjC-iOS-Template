//
//  UILabel+Utils.m
//  Liquid Lite
//
//  Created by Cong Nguyen on 16/11/2017.
//  Copyright © 2017 korvac. All rights reserved.
//

#import "UILabel+Utils.h"

@implementation  UILabel (Utils)

-(CGSize )getSizeForText{
    
    CGSize constrain = CGSizeMake(self.bounds.size.width, FLT_MAX);
    CGSize size = [self.text sizeWithFont:self.font constrainedToSize:constrain lineBreakMode:NSLineBreakByWordWrapping];
    return size;
    
}
-(int)getNumberOfVisibleLines{
    
    return ceil(self.getSizeForText.height / self.font.lineHeight);
}

@end
