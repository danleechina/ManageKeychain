//
//  DLAppDelegate
//  ManageKeychain
//
//  Created by Dan.Lee on 2017/3/22.
//  Copyright © 2017年 Dan Lee. All rights reserved.
//

#import "DLAppDelegate.h"
#import "DLRootViewController.h"

@implementation DLAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	self.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[DLRootViewController alloc] init]];
	self.window.rootViewController = self.rootViewController;
	[self.window makeKeyAndVisible];
}

@end
