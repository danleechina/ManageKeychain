//
//  DLManageKeychain.h
//  ManageKeychain
//
//  Created by Dan.Lee on 2017/3/23.
//  Copyright © 2017年 Dan Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLManageKeychain : NSObject

+ (NSArray *)getKeychainType;
+ (NSDictionary *)getReadableKeychainType;

+ (NSArray *)getGenericPasswordItemAttributes;
+ (NSArray *)getInternetPasswordItemAttributes;
+ (NSArray *)getCertificateItemAttributes;
+ (NSArray *)getKeyItemAttributes;
+ (NSArray *)getIdentityItemAttributes;

+ (NSArray *)getBriefGenericPasswordItemAttributes;
+ (NSArray *)getBriefInternetPasswordItemAttributes;
+ (NSArray *)getBriefCertificateItemAttributes;
+ (NSArray *)getBriefKeyItemAttributes;
+ (NSArray *)getBriefIdentityItemAttributes;

+ (NSDictionary *)getReadableGenericPasswordItemAttributes;
+ (NSDictionary *)getReadableInternetPasswordItemAttributes;
+ (NSDictionary *)getReadableCertificateItemAttributes;
+ (NSDictionary *)getReadableKeyItemAttributes;
+ (NSDictionary *)getReadableIdentityItemAttributes;

+ (NSArray<NSString*>*)dumpKeychainEntitlements;
+ (NSArray *)getKeychainObjectsForSecClass:(CFTypeRef)kSecClassType;
+ (NSString *)getBriefItemDataForSecClass:(CFTypeRef)kSecClassType data:(NSDictionary *)data;
+ (NSString *)getDetailItemDataForSecClass:(CFTypeRef)kSecClassType data:(NSDictionary *)data;

@end
