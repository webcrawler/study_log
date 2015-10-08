// create by fjut on 2015-09-28
// oc 学习笔记

object-c完全兼容c, 可以使用C特性
1. NSString:

NSString *name = @"fjut";

printf("Hello C\n");
printf("The number is %d\n",100);
printf("Hello %s\n","XiaoMing");

NSLog(@"Hello Objective-C");
NSLog(@"The number is %d",1000);
NSLog(@"Hello %s","XiaoLi");
NSLog(@"Hello %@",name);
NSLog(@"ObjC Object %@",[[[NSObject alloc] init] description]);

NSString *str = @"Hello OC";
NSString *str1 = [NSString stringWithFormat:@"Number is %d",100];
NSString *str2 = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://fjut.com"] encoding:NSUTF8StringEncoding error:nil];

2. 方法 （可以使用C方法特性）
-(bool) setTmpAccessToken: (NSString*) token withUid: (NSString*)user_id ExpiredAt: (NSDate*)date;
[self setTmpAccessToken:self.AccessToken withUid:self.Uid ExpiredAt:self.AccessTokenExpiredDate];
[ClassXX method: parm1: xx:param2];

3. #import "Hi.h" / include "Hi.h"

4. class
// 定义class
@interface Fjut: NSObject
{
    int a;
}
-(void)haha;
@end

// 实现class
@implementation Fjut
- (instancetype)init
{
    self = [super init];
    if (self) {
        a = 0;
    }
    return self;
}

-(void)haha
{
    a = 100;
}
@end

invoke class:
Fjut* f = [[Fjut alloc] init];
[f haha];

5. getter and setter  @property:

@interface People: NSObject{
    int _age;
}
@property int age;
@end

@implementation People
// 重写 getter and setter
-(void)setAge:(int)age{
    _age = age;
}
-(int)age{
    return _age;
}
@end

6. FactoryMethod :
@interface Fjut NSObject
{
    int age;
    NSString* name;
}
+(Fjut)fjutWithAge: (int)age addName: (NSString*)name;
-(id)initWithAge:(int)age addName: (NSString*)name;
@end

@implementation Fjut
+(FJut)fjutWithAge: (int)age addName:(NSString*)name
{
    return [[Fjut alloc] initWithAge: age addName:name];
}

-(id)initWithAge:(int)age addName: (NSString*)name
{
    self = [super init];
    if (self)
    {
        age = age;
        name = name;
    }
    return self;
}
@end

invoke:
Fjut* f = [Fjut fjutWithAge:10 addName:@"fjut"];

7. 数组/可变数组 NSArray
NSArray* arr = @[@"hello", @"world"];
NSArray* arr = [NSArray arrayWithObjects:@"hello", @"world", nil];
// （data.plist type==Array）
NSArray* arr = [NSArray  arrayWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]];
for (int int i = 0; i < [arr count]; i++)
{
    [arr objectAtIndex:i];
}
// 可变
NSMutableArray* arr = [[NSMutableArray alloc] init];
for (int int i = 0; i < 10; i++)
{
    [arr addObject:[NSString stringWithFormat:@"%d",i]];
}
NSLog(@"%@", arr);

