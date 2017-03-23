//
//  DLKeychainListViewController.m
//  
//
//  Created by Dan.Lee on 2017/3/6.
//
//

#import "DLKeychainListViewController.h"
#import "DLKeychainItemViewController.h"
#import "DLManageKeychain.h"
#import "DLTableViewCell.h"

@interface DLKeychainListViewController ()

@property (nonatomic, strong) UIRefreshControl *control;

@end

@implementation DLKeychainListViewController

- (UIRefreshControl *)control {
    if (!_control) {
        _control = [[UIRefreshControl alloc] init];
        [_control addTarget:self action:@selector(refreshControl) forControlEvents:UIControlEventValueChanged];
    }
    return _control;
}

- (void)refreshControl {
    if (self.control.isRefreshing) {
        [self fetchData];
    } else {
        
    }
}

- (void)fetchData {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *array = [DLManageKeychain getKeychainObjectsForSecClass:self.kSecClassType];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.searchResultArray = array.copy;
            self.dataArray = array.copy;
            [self.tableView reloadData];
            [self.control endRefreshing];
        });
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchResultArray = self.dataArray;
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.control];
    [self.control beginRefreshing];
    [self fetchData];
}

#pragma mark - Table View Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DLTableViewCell *cell = (DLTableViewCell *)[self getReusedCell];
    NSDictionary *item = self.searchResultArray[indexPath.row];
    cell.textLabel.text = [DLManageKeychain getBriefItemDataForSecClass:self.kSecClassType data:item];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DLKeychainItemViewController* vc = [DLKeychainItemViewController new];
    vc.data = self.searchResultArray[indexPath.row];
    vc.kSecClassType = self.kSecClassType;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = self.searchResultArray[indexPath.row];
    NSString *theText = [DLManageKeychain getBriefItemDataForSecClass:self.kSecClassType data:item];
    CGRect requiredHeight = [theText boundingRectWithSize:CGSizeMake(self.view.frame.size.width, 9999)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]}
                                                  context:nil];
    return requiredHeight.size.height;
}

#pragma mark - Scroll View Delegate
- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
    [self.view endEditing:YES];
}


#pragma mark - UISearchBar Delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(search:) object:nil];
    [self performSelector:@selector(search:) withObject:searchText afterDelay:1];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchResultArray = self.dataArray;
    [self.tableView reloadData];
}

- (void)search:(NSString *)searchText {
    if (!searchText || [searchText isEqualToString:@""]) {
        self.searchResultArray = self.dataArray;
        [self.tableView reloadData];
        return;
    }
    NSMutableArray *retArray = [NSMutableArray new];
    for (NSDictionary* item in self.dataArray) {
        NSString *string = [DLManageKeychain getBriefItemDataForSecClass:self.kSecClassType data:item];
        if (string && [string.lowercaseString rangeOfString:searchText.lowercaseString].location != NSNotFound) {
            [retArray addObject:item];
        }
    }
    self.searchResultArray = retArray.copy;
    [self.tableView reloadData];
}

@end
