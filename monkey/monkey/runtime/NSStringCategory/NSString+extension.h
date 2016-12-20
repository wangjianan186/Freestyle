//
//  NSString+extension.h
//  monkey
//
//  Created by Bigbang on 2016/12/19.
//  Copyright © 2016年 Bigbang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (extension)

-(BOOL)isBlank;
-(BOOL)isValid;
- (NSString *)removeWhiteSpacesFromString;


- (NSUInteger)countNumberOfWords;
- (BOOL)containsString:(NSString *)subString;
- (BOOL)isBeginsWith:(NSString *)string;
- (BOOL)isEndssWith:(NSString *)string;

- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;
- (NSString *)addString:(NSString *)string;
- (NSString *)removeSubString:(NSString *)subString;

- (BOOL)containsOnlyLetters;
- (BOOL)containsOnlyNumbers;
- (BOOL)containsOnlyNumbersAndLetters;
- (BOOL)isInThisarray:(NSArray*)array;

+ (NSString *)getStringFromArray:(NSArray *)array;
- (NSArray *)getArray;

+ (NSString *)getMyApplicationVersion;
+ (NSString *)getMyApplicationName;

- (NSData *)convertToData;
+ (NSString *)getStringFromData:(NSData *)data;

- (BOOL)isValidEmail;
- (BOOL)isVAlidPhoneNumber;
- (BOOL)isValidUrl;

- (BOOL)isValidChinesePhoneNumber;
- (NSString *) reverseString;

//计算高度
-(CGFloat)getHeightOfFont:(UIFont *)textFont widht:(CGFloat)textWidth;
-(CGFloat)getWidthOfFont:(UIFont *)textFont height:(CGFloat)textHeight;

/**
 *  去除字符串的前后空格
 *
 *  @return 字符串
 */
- (NSString*)trim;


/**
 *  MD5
 */
- (NSString *)md5;

@end
