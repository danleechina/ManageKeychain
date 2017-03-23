//
//  DLKeychainItemViewController.h
//  
//
//  Created by Dan.Lee on 2017/3/6.
//
//

#import <UIKit/UIKit.h>

@interface DLKeychainItemViewController : UIViewController

@property (nonatomic, strong) NSDictionary* data;
@property (nonatomic, assign) CFTypeRef kSecClassType;

@end
