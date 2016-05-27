//
//  NetWorkTools.m
//  基础框架
//
//  Created by 叶慧伟 on 16/3/31.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "NetWorkTools.h"

NSString *const BASE_SERVER_URL = @"";

@protocol NetWorkToolsProxy <NSObject>

@optional
- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end

@interface NetWorkTools ()<NetWorkToolsProxy>

@end

@implementation NetWorkTools

+ (instancetype)shareTools{
    static NetWorkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]initWithBaseURL:[NSURL URLWithString:BASE_SERVER_URL]];
    });
    return instance;
}

//封装网络请求
- (void)requestWithMethod:(RequestMethod)method URLString:(NSString *)URLString parameters:(id)parameters finished:(RequestCallBack)finished{
    NSString *requestMethod = (method == RequsetMethodGet) ? @"GET" : @"POST";
    [[self dataTaskWithHTTPMethod:requestMethod
                       URLString:URLString
                      parameters:parameters
                  uploadProgress:nil
                downloadProgress:nil
                         success:^(NSURLSessionDataTask *task, id responseObject) {
        finished(responseObject, nil);
    }
                         failure:^(NSURLSessionDataTask *task, NSError *error) {
        finished(nil, error);
    }] resume];
}

//二进制数据
- (void)uploadData:(NSData *)data URLString:(NSString *)URLString name:(NSString *)name parameters:(id)parameters finished:(RequestCallBack)finished{
    [self POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //filename:自定
        //mimeType:问后台
        [formData appendPartWithFileData:data name:name fileName:@"OOXX" mimeType:@""];
    }
      progress:nil
       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finished(responseObject, nil);
    }
       failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finished(nil, error);
    }];
    
}

@end
