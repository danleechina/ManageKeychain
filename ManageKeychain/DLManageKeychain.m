//
//  DLManageKeychain.m
//  ManageKeychain
//
//  Created by Dan.Lee on 2017/3/23.
//  Copyright © 2017年 Dan Lee. All rights reserved.
//

#import "DLManageKeychain.h"
#import <Security/Security.h>
#import <sqlite3.h>

@implementation DLManageKeychain


+ (NSArray *)getKeychainType {
    CFStringRef attrs[] = {
        kSecClassGenericPassword,
        kSecClassInternetPassword,
        kSecClassIdentity,
        kSecClassCertificate,
        kSecClassKey,
    };
    CFArrayRef anArray = CFArrayCreate(NULL, (void *)attrs, 5, &kCFTypeArrayCallBacks);
    return CFBridgingRelease(anArray);
}

+ (NSDictionary *)getReadableKeychainType {
    NSArray *keychainTypeArray = [DLManageKeychain getKeychainType];
    NSArray *readableKeychainType = @[
                                     @"kSecClassGenericPassword",
                                     @"kSecClassInternetPassword",
                                     @"kSecClassIdentity",
                                     @"kSecClassCertificate",
                                     @"kSecClassKey",];
    return [[NSDictionary alloc] initWithObjects:readableKeychainType forKeys:keychainTypeArray];
}

+ (NSArray *)getBriefGenericPasswordItemAttributes {
    CFStringRef attrs[] = {
        kSecAttrAccessGroup,
        kSecAttrModificationDate,
        kSecAttrDescription,
        kSecAttrComment,
        kSecAttrCreator,
        kSecAttrType,
        kSecAttrLabel,
        kSecAttrAccount,
    };
    CFArrayRef anArray = CFArrayCreate(NULL, (void *)attrs, 8, &kCFTypeArrayCallBacks);
    return CFBridgingRelease(anArray);
}

+ (NSArray *)getGenericPasswordItemAttributes {
    CFStringRef attrs[] = {
        kSecAttrAccessible,
        kSecAttrAccessControl,
        kSecAttrAccessGroup,
        kSecAttrCreationDate,
        kSecAttrModificationDate,
        kSecAttrDescription,
        kSecAttrComment,
        kSecAttrCreator,
        kSecAttrType,
        kSecAttrLabel,
        kSecAttrIsInvisible,
        kSecAttrIsNegative,
        kSecAttrAccount,
        kSecAttrService,
        kSecAttrGeneric,
        kSecAttrSynchronizable,
    };
    CFArrayRef anArray = CFArrayCreate(NULL, (void *)attrs, 16, &kCFTypeArrayCallBacks);
    return CFBridgingRelease(anArray);
}

+ (NSDictionary *)getReadableGenericPasswordItemAttributes {
    NSArray *genericPasswordArray = [DLManageKeychain getGenericPasswordItemAttributes];
    NSArray *readableGenericPasswordArray = @[
                                             @"kSecAttrAccessible",
                                             @"kSecAttrAccessControl",
                                             @"kSecAttrAccessGroup",
                                             @"kSecAttrCreationDate",
                                             @"kSecAttrModificationDate",
                                             @"kSecAttrDescription",
                                             @"kSecAttrComment",
                                             @"kSecAttrCreator",
                                             @"kSecAttrType",
                                             @"kSecAttrLabel",
                                             @"kSecAttrIsInvisible",
                                             @"kSecAttrIsNegative",
                                             @"kSecAttrAccount",
                                             @"kSecAttrService",
                                             @"kSecAttrGeneric",
                                             @"kSecAttrSynchronizable",];
    return [[NSDictionary alloc] initWithObjects:readableGenericPasswordArray forKeys:genericPasswordArray];
}

+ (NSArray *)getBriefInternetPasswordItemAttributes {
    CFStringRef attrs[] = {
        kSecAttrAccessGroup,
        kSecAttrModificationDate,
        kSecAttrDescription,
        kSecAttrComment,
        kSecAttrCreator,
        kSecAttrType,
        kSecAttrLabel,
        kSecAttrAccount,
        kSecAttrSecurityDomain,
        kSecAttrServer,
    };
    CFArrayRef anArray = CFArrayCreate(NULL, (void *)attrs, 10, &kCFTypeArrayCallBacks);
    return CFBridgingRelease(anArray);
}

