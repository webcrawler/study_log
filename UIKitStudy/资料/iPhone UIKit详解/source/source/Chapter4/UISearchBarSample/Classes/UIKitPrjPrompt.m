//
//  UIKitPrjPrompt.m
//
//  Created by wang on 2011-10-06.
//

#import "UIKitPrjPrompt.h"

@implementation UIKitPrjPrompt

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  UISearchBar* searchBar = [[[UISearchBar alloc] init] autorelease];
  searchBar.frame = CGRectMake( 0, 0, 320, 70 );

  searchBar.prompt = @"世界住宿检索";
  searchBar.placeholder = @"请输入旅店的名称";

  [self.view addSubview:searchBar];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
