//
//  UIKitPrjViewForRow.m
//
//  Created by wang on 2011-10-03.
//

#import "UIKitPrjViewForRow.h"

@implementation UIKitPrjViewForRow

- (void)dealloc {
  [dataSource_ release];
  [picker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  //创建选择框并初始化
  picker_ = [[UIPickerView alloc] init];
  picker_.delegate = self;
  picker_.showsSelectionIndicator = YES;
  [self.view addSubview:picker_];
  //导入选项用的图片
  UIImage* imageDog = [UIImage imageNamed:@"Dog.png"];
  UIImage* imageMonkey = [UIImage imageNamed:@"Monkey.png"];
  UIImage* imageElephant = [UIImage imageNamed:@"Elephant.png"];
  UIImage* imageLion = [UIImage imageNamed:@"Lion.png"];
  NSArray* components1 =
    [NSArray arrayWithObjects:imageDog, imageMonkey, imageElephant, imageLion, nil];
  NSArray* components2 =
    [NSArray arrayWithObjects:imageDog, imageMonkey, imageElephant, imageLion, nil];
  NSArray* components3 =
    [NSArray arrayWithObjects:imageDog, imageMonkey, imageElephant, imageLion, nil];
  dataSource_ = [[NSArray alloc] initWithObjects:components1, components2, components3, nil];
  //追加信息显示按钮，当触摸此按钮时，选中选项图片将显示在工具条上
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"信息显示" forState:UIControlStateNormal];
  [button sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 50;
  button.center = newPoint;
  //注册按钮点击后的响应方法
  [button addTarget:self
             action:@selector(buttonDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
  return 3;//返回列数
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 4;//返回行数
}
//以UIView作为选项时必须实现此方法
- (UIView*)pickerView:(UIPickerView*)pickerView
  viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView*)view
{
  //如果参数view已经初始化，则直接显示（再利用）
  UIImageView* imageView = (UIImageView*)view;
  if ( !imageView ) {
	//否则创建并初始化UIImageView
    UIImage* image = [[dataSource_ objectAtIndex:component] objectAtIndex:row];
    imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  }
  return imageView;
}
//按钮［信息显示］被触摸时的响应方法
- (void)buttonDidPush {
  static const int kNumbersOfComponent = 3;
  NSMutableArray* items = [[NSMutableArray alloc] initWithCapacity:3];
  for ( int i = 0; i < kNumbersOfComponent; ++i ){
	//调用viewForRow:forComponent:方法取得选择行每列中的UIView对象
    UIImageView* imageView =
      (UIImageView*)[picker_ viewForRow:[picker_ selectedRowInComponent:i] forComponent:i];
    UIImageView* newImageView =
      [[[UIImageView alloc] initWithImage:imageView.image] autorelease];
	//以取得的UIView对象为基础创建UIBarButtonItem对象
    UIBarButtonItem* barButton =
      [[[UIBarButtonItem alloc] initWithCustomView:newImageView] autorelease];
    [items addObject:barButton];
  }
  //将上述UIBarButtonItem对象数组设置到工具条中
  [self setToolbarItems:items];
  [items release];
}

@end
