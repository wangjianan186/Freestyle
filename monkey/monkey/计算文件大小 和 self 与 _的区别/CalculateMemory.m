//
//  CalculateMemory.m
//  整理资料
//
//  Created by 王佳男 on 16/8/14.
//  Copyright © 2016年 Wang JiaNan. All rights reserved.
//

#import "CalculateMemory.h"

@implementation CalculateMemory


//计算大小 ....................

//系统自带方法
//[NSByteCountFormatter stringFromByteCount:1999 countStyle:NSByteCountFormatterCountStyleFile];

- (id)transformedValue:(id)value {

    double covertedValue = [value doubleValue];
    int multiplyFactor = 0;
    
    NSArray *tokens = [NSArray arrayWithObjects:@"bytes",@"KB",@"MB",@"GB",@"TB",@"PB",@"EB",@"ZB",@"YB",nil];
    
    while (covertedValue >1024) {
        covertedValue /= 1024;
        multiplyFactor++;
    }
    
    return [NSString stringWithFormat:@"%4.2f %@",covertedValue, [tokens objectAtIndex:multiplyFactor]];

    
   
    
    /*   注意 ： _xxx 和 self.xxx 和 self->xxx 的区别
     
                _xxx 访问的是 xxx 的地址。
     
                self.xxx 访问的是 xxx的 getter .
     
                这两者并不是完全等价的， self.xxx 是 objc_msgSend 发消息, _xxx 或者 self->xxx 则是直接访问内存地址。
     
                一般建议在 init 里面用 _xxx， 其他地方用 self.xxx ，为什么呢？ 避免踩坑
     
     
    */
}


@end
