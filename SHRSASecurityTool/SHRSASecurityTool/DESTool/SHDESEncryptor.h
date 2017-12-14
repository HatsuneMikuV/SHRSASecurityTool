//
//  SHDESEncryptor.h
//  SHRSASecurityTool
//
//  Created by angle on 2017/12/14.
//  Copyright © 2017年 angle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHDESEncryptor : NSObject

/**
 加密方法

 @param plainText 未加密字符串
 @param key 密钥
 @return 加密后字符串
 */
+ (NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;

/**
  解密方法

 @param cipherText 加密字符串
 @param key 密钥
 @return 解密后字符串
 */
+ (NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;

/**
 生成指定位数的随机字符串

 @param length 字符串长度
 @return 随机字符串
 */
+ (NSString *)shuffledAlphabet:(NSUInteger)length;

@end
