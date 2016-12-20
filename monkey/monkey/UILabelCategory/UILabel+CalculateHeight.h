//
//  UILabel+CalculateHeight.h
//  monkey
//
//  Created by Bigbang on 2016/12/19.
//  Copyright © 2016年 Bigbang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CalculateHeight)

-(void)setTextWithCalculateHeight:(NSString *)text;
-(CGFloat)getHeightOfText:(NSString *)textStr font:(UIFont *)textFont widht:(CGFloat)textWidth;


@end
