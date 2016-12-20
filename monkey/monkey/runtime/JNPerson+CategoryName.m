//
//  JNPerson+CategoryName.m
//  monkey
//
//  Created by Bigbang on 2016/12/19.
//  Copyright © 2016年 Bigbang. All rights reserved.
//

#import "JNPerson+CategoryName.h"
#import <objc/runtime.h>

static NSString *testNameKey = @"testNameKey";

@implementation JNPerson (CategoryName)

@dynamic testName;

-(void)setTestName:(NSString *)testName
{
    objc_setAssociatedObject(self, &testNameKey, testName, OBJC_ASSOCIATION_RETAIN);
}
-(NSString *)testName{
    return objc_getAssociatedObject(self, &testNameKey);
}

@end
