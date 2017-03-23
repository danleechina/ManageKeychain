//
//  DLKeychainListViewController.h
//  
//
//  Created by Dan.Lee on 2017/3/6.
//
//

#import <UIKit/UIKit.h>
#import "DLSearchViewController.h"

@interface DLKeychainListViewController : DLSearchViewController

@property (nonatomic, assign) CFTypeRef kSecClassType;

@end
