//
//  UIKitPrjRealTimeSearch.m
//
//  Created by wang on 2011-10-06.
//

#import "UIKitPrjRealTimeSearch.h"

@implementation UIKitPrjRealTimeSearch

- (void)viewDidLoad {
  [super viewDidLoad];

  searchBar_.keyboardType = UIKeyboardTypeNumberPad;
  searchBar_.showsCancelButton = YES;
}

- (void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)searchText {
  if ( 0 == searchText.length ) {
	//检索字符串为空时，显示全部数据
    [dataSource_ release];
    dataSource_ = [[NSMutableArray alloc] initWithArray:dataBase_];
    [self.tableView reloadData];
  } else {
	//检索字符串非空时，进行实时检索
    [dataSource_ removeAllObjects];
    for ( NSString* data in dataBase_ ) {
      if ( [data hasPrefix:searchBar.text] ) {
        [dataSource_ addObject:data];
      } 
    }
    [self.tableView reloadData];
  }
  //实时检索时保持键盘为显示状态
}

- (void)searchBarCancelButtonClicked:(UISearchBar*)searchBar {
  searchBar.text = @"";
  [searchBar resignFirstResponder];//隐藏键盘
}

@end
