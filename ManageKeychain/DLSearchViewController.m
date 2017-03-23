//
//  DLSearchViewController.m
//  ManageKeychain
//
//  Created by Dan.Lee on 2017/3/22.
//  Copyright © 2017年 Dan Lee. All rights reserved.
//

#import "DLSearchViewController.h"
#import "DLTableViewCell.h"

@interface DLSearchViewController ()

@end

@implementation DLSearchViewController

- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.frame = self.view.bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.searchBar;
    }
    return _tableView;
}

- (UISearchBar*)searchBar {
    if (!_searchBar) {
        _searchBar = [UISearchBar new];
        _searchBar.delegate = self;
        _searchBar.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44);
        _searchBar.placeholder = @"Input the substring to search";
    }
    return _searchBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UITableViewCell *)getReusedCell {
    static NSString *CellIdentifier = @"Cell";
    DLTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[DLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:11];
    }
    return cell;
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self getReusedCell];
    cell.textLabel.text = self.searchResultArray[indexPath.row];
    return cell;
}

#pragma mark - Scroll View Delegate
- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
}


#pragma mark - UISearchBar Delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
}

@end
