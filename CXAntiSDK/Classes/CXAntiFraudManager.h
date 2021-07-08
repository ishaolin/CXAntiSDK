//
//  CXAntiFraudManager.h
//  Pods
//
//  Created by wshaolin on 2019/3/27.
//

#import <Foundation/Foundation.h>

@interface CXAntiFraudManager : NSObject

+ (NSDictionary<NSString *, id> *)antiFraudParams;

+ (NSString *)antiFraudJson;

+ (NSDictionary<NSString *, id> *)antiFraudDataParam;

+ (NSDictionary<NSString *, id> *)dataTrackingAntiFraudParams;

+ (NSString *)dataTrackingAntiFraudJson;

+ (NSDictionary<NSString *, id> *)dataTrackingAntiFraudDataParam;

@end
