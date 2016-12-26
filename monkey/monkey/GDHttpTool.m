//
//  GDHttpTool.m
//  Ttime.COM
//
//  Created by Bigbang on 15-7-8.
//  Copyright (c) 2015年 TTime. All rights reserved.
//
#if 0

#import "GDHttpTool.h"

@implementation GDHttpTool


+ (void)get:(NSString *)url params:(id)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建一个请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    //
    //    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];  //@”application/json”, @”text/json”, @”text/javascript”
    // 2.发送请求
    
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];
}

+ (void)post:(NSString *)url params:(id)params success:(void (^)(id))success failuer:(void (^)(NSError *))failure
{
    // 1.创建一个请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    // 2.发送请求
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
        GDLog(@"JJSON is %@",responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


#pragma mark - 封装的 JSON POST

/**
 *  POST JSON
 *
 *  @param url     url
 *  @param params  params 字典里存的
 *  @param success success
 *  @param failure failure
 */
+ (void)postWithJson:(NSString *)url params:(id)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
        GDLog(@"JSON: %@",responseObject);
        //  [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
        GDLog(@"Error: %@",error);
    }];
    
}


/**
 *  getWithJSON
 *
 *  @param url     url
 *  @param params  params
 *  @param success success
 *  @param failure failure
 */
+ (void)getWithJSON:(NSString*)url params:(id)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    // 1.创建一个请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    // 2.发送请求
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];
    
    
}


//上传
+ (void)post:(NSString *)url params:(id)params files:(NSArray *)files success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建一个请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    // 2.发送请求
    [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        for (GDHttpFile *file in files) {
            [formData appendPartWithFileData:file.data name:file.name fileName:file.filename mimeType:file.mimeType];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"成功: %@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"网络繁忙,请稍后再试: %@",error);
    }];
    
}

@end

@implementation GDHttpFile

+ (instancetype)fileWithName:(NSString *)name data:(NSData *)data mimeType:(NSString *)mimeType filename:(NSString *)filename
{
    GDHttpFile *file = [[self alloc]init];
    
    file.name = name;
    
    file.data = data;
    
    file.mimeType = mimeType;
    
    file.filename = filename;
    
    return file;
    
}

@end

#endif