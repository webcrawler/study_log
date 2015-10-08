//
//  UIKitPrjTabBar.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjTabBar.h"

@implementation UIKitPrjTabBar

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UITabBarController";

  id scene1 = [[[SampleScene alloc] initWithSystemItem:UITabBarSystemItemFeatured badge:nil] autorelease];
  id scene2 = [[[SampleScene alloc] initWithSystemItem:UITabBarSystemItemMostViewed badge:@"1"] autorelease];
  id scene3 = [[[SampleScene alloc] initWithSystemItem:UITabBarSystemItemSearch badge:nil] autorelease];
  id scene4 = [[[SampleScene alloc] initWithSystemItem:UITabBarSystemItemBookmarks badge:nil] autorelease];
  id scene5 = [[[SampleScene alloc] initWithSystemItem:UITabBarSystemItemMostRecent badge:@"2"] autorelease];
  id scene6 = [[[SampleScene alloc] initWithSystemItem:UITabBarSystemItemTopRated badge:nil] autorelease];
  id scene7 = [[[SampleScene alloc] initWithSystemItem:UITabBarSystemItemHistory badge:nil] autorelease];
  id scene8 = [[[SampleScene alloc] initWithSystemItem:UITabBarSystemItemDownloads badge:nil] autorelease];
  id scene9 = [[[SampleScene alloc] initWithSystemItem:UITabBarSystemItemContacts badge:nil] autorelease];
	
  
  
  id scene10 = [[[SampleScene alloc] initWithSystemItem:UITabBarSystemItemFavorites badge:nil] autorelease];
  id scene11 = [[[SampleScene alloc] initWithSystemItem:UITabBarSystemItemRecents badge:nil] autorelease];
  id scene12 = [[[SampleScene alloc] initWithFileName:@"smile.png" title:@"微笑"] autorelease];
  NSArray* scenes = [NSArray arrayWithObjects:
                                scene1,
                                scene2,
                                scene3,
                                scene4,
                                scene5,
                                scene6,
                                scene7,
                                scene8,
                                scene9,
                                scene10,
                                scene11,
                                scene12,
                                nil ];
  [self setViewControllers:scenes animated:NO];

  self.customizableViewControllers =
    [NSArray arrayWithObjects:scene4, scene5, scene6, scene7, scene8, scene9, scene12, nil];

}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:YES];
  [self.navigationController setNavigationBarHidden:YES animated:NO];
  [self.navigationController setToolbarHidden:YES animated:NO];
}

@end

@implementation SampleScene

- (id)initWithSystemItem:(UITabBarSystemItem)item badge:(NSString*)badge {
  if ( (self = [super init]) ) {
    self.tabBarItem =
      [[[UITabBarItem alloc] initWithTabBarSystemItem:item tag:0] autorelease];
    self.tabBarItem.badgeValue = badge;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.backgroundColor = [UIColor blackColor];
  [self.view addSubview:label];
}

- (id)initWithFileName:(NSString*)fileName title:(NSString*)title {
  if ( (self = [super init]) ) {
    UIImage* icon = [UIImage imageNamed:fileName];
    self.tabBarItem =
      [[[UITabBarItem alloc] initWithTitle:title image:icon tag:0] autorelease];
  }
  return self;
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
