//
//  NSString+Identifier.m
//  基础框架
//
//  Created by 叶慧伟 on 16/4/8.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "NSString+Identifier.h"
#import "KeychainItemWrapper.h"

@implementation NSString (Identifier)

+ (instancetype)getIdentifier{
    
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc]initWithIdentifier:@"UUID" accessGroup:@"自己的bundleidentifier"];
    
    NSString *identifierID = [keychainItem objectForKey:(id)CFBridgingRelease(kSecValueData)];
    //第一次可能为空
    if ([identifierID isEqualToString:@""]) {
        CFUUIDRef uuIDRef = CFUUIDCreate(kCFAllocatorDefault);
        identifierID = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuIDRef));
        [keychainItem setObject:identifierID forKey:(id)CFBridgingRelease(kSecValueData)];
    }
    
    return identifierID;

}

@end
