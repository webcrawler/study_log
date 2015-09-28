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


















































