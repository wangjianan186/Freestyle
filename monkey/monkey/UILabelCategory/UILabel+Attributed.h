//
//  UILabel+Attributed.h
//  monkey
//
//  Created by Bigbang on 2016/12/19.
//  Copyright © 2016年 Bigbang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Attributed)

/**
 *  富文
 *
 *  @param Attributed      需改变的字符串
 *  @param AttributedColor 需改变字符串的颜色
 *  @param AttributedFont  <#AttributedFont description#>
 */
-(void)setAttributedWithString:(NSString*)Attributed andAttributedColor:(UIColor*)AttributedColor andAttributedFont:(UIFont*)AttributedFont;


@end
