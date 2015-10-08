//
//  UIKitPrjTitleAndImage.m
//
//  Created by wang on 2011-10-01.
//

#import "UIKitPrjTitleAndImage.h"

@implementation UIKitPrjTitleAndImage

- (void)dealloc {
  [titles_ release];
  [images_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  //读入图标图片
  UIImage* image1 = [UIImage imageNamed:@"Elephant.png"];
  UIImage* image2 = [UIImage imageNamed:@"Lion.png"];
  UIImage* image3 = [UIImage imageNamed:@"Dog.png"];
  //创建选项显示用的图标、文本标题的NSArray类型数组
  images_ = [[NSArray alloc] initWithObjects:image1, image2, image3, nil];
  titles_ = [[NSArray alloc] initWithObjects:@"Elephant", @"Lion", @"Dog", nil];
  //选项初期为文本型
  UISegmentedControl* segment =
    [[[UISegmentedControl alloc] initWithItems:titles_] autorelease];
  segment.segmentedControlStyle = UISegmentedControlStyleBordered;
  segment.frame = CGRectMake( 10, 50, 300, 30 );
  [segment addTarget:self
              action:@selector(segmentDidChange:)
       forControlEvents:UIControlEventValueChanged];

  [self.view addSubview:segment];
}
//选项被选中后，将其中的文本型标题换成图标
- (void)segmentDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISegmentedControl class]] ) {
    UISegmentedControl* segment = sender;
    for ( int i = 0; i < segment.numberOfSegments; ++i ){
      if ( i == segment.selectedSegmentIndex ) {
        [segment setImage:[images_ objectAtIndex:i] forSegmentAtIndex:i];
      } else {
        [segment setTitle:[titles_ objectAtIndex:i] forSegmentAtIndex:i];
      }
    }
  } 
}

@end