+ (NSArray *)getInternetPasswordItemAttributes {
    CFStringRef attrs[] = {
        kSecAttrAccessible,
        kSecAttrAccessControl,
        kSecAttrAccessGroup,
        kSecAttrCreationDate,
        kSecAttrModificationDate,
        kSecAttrDescription,
        kSecAttrComment,
        kSecAttrCreator,
        kSecAttrType,
        kSecAttrLabel,
        kSecAttrIsInvisible,
        kSecAttrIsNegative,
        kSecAttrAccount,
        kSecAttrSecurityDomain,
        kSecAttrServer,
        kSecAttrProtocol,
        kSecAttrAuthenticationType,
        kSecAttrPort,
        kSecAttrPath,
        kSecAttrSynchronizable,
    };
    CFArrayRef anArray = CFArrayCreate(NULL, (void *)attrs, 20, &kCFTypeArrayCallBacks);
    return CFBridgingRelease(anArray);
}


+ (NSDictionary *)getReadableInternetPasswordItemAttributes {
    NSArray *internetPassword = [DLManageKeychain getInternetPasswordItemAttributes];
    NSArray *readableInternetPassword = @[
                                         @"kSecAttrAccessible",
                                         @"kSecAttrAccessControl",
                                         @"kSecAttrAccessGroup",
                                         @"kSecAttrCreationDate",
                                         @"kSecAttrModificationDate",
                                         @"kSecAttrDescription",
                                         @"kSecAttrComment",
                                         @"kSecAttrCreator",
                                         @"kSecAttrType",
                                         @"kSecAttrLabel",
                                         @"kSecAttrIsInvisible",
                                         @"kSecAttrIsNegative",
                                         @"kSecAttrAccount",
                                         @"kSecAttrSecurityDomain",
                                         @"kSecAttrServer",
                                         @"kSecAttrProtocol",
                                         @"kSecAttrAuthenticationType",
                                         @"kSecAttrPort",
                                         @"kSecAttrPath",
                                         @"kSecAttrSynchronizable",];
    return [[NSDictionary alloc] initWithObjects:readableInternetPassword forKeys:internetPassword];
}

+ (NSArray *)getBriefCertificateItemAttributes {
    CFStringRef attrs[] = {
        kSecAttrAccessGroup,
        kSecAttrCertificateType,
        kSecAttrLabel,
        kSecAttrSubject,
        kSecAttrIssuer,
        kSecAttrSerialNumber,
        kSecAttrSubjectKeyID,
        kSecAttrPublicKeyHash,
    };
    CFArrayRef anArray = CFArrayCreate(NULL, (void *)attrs, 8, &kCFTypeArrayCallBacks);
    return CFBridgingRelease(anArray);
}

+ (NSArray *)getCertificateItemAttributes {
    CFStringRef attrs[] = {
        kSecAttrAccessible,
        kSecAttrAccessControl,
        kSecAttrAccessGroup,
        kSecAttrCertificateType,
        kSecAttrCertificateEncoding,
        kSecAttrLabel,
        kSecAttrSubject,
        kSecAttrIssuer,
        kSecAttrSerialNumber,
        kSecAttrSubjectKeyID,
        kSecAttrPublicKeyHash,
        kSecAttrSynchronizable,
    };
    CFArrayRef anArray = CFArrayCreate(NULL, (void *)attrs, 12, &kCFTypeArrayCallBacks);
    return CFBridgingRelease(anArray);
}


+ (NSDictionary *)getReadableCertificateItemAttributes {
    NSArray *certItemArray = [DLManageKeychain getCertificateItemAttributes];
    NSArray *readableCertItemArray = @[
                                     @"kSecAttrAccessible",
                                     @"kSecAttrAccessControl",
                                     @"kSecAttrAccessGroup",
                                     @"kSecAttrCertificateType",
                                     @"kSecAttrCertificateEncoding",
                                     @"kSecAttrLabel",
                                     @"kSecAttrSubject",
                                     @"kSecAttrIssuer",
                                     @"kSecAttrSerialNumber",
                                     @"kSecAttrSubjectKeyID",
                                     @"kSecAttrPublicKeyHash",
                                     @"kSecAttrSynchronizable",];
    return [[NSDictionary alloc] initWithObjects:readableCertItemArray forKeys:certItemArray];
}

+ (NSArray *)getBriefKeyItemAttributes {
    CFStringRef attrs[] = {
        kSecAttrAccessGroup,
        kSecAttrKeyClass,
        kSecAttrLabel,
        kSecAttrApplicationLabel,
        kSecAttrIsPermanent,
        kSecAttrApplicationTag,
        kSecAttrKeyType,
    };
    CFArrayRef anArray = CFArrayCreate(NULL, (void *)attrs, 7, &kCFTypeArrayCallBacks);
    return CFBridgingRelease(anArray);
}

