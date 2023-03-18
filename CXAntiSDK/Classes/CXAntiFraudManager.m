//
//  CXAntiFraudManager.m
//  Pods
//
//  Created by wshaolin on 2019/3/27.
//

#import "CXAntiFraudManager.h"
#import <CXNetSDK/CXNetSDK.h>
#import <CXUIKit/CXUIKit.h>
#import "CXRSAUtils.h"

@implementation CXAntiFraudManager

+ (NSDictionary<NSString *, id> *)antiFraudParams{
    NSMutableDictionary<NSString *, id> *params = [NSMutableDictionary dictionary];
    [params cx_setObject:@(TARGET_IPHONE_SIMULATOR) forKey:@"simulator"];
    
    CMDeviceMotion *motion = [CXMotionManager sharedManager].motion;
    if(motion){
        [params cx_setString:@(motion.gravity.x).stringValue forKey:@"gravityX"];
        [params cx_setString:@(motion.gravity.y).stringValue forKey:@"gravityY"];
        [params cx_setString:@(motion.gravity.z).stringValue forKey:@"gravityZ"];
        [params cx_setString:@(motion.userAcceleration.x).stringValue forKey:@"accelerationX"];
        [params cx_setString:@(motion.userAcceleration.y).stringValue forKey:@"accelerationY"];
        [params cx_setString:@(motion.userAcceleration.z).stringValue forKey:@"accelerationZ"];
        [params cx_setString:@(motion.rotationRate.x).stringValue forKey:@"rotationRateX"];
        [params cx_setString:@(motion.rotationRate.y).stringValue forKey:@"rotationRateY"];
        [params cx_setString:@(motion.rotationRate.z).stringValue forKey:@"rotationRateZ"];
    }
    
    return [params copy];
}

+ (NSString *)antiFraudJson{
    return [NSJSONSerialization cx_stringWithJSONObject:[self antiFraudParams]];
}

+ (NSDictionary<NSString *, id> *)antiFraudDataParam{
    NSString *base64String = [CXRSAUtils encrypt:[self antiFraudJson]];
    if(base64String){
        return @{@"mushroom" : base64String};
    }
    
    return nil;
}

+ (NSDictionary<NSString *, id> *)dataTrackingAntiFraudParams{
    NSMutableDictionary<NSString *, id> *params = [NSMutableDictionary dictionary];
    [params addEntriesFromDictionary:[self antiFraudParams]];
    NSDictionary<NSString *, NSString *> *WiFiInfo = [CXNetworkManager sharedManager].WiFiInfo;
    [params cx_setObject:WiFiInfo[CX_WIFI_SSID] forKey:@"ssid"];
    [params cx_setObject:WiFiInfo[CX_WIFI_BSSID] forKey:@"bssid"];
    [params cx_setObject:[UIDevice currentDevice].identifierForVendor.UUIDString forKey:@"idfv"];
    [params cx_setObject:[CXNetworkManager sharedManager].ipAddress ?: [CXNetworkManager sharedManager].gatewayAddress forKey:@"cellular_ip"];
    [params cx_setObject:@([UIDevice currentDevice].batteryState) forKey:@"battery_state"];
    [params cx_setObject:@([UIDevice currentDevice].batteryLevel).stringValue forKey:@"battery_level"];
    [params cx_setObject:@([UIScreen mainScreen].brightness).stringValue forKey:@"brightness"];
    [params cx_setObject:[UIDevice currentDevice].cx_currentLanguage forKey:@"language"];
    [params cx_setObject:@([UIDevice currentDevice].cx_physicalMemory) forKey:@"total_ram"];
    [params cx_setObject:@([UIDevice currentDevice].cx_availableMemory) forKey:@"available_ram"];
    [params cx_setObject:@([UIDevice currentDevice].cx_totalDiskSize) forKey:@"total_rom"];
    [params cx_setObject:@([UIDevice currentDevice].cx_availableDiskSize) forKey:@"available_rom"];
    [params cx_setObject:[NSTimeZone localTimeZone].name forKey:@"time_zone"];
    [params cx_setObject:[UIDevice currentDevice].cx_cpuType forKey:@"cpu_type"];
    
    return [params copy];
}

+ (NSString *)dataTrackingAntiFraudJson{
    return [NSJSONSerialization cx_stringWithJSONObject:[self dataTrackingAntiFraudParams]];
}

+ (NSDictionary<NSString *, id> *)dataTrackingAntiFraudDataParam{
    NSString *base64String = [CXRSAUtils encrypt:[self dataTrackingAntiFraudJson]];
    if(base64String){
        return @{@"mushroom" : base64String};
    }
    
    return nil;
}

@end
