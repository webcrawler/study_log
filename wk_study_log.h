厦门市思明区前埔中二路821号亿中信商务中心五楼

0. py创建项目E:\cocos2d-x-2.1.4\cocos2d-x-2.1.4\tools\project-creator>python create_project.p
y -project HelloWorld -package com.cocos2d-x.org -language cpp

1. CCHttpClient内部采用了pthread + curl，多线程异步加载
2. 
1: 用cocos2d-x 封装curl后的CCHttpClient  发post请求
     创建CCHttpClient ->设置参数->发出连接请求并设置响应回调->响应回调->释放连接.
     在这个过程中(网络连接正常),如果我一直不关闭连接,有正常数据请求就发正常数据,无正常数据就发 自定义维持连接数据 ,这   个连接是一直存在保持长连接的吗?   
2:用socket + pthread 实现.
   这种方法和CCHttpClient一样的吧,CCHttpClient  里面也是用pthread起单独线程处理网络.

刚接触联网,google一番后还是不怎么清晰,望高人指点.. 


  长连接是相对于短连接所定义的，长连接即一直保持连接，比如端游开发中TCP/IP模式。

     短连接多用于网页，手游等不必实时频率发送消息的联网通讯模式。

     第一项属于短连接，结果是你过一段时间不发数据服务器就把你踢掉。
     第二项属于长连接，结果是你不发数据服务器仍保持联接。


下面再摘录相关资料进行区别：
1、TCP连接
要想明白Socket连接，先要明白TCP连接。手机能够使用联网功能是因为手机底层实现了TCP/IP协议，可以使手机终端通过无线网络建立TCP连接。TCP协议可以对上层网络提供接口，使上层网络数据的传输建立在“无差别”的网络之上。
建立起一个TCP连接需要经过“三次握手”：
第一次握手：客户端发送syn包(syn=j)到服务器，并进入SYN_SEND状态，等待服务器确认；
第二次握手：服务器收到syn包，必须确认客户的SYN（ack=j+1），同时自己也发送一个SYN包（syn=k），即SYN+ACK包，此时服务器进入SYN_RECV状态；
第三次握手：客户端收到服务器的SYN＋ACK包，向服务器发送确认包ACK(ack=k+1)，此包发送完毕，客户端和服务器进入ESTABLISHED状态，完成三次握手。
握手过程中传送的包里不包含数据，三次握手完毕后，客户端与服务器才正式开始传送数据。理想状态下，TCP连接一旦建立，在通信双方中的任何一方主动关闭连接之前，TCP 连接都将被一直保持下去。断开连接时服务器和客户端均可以主动发起断开TCP连接的请求，断开过程需要经过“四次握手”（过程就不细写了，就是服务器和客户端交互，最终确定断开）

2、HTTP连接
HTTP协议即超文本传送协议(Hypertext Transfer Protocol )，是Web联网的基础，也是手机联网常用的协议之一，HTTP协议是建立在TCP协议之上的一种应用。
HTTP连接最显著的特点是客户端发送的每次请求都需要服务器回送响应，在请求结束后，会主动释放连接。从建立连接到关闭连接的过程称为“一次连接”。
1）在HTTP 1.0中，客户端的每次请求都要求建立一次单独的连接，在处理完本次请求后，就自动释放连接。

2）在HTTP 1.1中则可以在一次连接中处理多个请求，并且多个请求可以重叠进行，不需要等待一个请求结束后再发送下一个请求。

由于HTTP在每次请求结束后都会主动释放连接，因此HTTP连接是一种“短连接”，要保持客户端程序的在线状态，需要不断地向服务器发起连接请求。通常的做法是即时不需要获得任何数据，
客户端也保持每隔一段固定的时间向服务器发送一次“保持连接”的请求，服务器在收到该请求后对客户端进行回复，表明知道客户端“在线”。若服务器长时间无法收到客户端的请求，则认为客户端“下线”，
若客户端长时间无法收到服务器的回复，则认为网络已经断开

3. UTF8与UTF8 without BOM之间的问题 cocos2d-x

4. http://blog.csdn.net/xiangzilv1987/article/details/8956577


5. winsize是逻辑大小, framesize是实际大小, 中间有个scalefactor因数