8. 字典/可变字典
NSDictionary* dict = @{@"name": @"fjut", @"sex": @"male"};
// （data.plist type==Dictionary）
NSDictionary* dict = [NSDictionary dictionaryWithContentsOfFile: [NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
[dict objectForKey:@"name"];
// 可变
NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
[dict addObject: @"fjut" forKey:@"name"];

9. 代码块Block （类似C++11 lambda。 函数指针）
int (^max_fjut)(int, int);
typedef void (^say_fjut)();

invoke test:
max_fjut = ^(int a, int b)
{
    return (a > b)? a: b;
}
printf("max = %d", max_fjut(2, 3));

say_fjut say = ^()
{
    printf("fjut");
}
say();

10. 协议(@protocol) 协议类似于java的接口，如果一个协议中定义了某些方法，而某类又实现了该协议，那么该类必须实现这些方法。换句话说，
协议是一组公用的方法声明，谁实现协议，谁就负责实现这些方法，不然会有黄色警告。协议可以扩展已有协议。在类中实现协议时，只需要在类名后面加个<协议名>

@protocol Fjut <NSObject> // 协议Fjut扩展了协议NSObject
-(int)getAge;
@end

// 扩展的NSObject协议不用实现，因为FJutXX继承于NSObject的类已经继承了对NSObject协议的实现
@interface FJutXX: NSObject<Fjut>
{
    int age;
}
-(int)getAge();
@end

11. 代理（delegate）
@protocol ManDelegate <NSObject>
-(void)onAgeChanged:(int)age;
@end

@interface Man : NSObject<IPeople>{
    int _age;
}
-(void)setAge:(int)age;
@property id<ManDelegate> delegate;
@end

-(void)setAge:(int)age{
    if (age!=_age) {
        if (self.delegate) {
            [self.delegate onAgeChanged:age];
        }
    }
    _age = age;
}

invoke:
@interface ManListener : NSObject<ManDelegate>
-(void)onAgeChanged:(int)age;
@end
@implementation ManListener

-(void)onAgeChanged:(int)age{
    NSLog(@"Age changed,Current age is %d",age);
}
@end

Man* m = [[Man alloc] init];
[m setDelegate:[[ManListener alloc] init]];
[m setAge:21];

12. 类型判断
@interface A : NSObject
@end
@implementation A
@end

@interface B : NSObject
@end
@implementation B
@end

invoke:
A* a = [[A alloc] init];
NSLOG(@"%d", [a isKindOfClass:[B class]]);

13. 异常处理
@try
{
    @throw [NSException exceptionWithName:@"Error" reason:nil userInfo:nil];
}
@catch (NSException* exception)
{
    NSLog(@"%@", EXCEPTION);
}
@finally
{
    
}

14. @property
使用@property和@synthesize很方便，但又给我们带来了很多疑问比如在上面的代码中又出现了nonatomic和copy，是什么意思？
在@property中还有其他几个关键字，它们都是有特殊作用的，我把它们分为三类分别是：原子性，访问器控制，内存管理。

原子性
atomic(默认)：atomic意为操作是原子的，意味着只有一个线程访问实例变量。atomic是线程安全的至少在当前的访器上我是安全的。
它是一个默认的，但是很少使用。它的比较慢，这跟ARM平台和内部锁机制有关。
nonatomic： nonatomic跟atomic刚好相反。表示非原子的，可以被多个线程访问。它的速度比atomic快。但不能保证在多线程环境
下的安全性，在单线程和明确只有一个线程访问的情况下广泛使用。

访问器控制
readwrite(默认):readwrite是默认的，表示同时拥有setter和getter。
readonly： readonly 表示只有getter没有setter。
有时候为了语意更明确可能需要自定义访问器的名字:
@property (nonatomic, setter = mySetter:,getter = myGetter ) NSString *name;
最常见的是BOOL类型，比如标识View是否隐藏的属性hidden。可以这样声明
@property (nonatomic,getter = isHidden ) BOOL hidden;
要注意修改setter或者getter的名字是存在副作用的，可能会使KVC和KVO无法正常工作。

内存管理
retain：使用了retain意味着实例变量要获取传入参数的所有权。具体表现在setter中对实例变量先release然后将参数 retain之后传给它。
下面这段代码展示了retain类似的行为:
-(void)setStuName:(NSString *)stuName
{
    if (_stuName != stuName)
    {
        [_stuName release];
        _stuName = [stuName retain];
    }
}
assign（默认）：用于值类型，如int、float、double和NSInteger，CGFloat等表示单纯的复制。还包括不存在所有权关系的对象，比如常见的delegate。
strong：是在ARC伴随IOS引入的时候引入的关键字是retain的一个可选的替代。表示实例变量对传入的参数要有所有权关系即强引用。strong跟retain的意思
相同并产生相同的代码，但是语意上更好更能体现对象的关系。
weak： weak跟assign的效果相似，不同的是weak在对象被回收之后自动设置为nil。而且weak智能用在iOS 5或以后的版本，对于之前的版本，使用unsafe_unretained。
unsafe_unretained:weak的低版本替代。
copy:copy是为是实例变量保留一个自己的副本。

现在明白了@property是怎么回事了，但是@synthesize是怎么回事，看看之前的第一段代码：
@synthesize stuName = _stuName;
这里的stuName = _stuName是什么意思？stuName是propertyName跟@property声明的名字一样。而后面的_stuName 是实例变量名。生成的访问器就是
来访问的 _stuName的。代码的样子就和最开始那setter和getter代码所描述的一样。
注意一个问题，我们并没有声明_stuName这个变量，这是编译器自动帮我们创建的。 如果这段指令我换个写法：@synthesize stuName = a;   并且我们
没有在interface里面声明这个变量，那么会自动创建一个变量a。

如果这里写成这样：
@synthesize stuName;
//等同于
@synthesize stuName = stuName;

在Xcode4.4中，Xcode添加的一些新的编译特性。其中一个就是默认合成（Default Synthesis）。默认合成就不再需要显示的使用@synthesize指令了，这很方便但是要注意的是，默认合成遵守的约定，这里的也就是命名规则是propertyName = _propertyName。
下面一段代码帮助理解：
//对于下面的@propety
@property (nonatomic, copy) NSString *stuName;
//默认合成的规则是这样：
@synthesize stuName = _stuName;

15. 类别（category)
封装是面向对象的一个特征，OC也不意外，但是有的时候我们会碰到这样一种情况，比如我封装了一个类，不想再动它了，可是随着程序功能的增加，
需要在那个类中增加一个小小的方法，这时我们就不必在那个类中做修改，只需要在用到那个方法时随手添加一个该类的类别（category)即可，
让我们来看代码：先建一个空类Men,里面没有任何的属性和方法。然后在main.m中我们这样写：
#import <Foundation/Foundation.h>
#import "Men.h"
@interface Men(menAdd)//说明该类别名叫menAdd,是对Men类的补充。
-(void)speak;
@end
@implementation Men(menAdd)
-(void)speak
{
    NSLog(@"我是类别补充的speak方法");
}
@end
int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        Men *man =[[Men alloc]init];
        [man speak];
        
    }
    return 0;
}
看起来很简单吧，我们只需要记住简单的语法规则就好，另外，需要注意的是如果speak方法是在men类中本身就有的，那么类别中的speak方法会
覆盖men中的speak方法，有点儿像重写，而且类别只能添加方法，不能添加属性变量。

16. UIKit学习
1.                                             ViewController:
[self.view addSubview:控件实例];
实现画面的切换 [self.view.window sendSubviewToBack:self.view];

将两个画面(UIView)追加到UIWindow中:
// 初始化Window
CGRect bounds = [[UIScreen mainScreen] bounds]; window _ = [[UIWindow alloc] initWithFrame:bounds];
// 创建ViewController1与ViewController2
// 并将其画面(view)追加到Window中
viewController1 _ = [[ViewController1 alloc] init];
viewController2 _ = [[ViewController2 alloc] init];
[window _ addSubview:viewController1 _ .view];
[window _ addSubview:viewController2 _ .view];
// ViewController1放在前面显示
[window _ bringSubviewToFront:viewController1 _ .view];

2. 模态框
// dialog 继承UIViewController
[self presentModalViewController:dialog animated:YES];
// 关闭模态UIViewController
[self dismissModalViewControllerAnimationed:YES];

3. UIWindow 一般一个，有3个windowLevel。

4. UIView tag [self.window.viewWithTag:100]; // 循环遍历tag为100的view
   属性：contentMode

5.














































