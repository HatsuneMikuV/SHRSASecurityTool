//
//  NSData+Base64.h
//  SHRSASecurityTool
//
//  Created by angle on 2017/12/14.
//  Copyright © 2017年 angle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSString;

@interface NSData (Base64Additions)

+ (NSData *)base64DataFromString:(NSString *)string;

@end
