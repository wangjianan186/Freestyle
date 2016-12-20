//
//  UILabel+CalculateHeight.m
//  monkey
//
//  Created by Bigbang on 2016/12/19.
//  Copyright © 2016年 Bigbang. All rights reserved.
//

#import "UILabel+CalculateHeight.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


@implementation UILabel (CalculateHeight)


-(CGFloat)getHeightOfText:(NSString *)textStr font:(UIFont *)textFont widht:(CGFloat)textWidth
{
    CGSize requiredSize;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
        
        NSDictionary *attributes = @{ NSFontAttributeName: textFont, NSParagraphStyleAttributeName : paragraphStyle };
        
        
        CGRect rect = [textStr boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                            options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                         attributes:attributes
                                            context:nil];
        requiredSize = rect.size;
        
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"//"-Wdeprecated-declarations"

        CGSize boundingSize = CGSizeMake(textWidth, CGFLOAT_MAX);
        requiredSize = [textStr sizeWithFont:textFont
                           constrainedToSize:boundingSize
                               lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
  
    }
    
    return ceilf(requiredSize.height);
}


-(void)setTextWithCalculateHeight:(NSString *)text
{
    self.numberOfLines = 0;
    self.text = text;
    float height = [self getHeightOfText:self.text font:self.font widht:self.frame.size.width];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
    
}


@end
