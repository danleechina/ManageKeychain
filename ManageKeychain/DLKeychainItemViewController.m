//
//  DLKeychainItemViewController.m
//  
//
//  Created by Dan.Lee on 2017/3/6.
//
//

#import "DLKeychainItemViewController.h"
#import "DLManageKeychain.h"

@interface DLKeychainItemViewController ()

@property (nonatomic, strong) UITextView* textView;

@end

@implementation DLKeychainItemViewController

- (UITextView*)textView {
    if (!_textView) {
        _textView = [UITextView new];
        _textView.frame = self.view.bounds;
    }
    return _textView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textView];
    self.textView.text = [DLManageKeychain getDetailItemDataForSecClass:self.kSecClassType data:self.data];
}

@end
