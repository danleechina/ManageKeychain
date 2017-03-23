//
//  main.m
//  ManageKeychain
//
//  Created by Dan.Lee on 2017/3/22.
//  Copyright © 2017年 Dan Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLAppDelegate.h"

int main(int argc, char * argv[]) {
    setuid(0);
    setgid(0);
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass(DLAppDelegate.class));
    }
}