6. 字符编码 http://www.ruanyifeng.com/blog/2007/10/ascii_unicode_and_utf-8.html

7. string https://www.byvoid.com/blog/cpp-string/
size_type find_first_of(const basic_string& s, size_type pos = 0)
size_type find_first_of(const charT* s, size_type pos, size_type n)
size_type find_first_of(const charT* s, size_type pos = 0)
size_type find_first_of(charT c, size_type pos = 0)

eg:有这样一个需求：过滤一行开头和结尾的所有非英文字符。看看用string 如何实现：

#include <string>
#include <iostream>
using namespace std;
int main()
{
    string strinfo=" //*---Hello Word!......------";
    string strset="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    int first = strinfo.find_first_of(strset);
    if(first == string::npos)
    {
        cout<<"not find any characters"<<endl;
        return -1;
    }
    int last = strinfo.find_last_of(strset);
    if(last == string::npos)
    {
        cout<<"not find any characters"<<endl;
        return -1;
    }
    cout << strinfo.substr(first, last - first + 1)<<endl;
    return 0;
}
这里把所有的英文字母大小写作为了需要查找的字符集，先查找第一个英文字母的位置，然后查找最后一个英文字母的位置，然后用substr 来的到中间的一部分，用于输出结果。下面就是其结果

void string_replace(string & strBig, const string & strsrc, const string &strdst)
{
    string::size_type pos=0;
    string::size_type srclen=strsrc.size();
    string::size_type dstlen=strdst.size();
    while( (pos=strBig.find(strsrc, pos)) != string::npos)
    {
        strBig.replace(pos, srclen, strdst);
        pos += dstlen;
    }
}
如果不用replace函数，则可以使用erase和insert来替换，也能实现string_replace函数的功能：

void string_replace(string & strBig, const string & strsrc, const string &strdst)
{
    string::size_type pos=0;
    string::size_type srclen=strsrc.size();
    string::size_type dstlen=strdst.size();
    while( (pos=strBig.find(strsrc, pos)) != string::npos)
    {
        strBig.erase(pos, srclen);
        strBig.insert(pos, strdst);
        pos += dstlen;
    }
}

8. 设置横竖屏 
// Override to allow orientations other than the default landscape orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return UIInterfaceOrientationIsLandscape( interfaceOrientation );
}


http://cn.quick-x.com/?p=162， http://www.cocos2d-x.org/wiki/Device_Orientation

9. http://www.cocos2d-x.org/forums/6/topics/16227
Now the return value of getWinSize() depends on your param of CCEGLView::setDesignResolutionSize(w, h, kResolutionType)
WinSize is no longer a physical param, it's a logic size.
In samples/HelloCpp, setDesignResolutionSize is called in Classes/AppDelegate.cpp

10. 横版游戏就用fixHeight,竖屏就用fixwidth


11. 	// 随机加载资源提示信息初始索引
	cc_timeval psv;   
	CCTime::gettimeofdayCocos2d( &psv, NULL );    // 计算时间种子   
	unsigned int tsrans = psv.tv_sec*1000 + psv.tv_usec/1000;    // 初始化随机数   
	srand( tsrans ); 
	
//debug_printf("tsrans = %d\n", tsrans);

	
CProgressData::instance()->orderNum = CCRANDOM_0_1()*(atoi(deString("Tishi_Num")) - 1);
	
debug_printf("total = %d, orderNum = %d\n", atoi(deString("Tishi_Num")), 
CProgressData::instance()->orderNum);


12. mac
显示：defaults write com.apple.finder AppleShowAllFiles -bool true
隐藏：defaults write com.apple.finder AppleShowAllFiles -bool false

13. python 创建工程
 python create_project.py -project HelloWorld -package com.cocos2d-x.org -language cpp

帐号：27779590@qq.com
密码：Onekes5938786

14. http://blog.sina.com.cn/s/blog_67a5e47201019280.html
最近在开发过程中遇到很多切换场景的时候概率性崩溃，内存暴增的问题。
因此总结一些开发中需要注意的要点，

1. 切换全屏场景的时候最好使用replaceScene而不是pushScene。
因为pushScene并不会销毁前一个scene，仅仅是将后一个scene按照堆栈的方式加入到前一个scene的上面。如果自身代码中内存管理写的不好的，利用pushScene很难发现该方面的问题，一旦崩溃定位都很难定位。replaceScene可以及早的将隐含的问题给暴露出来。

