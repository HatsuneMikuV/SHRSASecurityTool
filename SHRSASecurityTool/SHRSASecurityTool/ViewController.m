//
//  ViewController.m
//  SHRSASecurityTool
//
//  Created by angle on 2017/12/13.
//  Copyright © 2017年 angle. All rights reserved.
//

#import "ViewController.h"

#import "SHRSAEncryptor.h"
#import "SHDESEncryptor.h"
#import "SHMD5Tool.h"
#import "SHASEEncryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"\n\n===========================RSA本地密钥加解密=============================");
    [self SHRSALocalKey];
    NSLog(@"\n\n===========================RSA服务端密钥加解密============================");
    [self SHRSAServiceKey];
    NSLog(@"\n\n===========================DES加解密=============================");
    [self SHDESLocalKey];
    NSLog(@"\n\n===========================ASE加解密=============================");
    [self SHASELocalKey];
    NSLog(@"\n\n===========================MD5加密=============================");
    [self SHMD5];
    NSLog(@"\n\n========================================================");

    
}

- (void)SHRSALocalKey {
    //原始数据
    NSString *originalString = @"这是一段将要使用'.der'文件加密的字符串!---测试!!!";
    
    //使用.der和.p12中的公钥私钥加密解密
    NSString *public_key_path = [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil];
    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];
    
    NSString *encryptStr = [SHRSAEncryptor encryptString:originalString publicKeyWithContentsOfFile:public_key_path];
    NSLog(@"加密前:%@", originalString);
    NSLog(@"加密后:%@", encryptStr);
    NSLog(@"解密后:%@", [SHRSAEncryptor decryptString:encryptStr privateKeyWithContentsOfFile:private_key_path]);
}

- (void)SHRSAServiceKey {
    //原始数据
    NSString *originalString = @"这是一段将要使用'秘钥字符串'进行加密的字符串!---测试!!!";
    
    //使用字符串格式的公钥私钥加密解密
    NSString *encryptStr = [SHRSAEncryptor encryptString:originalString publicKey:@"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDTbZ6cNH9PgdF60aQKveLz3FTalyzHQwbp601y77SzmGHX3F5NoVUZbdK7UMdoCLK4FBziTewYD9DWvAErXZo9BFuI96bAop8wfl1VkZyyHTcznxNJFGSQd/B70/ExMgMBpEwkAAdyUqIjIdVGh1FQK/4acwS39YXwbS+IlHsPSQIDAQAB"];
    
    NSLog(@"加密前:%@", originalString);
    NSLog(@"加密后:%@", encryptStr);
    NSLog(@"解密后:%@", [SHRSAEncryptor decryptString:encryptStr privateKey:@"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBANNtnpw0f0+B0XrRpAq94vPcVNqXLMdDBunrTXLvtLOYYdfcXk2hVRlt0rtQx2gIsrgUHOJN7BgP0Na8AStdmj0EW4j3psCinzB+XVWRnLIdNzOfE0kUZJB38HvT8TEyAwGkTCQAB3JSoiMh1UaHUVAr/hpzBLf1hfBtL4iUew9JAgMBAAECgYA1tGeQmAkqofga8XtwuxEWDoaDS9k0+EKeUoXGxzqoT/GyiihuIafjILFhoUA1ndf/yCQaG973sbTDhtfpMwqFNQq13+JAownslTjWgr7Hwf7qplYW92R7CU0v7wFfjqm1t/2FKU9JkHfaHfb7qqESMIbO/VMjER9o4tEx58uXDQJBAO0O4lnWDVjr1gN02cqvxPOtTY6DgFbQDeaAZF8obb6XqvCqGW/AVms3Bh8nVlUwdQ2K/xte8tHxjW9FtBQTLd8CQQDkUncO35gAqUF9Bhsdzrs7nO1J3VjLrM0ITrepqjqtVEvdXZc+1/UrkWVaIigWAXjQCVfmQzScdbznhYXPz5fXAkEAgB3KMRkhL4yNpmKRjhw+ih+ASeRCCSj6Sjfbhx4XaakYZmbXxnChg+JB+bZNz06YBFC5nLZM7y/n61o1f5/56wJBALw+ZVzE6ly5L34114uG04W9x0HcFgau7MiJphFjgUdAtd/H9xfgE4odMRPUD3q9Me9LlMYK6MiKpfm4c2+3dzcCQQC8y37NPgpNEkd9smMwPpSEjPW41aMlfcKvP4Da3z7G5bGlmuICrva9YDAiaAyDGGCK8LxC8K6HpKrFgYrXkRtt"]);
}

- (void)SHDESLocalKey {
    //原始数据
    NSString *originalString = @"这是一段将要使用DES加密的字符串!---测试!!!";
    //随机字符串
    NSString *randomString = [SHDESEncryptor shuffledAlphabet:8];
    
    NSString *encryptStr = [SHDESEncryptor encryptUseDES:originalString key:randomString];
    NSLog(@"加密前:%@", originalString);
    NSLog(@"加密后:%@", encryptStr);
    NSLog(@"解密后:%@", [SHDESEncryptor decryptUseDES:encryptStr key:randomString]);
}

- (void)SHASELocalKey {
    //原始数据
    NSString *originalString = @"这是一段将要使用ASE加密的字符串!---测试!!!";
    //随机字符串
    NSString *randomString = [SHDESEncryptor shuffledAlphabet:8];
    
    NSString *encryptStr = [SHASEEncryptor encrypt:originalString password:randomString];
    NSLog(@"加密前:%@", originalString);
    NSLog(@"加密后:%@", encryptStr);
    NSLog(@"解密后:%@", [SHASEEncryptor decrypt:encryptStr password:randomString]);
}

- (void)SHMD5 {
    //原始数据
    NSString *originalString = @"这是一段将要使用MD5加密的字符串!---测试!!!";
    
    NSString *encryptStr = [SHMD5Tool md5:originalString];
    NSLog(@"加密前:%@", originalString);
    NSLog(@"加密后:%@", encryptStr);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
