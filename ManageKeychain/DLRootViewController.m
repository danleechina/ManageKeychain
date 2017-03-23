//
//  DLRootViewController
//  ManageKeychain
//
//  Created by Dan.Lee on 2017/3/22.
//  Copyright © 2017年 Dan Lee. All rights reserved.
//

#import "DLRootViewController.h"
#import "DLDumpEntitlementsViewController.h"
#import "DLKeychainListViewController.h"
#import "DLManageKeychain.h"

#import <Security/Security.h>

@interface DLRootViewController()

@property (nonatomic, strong) NSArray *secClassArray;
@property (nonatomic, strong) NSDictionary *secClassToText;

@end

@implementation DLRootViewController

- (void)loadView {
	[super loadView];
    NSArray *keychainType = [DLManageKeychain getKeychainType];
    self.secClassArray = [@[@"Entitlements",] arrayByAddingObjectsFromArray:keychainType];
    
    NSMutableDictionary *dict = [DLManageKeychain getReadableKeychainType].mutableCopy;
    dict[@"Entitlements"] = @"Entitlements";
    self.secClassToText = dict.copy;
	self.title = @"keychain";
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.secClassArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}

	cell.textLabel.text = _secClassToText[_secClassArray[indexPath.row]];
	return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController* vc;
    if (indexPath.row == 0) {
        vc = [DLDumpEntitlementsViewController new];
        ((DLDumpEntitlementsViewController*)vc).dataArray = [DLManageKeychain dumpKeychainEntitlements];
    } else {
        vc = [DLKeychainListViewController new];
        vc.title = _secClassToText[_secClassArray[indexPath.row]];
        ((DLKeychainListViewController*)vc).kSecClassType = (__bridge CFTypeRef)_secClassArray[indexPath.row];
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
