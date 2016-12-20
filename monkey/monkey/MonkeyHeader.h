//
//  MonkeyHeader.h
//  monkey
//
//  Created by Bigbang on 2016/12/19.
//  Copyright © 2016年 Bigbang. All rights reserved.
//

#ifndef MonkeyHeader_h
#define MonkeyHeader_h

// 弱引用
#define JNWeakSelf __weak typeof(self) weakSelf = self;

// 日志输出
#ifdef DEBUG
#define JNLog(...) NSLog(__VA_ARGS__)
#else
#define JNLog(...)
#endif

// RGB颜色
#define RandomColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 文字颜色
#define JNTextColor MJRefreshColor(90, 90, 90)

// 字体大小
#define JNLabelFont [UIFont boldSystemFontOfSize:14]


#endif /* MonkeyHeader_h */
