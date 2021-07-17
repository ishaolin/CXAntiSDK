//
//  CXRSAUtils.h
//  Pods
//
//  Created by wshaolin on 2019/3/27.
//

#import <CXFoundation/CXFoundation.h>

@interface CXRSAUtils : NSObject

+ (NSString *)encrypt:(NSString *)text;

+ (NSString *)encrypt:(NSString *)text publicKey:(NSString *)publicKey;

@end
