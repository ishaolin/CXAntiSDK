//
//  CXRSAUtils.m
//  Pods
//
//  Created by wshaolin on 2019/3/27.
//

#import "CXRSAUtils.h"

#define CX_RSA_PUBLIC_KEY  @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCwSxZNGss3zQcuKVmqg3x/7J/gp91YGLN6eDRFVX8VvSF/vjWMserfk6yAT4J4kDTonT1o2XQr3xK8HBWDQb5B0NOupDLj847pQ/Y1vnF7yolWQsByzSNoQ5bwgQ5etQupH8qs5/a8ijTOY5lxDRDpVBJaEvvSwf3xg6UlAWd4UQIDAQAB"

@implementation CXRSAUtils

+ (NSString *)encrypt:(NSString *)text{
    if(!text){
        return nil;
    }
    
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    data = [CXUCryptor encryptDataByRSA:data publicKey:CX_RSA_PUBLIC_KEY];
    if(!data){
        return nil;
    }
    
    data = [data base64EncodedDataWithOptions:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
