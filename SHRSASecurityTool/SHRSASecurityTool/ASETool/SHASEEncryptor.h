//
//  SHASEEncryptor.h
//  SHRSASecurityTool
//
//  Created by angle on 2017/12/14.
//  Copyright © 2017年 angle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHASEEncryptor : NSObject

/**
 加密

 @param message 普通字符串
 @param password 密钥
 @return 加密字符串
 */
+ (NSString *)encrypt:(NSString *)message password:(NSString *)password;

/**
 解密

 @param base64EncodedString 加密字符串
 @param password 密钥
 @return 普通字符串
 */
+ (NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password;

@end