2. 尽量不要在onEnter里面初始化精灵Sprite
这个就和上一条有点关系了，如果使用了pushScene，那么再popScene的时候是不会调用前一个场景的init方法的，所以有同学就喜欢把一些初始化放在onEnter里面，具体为什么不好，我们来看一下不同切换场景的时候，每个Scene的生命周期就知道了。
假设scene A是活动场景，现在我们用scene B来pushScene替换A，A和B的生命周期是这样的：
B ---- init();
A ---- onExit();
B ---- onEnter();
B ---- onEnterTransitionDidFinish();

此时popScene，弹出scene B，函数调用如下：
B ---- onExit();
B ---- 析构函数被调用
A ---- onEnter();

从上面可以看出以下几点，
1. A的析构函数始终未被调用，因此A一直在内存中。
2. 先执行B的init()函数，之后才调用A的onExit()方法，再之后才调用B的onEnter();所以初始化最好应该放在init中来初始化。在上一个场景退出之前初始化好后一个场景需要的资源。

同样的，我们再来看一下replaceScene切换场景，scene的生命周期
假设scene A是活动场景，现在我们用scene B来replaceScene替换A，A和B的生命周期是这样的：
B ---- init();
A ---- onExit();
A ---- 析构函数被调用
B ---- onEnter();
B ---- onEnterTransitionDidFinish();

此时B replace A回来的调用跟上面一样，如下：
A ---- init();
B ---- onExit();
B ---- 析构函数调用
A ---- onEnter();
ref: http://blog.csdn.net/tonny_guan/article/details/28121973#


							IOS学习汇总
1. 如果当前语言应用程序不支持，则会自动显示Info.plist中 Localization native development re指定的语言。
2. iOS是基于UNIX内核，android是基于Linux内核
3. UIWindow：是所有UIView的根视图，管理和协调的应用程序的显示、分发事件给View。UIWindow类是UIView的子类，可以看作是特殊的UIView。一般应用程序只有一个UIWindow对象，即使有多个UIWindow对象，
   也只有一个UIWindow可以接受到用户的触屏事件。UIWindow初始化在appDeleDgate里面的 didFinishLaunchingWithOptions方法。
   UIView：UIView类继承自UIResponder，负责在屏幕上 定义一个矩形区域，视图用于展示界面及响应用户界面交互。每个视图对象都要负责渲染视图区域的内容，并响应该区域中发生的操作事件。
   除了显示内容和处理事件之外，视图可以嵌套并管理子视图。子视图是指嵌入到另一视图对象内部的视图对象，而被嵌入的视图对象是父视图。视图添加到window中就会显示出来，iOS中是怎么实现视图显示的，看下面的代码：
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    CGRect rect=[UIScreen mainScreen].applicationFrame;
    
    NSLog(@"NSScreen application %@",NSStringFromCGRect(rect));
    CGRect rect2=[UIScreen mainScreen].bounds;
    
    NSLog(@"NSString mainScreen %@",NSStringFromCGRect(rect2));

    NSLog(@"iOS_didFinishLaunchingWithOptions");
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(60, 50, 200, 100)];
    view1.backgroundColor=[UIColor greenColor];
    
    [self.window addSubview:view1];
    [view1 release];
  
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(60, 100, 200, 200) ];
    view2.alpha=0.5;
    view2.backgroundColor=[UIColor cyanColor];
    [self.window addSubview:view2];    
   
    
    UIView *view3=[[UIView alloc]initWithFrame:CGRectMake(100, 50, 60, 50)];
    view3.backgroundColor=[UIColor colorWithRed:25/255.0 green:60/255.0 blue:150/255.0 alpha:1.0];    
    [view2 addSubview:view3];
    
    [view3 release];
    [view2 release];
    
    [self.window makeKeyAndVisible];
    return YES;
}
上面添加了三个视图，view1、view2、view3，view3嵌套在view2中

4. While reading /Users/hamiltonvergil/Documents/plate/cocos2d-x-2.2.1/client/Resources/Layout/GUI/labelatlasimg.png pngcrush caught libpng error:
   Read Error


