//
//  JNButton.m
//  monkey
//
//  Created by Bigbang on 2017/1/12.
//  Copyright © 2017年 Bigbang. All rights reserved.
//

#import "JNButton.h"

@implementation JNButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

//- (void)setXxxModel:(XxxModel *)xxxModel {
//    _xxxModel = xxxModel;
//    
//    if (xxxModel.xxx) {
//    
//        [self setImage:[UIImage imageNamed:@"xxx"] forState:UIControlStateNormal];
//        [self setTitle:@"sss" forState:UIControlStateNormal];
//    }
//    
//}


//- (CGRect)imageRectForContentRect:(CGRect)contentRect {
//
//    return CGRectMake(0, 0, 100, 20);
//}
//- (CGRect)titleRectForContentRect:(CGRect)contentRect {
//    return CGRectMake(0, 0, 100, 20);
//}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    CGFloat buttonW = self.frame.size.width;
    CGFloat buttonH = self.frame.size.height;

    self.imageView.frame = CGRectMake(0, 0, buttonW, buttonH);
    self.titleLabel.frame = CGRectMake(0, 0, buttonW, buttonW);
}

@end
