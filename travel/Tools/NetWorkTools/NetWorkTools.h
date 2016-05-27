//
//  NetWorkTools.h
//  基础框架
//
//  Created by 叶慧伟 on 16/3/31.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void (^RequestCallBack)(id result, NSError *error);

typedef enum {
    RequsetMethodGet = 0,
    RequestMethodPost
}RequestMethod;

@interface NetWorkTools : AFHTTPSessionManager

+ (instancetype)shareTools;

@end