5. Lua 取整
经验

* 向上取整，也就是大一个
> print(math.ceil(2.1))
3
向下取整，就是小一个
> print(math.floor(2.1))
2
>

6. 删除table

	--[[
	-- safe ? 
	local i = 1
	while i < #(m_tbRadioBtn) do
		if m_tbRadioBtn[i] == 2 then
			i = table.remove( m_tbRadioBtn, i ) 
		else
			i = i + 1
		end
	end
	--]

7. UILayout 默认锚点在ccp(0, 0)

8. cocostudio 做出的 layout1 添加到layout2  此时layout1锚点是在ccp(0, 0)，layout2锚点是在ccp(0.5, 0.5)，
   不是cocostudio 做出的 layout1锚点是在ccp(0.5, 0.5)，layout2锚点是在ccp(0, 0)，
   
   yes:cocostudio做出的layout1, 代码创建的layout2, layout2添加到layout1, layout2锚点是在ccp(0.5, 0.5), layout1锚点是在ccp(0, 0) (这里说的layout指的是UIPanel) 
   layout = UILayout:create()
   cclog(""..layout:getSize().width.."： "..layout:getSize().height), width和height都为0

9. 使用removeUnusedTexture这个函数比较好，它会释放掉引用计数为1的纹理，也就说明程序中没有再为它增加引用计数，肯定是没用了。那些大于1的纹理不会释放掉，即使我们在不知道的情况下再次加载，也只是返回已经加载好了的。

10. 3.0创建工程 cocos new MyGame -p com.MyCompany.AwesomeGame -l cpp -d F:/MyProject （http://www.cocos2d-x.org/docs/manual/framework/native/getting-started/v3.0/how-to-run-cpp-tests-on-win32/en）

11. 游戏优化：
    1. We prefer audio file with MP3 data format. Because it is supported by both android and ios platform. And it is also compressed and hardware accelerated.
       You should keep your background music file with data size under 800KB. The simplest way is reduce background music time and repeat it in your program.
       You should keep your audio file’s sample rate around 96-128kbps and 44kHz bit rate is enough.
    2. So we can use texture with color depth of RBGA4444 instead of RBGA8888, which costs as half memory of the latter one

12. 
typedef signed char  int8;
typedef signed short int16;
typedef signed int int32;
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;
typedef float float32;
typedef double float64;

13. explicit构造函数 http://developer.51cto.com/art/201002/183398.htm

14. 
Max size of textures in cocos2d-x depends on each platform:
In theory, cocos2d-x could show textures in any size, but actually the maxsize of the textures is restricted by the hardware and the system.
Here I provide a texture-size restriction table on different platforms’ emulators.
platform	maxsize in pixelsr
win32		2048 * 2048
android		4096 * 4096
iPhone3		1024 * 1024
iPhone3GS	2048 * 2048
iPhone4		2048 * 2048
On the real machines, they aslo have different restrictions, here are some test results: G3 (Hero) 1024 * 1024, iPhone4 2048 * 2048.
So, for the developers, if you want to cross platforms and run your games smoothly, you should keep your texture size less than 1024 * 1024, that is the lowest restriction for most machines.
Code to get max size of texture that the device support: (might not work in simulator)
GLint m_maxTextureSize = 0;
glGetIntegerv(GL_MAX_TEXTURE_SIZE, &m_maxTextureSize);
// http://cocos2d-x.org/wiki/Max_size_of_textures_in_cocos2d-x_depends_on_each_platform

15. 在大多数平台上，Cocos2d-x调用不同的SDK API来播放背景音乐和音效。CocosDenshion在同一时间只能播放一首背景音乐，但是能同时播放多个音效。
Android 在android上CocosDenshion能支持的音频格式是对应于android.media.MediaPlayer所支持的格式。Android ogg是最好的选择，对wav的支持不是太好。
IOS 在IOS上面Cocos2d-x的CocosDenshion所支持的格式和Cocos2d-iphone中所支持的是一样，caf是推荐的一种.
警告：Samsung i9100 似乎在音频驱动上面有一个bug。它不能同时播放太多音效。所以当你在Samsung i9100中运行你的程序的时候，最好不要调用SimpleAudioEngine::playEffect(const char* filePah)太过频繁。










