+ (NSArray *)getKeyItemAttributes {
    CFStringRef attrs[] = {
        kSecAttrAccessible,
        kSecAttrAccessControl,
        kSecAttrAccessGroup,
        kSecAttrKeyClass,
        kSecAttrLabel,
        kSecAttrApplicationLabel,
        kSecAttrIsPermanent,
        kSecAttrApplicationTag,
        kSecAttrKeyType,
        kSecAttrKeySizeInBits,
        kSecAttrEffectiveKeySize,
        kSecAttrCanEncrypt,
        kSecAttrCanDecrypt,
        kSecAttrCanDerive,
        kSecAttrCanSign,
        kSecAttrCanVerify,
        kSecAttrCanWrap,
        kSecAttrCanUnwrap,
        kSecAttrSynchronizable,
    };
    CFArrayRef anArray = CFArrayCreate(NULL, (void *)attrs, 19, &kCFTypeArrayCallBacks);
    return CFBridgingRelease(anArray);
}


+ (NSDictionary *)getReadableKeyItemAttributes {
    NSArray *keyItemArray = [DLManageKeychain getKeyItemAttributes];
    NSArray *readableKeyItemArray = @[
                                     @"kSecAttrAccessible",
                                     @"kSecAttrAccessControl",
                                     @"kSecAttrAccessGroup",
                                     @"kSecAttrKeyClass",
                                     @"kSecAttrLabel",
                                     @"kSecAttrApplicationLabel",
                                     @"kSecAttrIsPermanent",
                                     @"kSecAttrApplicationTag",
                                     @"kSecAttrKeyType",
                                     @"kSecAttrKeySizeInBits",
                                     @"kSecAttrEffectiveKeySize",
                                     @"kSecAttrCanEncrypt",
                                     @"kSecAttrCanDecrypt",
                                     @"kSecAttrCanDerive",
                                     @"kSecAttrCanSign",
                                     @"kSecAttrCanVerify",
                                     @"kSecAttrCanWrap",
                                     @"kSecAttrCanUnwrap",
                                     @"kSecAttrSynchronizable",];
    return [[NSDictionary alloc] initWithObjects:readableKeyItemArray forKeys:keyItemArray];
}

+ (NSArray *)getBriefIdentityItemAttributes {
    NSArray *keyItemAttrs = [DLManageKeychain getBriefKeyItemAttributes];
    NSArray *certItemAttrs = [DLManageKeychain getBriefCertificateItemAttributes];
    NSArray *combineAttrs = [keyItemAttrs arrayByAddingObjectsFromArray:certItemAttrs];
    return [[NSSet setWithArray:combineAttrs] allObjects].copy;
}

+ (NSArray *)getIdentityItemAttributes {
    NSArray *keyItemAttrs = [DLManageKeychain getKeyItemAttributes];
    NSArray *certItemAttrs = [DLManageKeychain getCertificateItemAttributes];
    NSArray *combineAttrs = [keyItemAttrs arrayByAddingObjectsFromArray:certItemAttrs];
    return [[NSSet setWithArray:combineAttrs] allObjects].copy;
}

+ (NSDictionary *)getReadableIdentityItemAttributes {
    NSDictionary *keyItemAttrs = [DLManageKeychain getReadableKeyItemAttributes];
    NSDictionary *certItemAttrs = [DLManageKeychain getReadableCertificateItemAttributes];
    NSMutableDictionary *result = keyItemAttrs.mutableCopy;
    for (id keys in certItemAttrs.allKeys) {
        if (result[keys] == nil) {
            result[keys] = certItemAttrs[keys];
        }
    }
    return result;
}

