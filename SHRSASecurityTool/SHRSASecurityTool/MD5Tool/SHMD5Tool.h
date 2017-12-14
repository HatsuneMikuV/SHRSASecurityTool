//
//  SHMD5Tool.h
//  SHRSASecurityTool
//
//  Created by angle on 2017/12/14.
//  Copyright © 2017年 angle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHMD5Tool : NSObject

/**
 MD5加密

 @param str 普通字符串
 @return md5字符串
 */
+ (NSString *)md5:(NSString *)str;

@end
