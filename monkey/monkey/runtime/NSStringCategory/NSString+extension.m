//
//  NSString+extension.m
//  monkey
//
//  Created by Bigbang on 2016/12/19.
//  Copyright © 2016年 Bigbang. All rights reserved.
//

#import "NSString+extension.h"
#import <CommonCrypto/CommonDigest.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


@implementation NSString (extension)

// Checking if String is Empty
-(BOOL)isBlank
{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""]) ? YES : NO;
}
//Checking if String is empty or nil
-(BOOL)isValid
{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""] || self == nil || [self isEqualToString:@"(null)"] || [self isKindOfClass:[NSNull class]] ) ? NO :YES;
}

// remove white spaces from String
- (NSString *)removeWhiteSpacesFromString
{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

// Counts number of Words in String
- (NSUInteger)countNumberOfWords
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    NSUInteger count = 0;
    while ([scanner scanUpToCharactersFromSet: whiteSpace  intoString: nil]) {
        count++;
    }
    
    return count;
}

// If string contains substring
- (BOOL)containsString:(NSString *)subString
{
    return ([self rangeOfString:subString].location == NSNotFound) ? NO : YES;
}

// If my string starts with given string
- (BOOL)isBeginsWith:(NSString *)string
{
    return ([self hasPrefix:string]) ? YES : NO;
}

// If my string ends with given string
- (BOOL)isEndssWith:(NSString *)string
{
    return ([self hasSuffix:string]) ? YES : NO;
}



// Replace particular characters in my string with new character
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar
{
    return  [self stringByReplacingOccurrencesOfString:olderChar withString:newerChar];
}

// Get Substring from particular location to given lenght
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end
{
    NSRange r;
    r.location = begin;
    r.length = end - begin;
    return [self substringWithRange:r];
}

// Add substring to main String
- (NSString *)addString:(NSString *)string
{
    if(!string || string.length == 0)
        return self;
    
    return [self stringByAppendingString:string];
}

// Remove particular sub string from main string
-(NSString *)removeSubString:(NSString *)subString
{
    if ([self containsString:subString])
    {
        NSRange range = [self rangeOfString:subString];
        return  [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}


// If my string contains ony letters
- (BOOL)containsOnlyLetters
{
    NSCharacterSet *letterCharacterset = [[NSCharacterSet letterCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:letterCharacterset].location == NSNotFound);
}

// If my string contains only numbers
- (BOOL)containsOnlyNumbers
{
    NSCharacterSet *numbersCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return ([self rangeOfCharacterFromSet:numbersCharacterSet].location == NSNotFound);
}

// If my string contains letters and numbers
- (BOOL)containsOnlyNumbersAndLetters
{
    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}

// If my string is available in particular array
- (BOOL)isInThisarray:(NSArray*)array
{
    for(NSString *string in array) {
        if([self isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

// Get String from array
+ (NSString *)getStringFromArray:(NSArray *)array
{
    return [array componentsJoinedByString:@" "];
}

// Convert Array from my String
- (NSArray *)getArray
{
    return [self componentsSeparatedByString:@" "];
}

// Get My Application Version number
+ (NSString *)getMyApplicationVersion
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleVersion"];
    return version;
}

// Get My Application name
+ (NSString *)getMyApplicationName
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleDisplayName"];
    return name;
}


// Convert string to NSData
- (NSData *)convertToData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

// Get String from NSData
+ (NSString *)getStringFromData:(NSData *)data
{
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
    
}

// Is Valid Email

- (BOOL)isValidEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTestPredicate evaluateWithObject:self];
}

// Is Valid Phone

- (BOOL)isVAlidPhoneNumber
{
    NSString *regex = @"[235689][0-9]{6}([0-9]{3})?";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:self];
}

// Is Valid URL

- (BOOL)isValidUrl
{
    NSString *regex =@"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}

-(BOOL)isValidChinesePhoneNumber{
    
    NSString * MOBILE = @"^1([37][0-9]|5[0-35-9]|8[025-9]|70|77)\\d{8}$";
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:self];
    BOOL res2 = [regextestcm evaluateWithObject:self];
    BOOL res3 = [regextestcu evaluateWithObject:self];
    BOOL res4 = [regextestct evaluateWithObject:self];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

- (NSString *) reverseString
{
    NSUInteger len = [self length];
    // self 表示字符串本身
    NSMutableString *retStr = [NSMutableString stringWithCapacity:len];
    while (len > 0) {
        unichar c = [self characterAtIndex:--len];
        // 从后取一个字符 unicode
        NSLog(@" c is %C", c);
        NSString *s = [NSString stringWithFormat:
                       @"%C", c];
        [retStr appendString:s];
    }
    
    if (retStr != nil && retStr.length > 0) {
        return [retStr copy];
    }else
    {
        return nil;
    }
}

#pragma mark - 计算
-(CGFloat)getHeightOfFont:(UIFont *)textFont widht:(CGFloat)textWidth
{
    CGSize requiredSize;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
        
        NSDictionary *attributes = @{ NSFontAttributeName: textFont, NSParagraphStyleAttributeName : paragraphStyle };
        
        
        CGRect rect = [self boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
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
        requiredSize = [self sizeWithFont:textFont
                        constrainedToSize:boundingSize
                            lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
  
    }
    
    return ceilf(requiredSize.height);
}

-(CGFloat)getWidthOfFont:(UIFont *)textFont height:(CGFloat)textHeight
{
    CGSize requiredSize;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
        
        NSDictionary *attributes = @{ NSFontAttributeName: textFont, NSParagraphStyleAttributeName : paragraphStyle };
        
        
        CGRect rect = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, textHeight)
                                         options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                      attributes:attributes
                                         context:nil];
        requiredSize = rect.size;
        
    }
    else
    {
        CGSize boundingSize = CGSizeMake(CGFLOAT_MAX, textHeight);
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"//"-Wdeprecated-declarations"
        //写在这个中间的代码,都不会被编译器提示-Wdeprecated-declarations类型的警告
        requiredSize = [self sizeWithFont:textFont
                        constrainedToSize:boundingSize
                            lineBreakMode:NSLineBreakByWordWrapping];

#pragma clang diagnostic pop
        
        
        
    }
    
    return ceilf(requiredSize.width);
}

/**
 *  去除字符串的前后空格
 *
 *  @return 字符串
 */
- (NSString*)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}




@end