+ (NSArray<NSString *> *)dumpKeychainEntitlements {
    NSMutableArray* retArray = [NSMutableArray new];
    NSString *databasePath = @"/var/Keychains/keychain-2.db";
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:databasePath]) {
        return nil;
    }
    
    const char *dbpath = [databasePath UTF8String];
    sqlite3 *keychainDB;
    sqlite3_stmt *statement;
    int status = sqlite3_open(dbpath, &keychainDB);
    if (status == SQLITE_OK) {
        const char *query_stmt = "SELECT DISTINCT agrp FROM genp UNION SELECT DISTINCT agrp FROM inet";
        
        if (sqlite3_prepare_v2(keychainDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while(sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *group = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                
                [retArray addObject:group];
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog( @"Unknown error querying keychain database\n");
        }
        sqlite3_close(keychainDB);
    }
    else {
        NSLog(@"Unknown error opening keychain database, status=%d\n", status);
    }
    return retArray;
}

+ (NSArray *)getKeychainObjectsForSecClass:(CFTypeRef)kSecClassType {
    CFRetain(kSecClassType);
    NSMutableDictionary *genericQuery = [[NSMutableDictionary alloc] init];
    [genericQuery setObject:(__bridge id)kSecClassType forKey:(id)kSecClass];
    [genericQuery setObject:(id)kSecMatchLimitAll forKey:(id)kSecMatchLimit];
    [genericQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnAttributes];
    [genericQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnRef];
    [genericQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    
    NSArray *keychainItems = nil;
    CFArrayRef arrayRef = NULL;
    OSStatus status = SecItemCopyMatching((CFDictionaryRef)genericQuery, (CFTypeRef *)&arrayRef);
    if (status == noErr) {
        keychainItems = (__bridge_transfer NSArray *)arrayRef;
    }
    CFRelease(kSecClassType);
    return keychainItems.copy;
}

+ (NSString *)getBriefItemDataForSecClass:(CFTypeRef)kSecClassType data:(NSDictionary *)data {
//    static NSCache *cache;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        cache = [NSCache new];
//    });
//    if ([cache objectForKey:data]) {
//        return [cache objectForKey:data];
    //    }
    CFRetain(kSecClassType);
    NSArray *briefAttrs;
    if (kSecClassType == kSecClassGenericPassword) {
        briefAttrs = [DLManageKeychain getBriefGenericPasswordItemAttributes];
    } else if (kSecClassType == kSecClassInternetPassword) {
        briefAttrs = [DLManageKeychain getBriefInternetPasswordItemAttributes];
    } else if (kSecClassType == kSecClassIdentity) {
        briefAttrs = [DLManageKeychain getBriefIdentityItemAttributes];
    } else if (kSecClassType == kSecClassCertificate) {
        briefAttrs = [DLManageKeychain getBriefCertificateItemAttributes];
    } else if (kSecClassType == kSecClassKey) {
        briefAttrs = [DLManageKeychain getBriefKeyItemAttributes];
    } else {
        briefAttrs = nil;
    }
    NSMutableString *result = @"".mutableCopy;
    for (id attr in briefAttrs) {
        id itemData = data[attr];
        if ([itemData isKindOfClass:[NSData class]]
            && [[NSString alloc] initWithData:((NSData *)itemData) encoding:NSUTF8StringEncoding]) {
            [result appendString:[[NSString alloc] initWithData:((NSData *)itemData) encoding:NSUTF8StringEncoding].copy];
        } else if ([itemData respondsToSelector:@selector(description)]) {
            NSString *desc = ((NSObject *)itemData).description.copy;
            [result appendString:desc];
        }
        [result appendString:@"\n"];
    }
    CFRelease(kSecClassType);
//    [cache setObject:result.copy forKey:data];
//    return [cache objectForKey:data];
    return result.copy;
}

+ (NSString *)getDetailItemDataForSecClass:(CFTypeRef)kSecClassType data:(NSDictionary *)data {
    CFRetain(kSecClassType);
//    static NSCache *cache;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        cache = [NSCache new];
//    });
//    if ([cache objectForKey:data]) {
//        return [cache objectForKey:data];
//    }
    NSArray *attrs;
    NSDictionary *dicts;
    if (kSecClassType == kSecClassGenericPassword) {
        attrs = [DLManageKeychain getGenericPasswordItemAttributes];
        dicts = [DLManageKeychain getReadableGenericPasswordItemAttributes];
    } else if (kSecClassType == kSecClassInternetPassword) {
        attrs = [DLManageKeychain getInternetPasswordItemAttributes];
        dicts = [DLManageKeychain getReadableInternetPasswordItemAttributes];
    } else if (kSecClassType == kSecClassIdentity) {
        attrs = [DLManageKeychain getIdentityItemAttributes];
        dicts = [DLManageKeychain getReadableIdentityItemAttributes];
    } else if (kSecClassType == kSecClassCertificate) {
        attrs = [DLManageKeychain getCertificateItemAttributes];
        dicts = [DLManageKeychain getReadableCertificateItemAttributes];
    } else if (kSecClassType == kSecClassKey) {
        attrs = [DLManageKeychain getKeyItemAttributes];
        dicts = [DLManageKeychain getReadableKeyItemAttributes];
    } else {
        attrs = nil;
    }
    NSMutableString *result = @"".mutableCopy;
    for (id attr in attrs) {
        id itemData = data[attr];
        [result appendString:dicts[attr]];
        [result appendString:@": "];
        if ([itemData isKindOfClass:[NSData class]]
            && [[NSString alloc] initWithData:((NSData *)itemData) encoding:NSUTF8StringEncoding]) {
            [result appendString:[[NSString alloc] initWithData:((NSData *)itemData) encoding:NSUTF8StringEncoding].copy];
        } else if ([itemData respondsToSelector:@selector(description)]) {
            NSString *desc = ((NSObject *)itemData).description.copy;
            [result appendString:desc];
        }
        [result appendString:@"\n"];
        [result appendString:@"\n"];
    }
    CFRelease(kSecClassType);
//    [cache setObject:result.copy forKey:data];
//    return [cache objectForKey:data];
    return result.copy;
}

@end
