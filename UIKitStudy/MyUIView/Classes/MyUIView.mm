
#import "MyUIView.h"

@implementation MyUIView

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    // 显示标签
    UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.backgroundColor = [UIColor magentaColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"模态框";
    [self.view addSubview:label];
    
    // 关闭按钮
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"关闭x" forState:UIControlStateNormal];
    [btn sizeToFit];
    CGPoint point = self.view.center;
    point.y += 80;
    btn.center = point;
    [btn addTarget:self action:@selector(btnCallx) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void) btnCallx
{
    NSLog(@"关闭xxx");
    [self dismissModalViewControllerAnimated:YES];
}

-(id) init
{
    self = [super init];
    if (self)
    {
        //
    }
    return self;
}

- (void) dealloc
{
    [super dealloc];
    //
}


@end