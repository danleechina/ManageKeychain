//
//  DLDumpEntitlementsViewController.m
//  
//
//  Created by Dan.Lee on 2017/3/6.
//
//

#import "DLDumpEntitlementsViewController.h"

@interface DLDumpEntitlementsViewController ()

@end

@implementation DLDumpEntitlementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Dump Entitlements";
    self.searchResultArray = self.dataArray;
    [self.view addSubview:self.tableView];
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
    [self.view endEditing:YES];
}


#pragma mark - UISearchBar Delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (!searchText || [searchText isEqualToString:@""]) {
        self.searchResultArray = self.dataArray;
        [self.tableView reloadData];
        return ;
    }
    NSMutableArray *retArray = [NSMutableArray new];
    for (NSString* string in self.dataArray) {
        if (string && [string.lowercaseString rangeOfString:searchText.lowercaseString].location != NSNotFound) {
            [retArray addObject:string];
            NSLog(@"%@", string);
        }
    }
    self.searchResultArray = retArray.copy;
    [self.tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchResultArray = self.dataArray;
    [self.tableView reloadData];
}

@end
