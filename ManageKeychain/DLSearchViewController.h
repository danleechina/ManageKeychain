//
//  DLSearchViewController.h
//  ManageKeychain
//
//  Created by Dan.Lee on 2017/3/22.
//  Copyright © 2017年 Dan Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLSearchViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, copy) NSArray* dataArray;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UISearchBar* searchBar;
@property (nonatomic, strong) NSArray* searchResultArray;


- (UITableViewCell *)getReusedCell;

@end
