//
//  GDHttpTool.h
//  Ttime.COM
//
//  Created by Bigbang on 15-7-8.
//  Copyright (c) 2015年 TTime. All rights reserved.
//
#if 0

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface GDHttpTool : NSObject

/**
 *  getJSON
 *
 *  @param url     url description
 *  @param params  params description
 *  @param success success description
 *  @param failure failure description
 */
+ (void)getWithJSON:(NSString*)url params:(id)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  get请求
 *
 *  @param url     请求URL
 *  @param params  普通的请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)get:(NSString *)url params:(id)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
/**
 *  post  JSON
 *
 *  @param url     请求URL
 *  @param params  存进字典的数据
 *  @param files   文件参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postWithJson:(NSString *)url params:(id)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  post请求
 *
 *  @param url     请求URL
 *  @param params  普通的请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)post:(NSString *)url params:(id)params success:(void (^)(id responseObject))success failuer:(void (^)(NSError *error))failure;

/**
 *  文件上传
 *
 *  @param url     请求URL
 *  @param params  普通的请求参数
 *  @param files   文件参数(里面都是SkHttpFile模型)
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)post:(NSString *)url params:(id)params files:(NSArray *)files success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end

@interface GDHttpFile : NSObject
/** 文件参数名 */
@property (nonatomic,copy) NSString *name;
/**
 *  文件数据
 */
@property (nonatomic,strong) NSData *data;
/**
 *  文件类型
 */
@property (nonatomic,copy) NSString *mimeType;
/**
 *  文件名
 */
@property (nonatomic,copy) NSString *filename;

+ (instancetype)fileWithName:(NSString *)name data:(NSData *)data mimeType:(NSString *)mimeType filename:(NSString *)filename;
@end

#endif

