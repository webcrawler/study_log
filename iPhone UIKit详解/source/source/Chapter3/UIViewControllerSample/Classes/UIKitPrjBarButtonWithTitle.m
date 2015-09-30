//
//  UIKitPrjBarButtonWithTitle.m
//
//  Created by Wang on 2011-08-16.
//

#import "UIKitPrjBarButtonWithTitle.h"

#pragma mark ----- Private Methods Definition -----

@interface UIKitPrjBarButtonWithTitle ()
- (UIBarButtonItem*)barButtonItemWithStyle:(UIBarButtonItemStyle)style;
- (void)buttonDidPush:(id)sender;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation UIKitPrjBarButtonWithTitle

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"UIBarButtonItem";

  self.navigationItem.rightBarButtonItem =
    [self barButtonItemWithStyle:UIBarButtonItemStyleBordered];

  UIImage* image = [UIImage imageNamed:@"smile.png"];
  UIBarButtonItem* icon = [[[UIBarButtonItem alloc] initWithImage:image
                                                            style:UIBarButtonItemStylePlain
                                                           target:self
                                                           action:@selector(buttonDidPush:)] autorelease];

  [self setToolbarItems:[NSArray arrayWithObjects:
          [self barButtonItemWithStyle:UIBarButtonItemStylePlain],
          [self barButtonItemWithStyle:UIBarButtonItemStyleBordered],
          [self barButtonItemWithStyle:UIBarButtonItemStyleDone],
          icon,
          nil]];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

#pragma mark ----- Private Methods -----

- (UIBarButtonItem*)barButtonItemWithStyle:(UIBarButtonItemStyle)style {
  NSString* title;
  switch ( style ) {
    case UIBarButtonItemStylePlain:
      title = @"Plain";
      break;
    case UIBarButtonItemStyleBordered:
      title = @"Bordered";
      break;
    default: //< UIBarButtonItemStyleDone
      title = @"Done";
      break;
  }
  UIBarButtonItem* button = [[[UIBarButtonItem alloc] initWithTitle:title
                                                              style:style
                                                             target:nil
                                                             action:nil] autorelease];
  return button;
}

- (void)buttonDidPush:(id)sender {
  if ( [sender isKindOfClass:[UIBarButtonItem class]] ) {
    UIBarButtonItem* item = sender;
    switch ( item.style ) {
      case UIBarButtonItemStylePlain:
        item.style = UIBarButtonItemStyleBordered;
        break;
      case UIBarButtonItemStyleBordered:
        item.style = UIBarButtonItemStyleDone;
        break;
      default: //< UIBarButtonItemStyleDone
        item.style = UIBarButtonItemStylePlain;
        break;
    }
  } 
}

@end
