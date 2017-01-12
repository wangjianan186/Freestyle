
//
//  JNOriginalPriceLabel.m
//  monkey
//
//  Created by Bigbang on 2017/1/6.
//  Copyright © 2017年 Bigbang. All rights reserved.
//

#import "JNOriginalPriceLabel.h"

@implementation JNOriginalPriceLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setup];
}

- (void)setup {
    self.textColor = [UIColor redColor];
    self.textAlignment = NSTextAlignmentCenter;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    
    [self.textColor set];
    
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    UIRectFill(CGRectMake(0, h * 0.5, w, 1/[UIScreen mainScreen].scale));
    
    
    
}

@end
