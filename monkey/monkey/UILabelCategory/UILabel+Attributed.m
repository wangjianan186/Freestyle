//
//  UILabel+Attributed.m
//  monkey
//
//  Created by Bigbang on 2016/12/19.
//  Copyright © 2016年 Bigbang. All rights reserved.
//

#import "UILabel+Attributed.h"

@implementation UILabel (Attributed)

-(void)setAttributedWithString:(NSString *)Attributed andAttributedColor:(UIColor *)AttributedColor andAttributedFont:(UIFont *)AttributedFont{
    
    NSRange rang=[self.text rangeOfString:Attributed];
    
    UIColor * cuttentColor=AttributedColor?AttributedColor:self.textColor;
    
    NSMutableAttributedString * string=[[NSMutableAttributedString alloc] initWithString:self.text];
    [string addAttribute:NSForegroundColorAttributeName value:cuttentColor range:rang];
    
    if (AttributedFont) {
        [string addAttribute:NSFontAttributeName value:AttributedFont range:rang];
        
    }
    self.attributedText=string;
}


@end
