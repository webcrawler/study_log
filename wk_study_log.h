������˼����ǰ���ж�·821������������������¥

0. py������ĿE:\cocos2d-x-2.1.4\cocos2d-x-2.1.4\tools\project-creator>python create_project.p
y -project HelloWorld -package com.cocos2d-x.org -language cpp

1. CCHttpClient�ڲ�������pthread + curl�����߳��첽����
2. 
1: ��cocos2d-x ��װcurl���CCHttpClient  ��post����
     ����CCHttpClient ->���ò���->������������������Ӧ�ص�->��Ӧ�ص�->�ͷ�����.
     �����������(������������),�����һֱ���ر�����,��������������ͷ���������,���������ݾͷ� �Զ���ά���������� ,��   ��������һֱ���ڱ��ֳ����ӵ���?   
2:��socket + pthread ʵ��.
   ���ַ�����CCHttpClientһ���İ�,CCHttpClient  ����Ҳ����pthread�𵥶��̴߳�������.

�սӴ�����,googleһ�����ǲ���ô����,������ָ��.. 


  ������������ڶ�����������ģ������Ӽ�һֱ�������ӣ�������ο�����TCP/IPģʽ��

     �����Ӷ�������ҳ�����εȲ���ʵʱƵ�ʷ�����Ϣ������ͨѶģʽ��

     ��һ�����ڶ����ӣ���������һ��ʱ�䲻�����ݷ������Ͱ����ߵ���
     �ڶ������ڳ����ӣ�������㲻�����ݷ������Ա������ӡ�


������ժ¼������Ͻ�������
1��TCP����
Ҫ������Socket���ӣ���Ҫ����TCP���ӡ��ֻ��ܹ�ʹ��������������Ϊ�ֻ��ײ�ʵ����TCP/IPЭ�飬����ʹ�ֻ��ն�ͨ���������罨��TCP���ӡ�TCPЭ����Զ��ϲ������ṩ�ӿڣ�ʹ�ϲ��������ݵĴ��佨���ڡ��޲�𡱵�����֮�ϡ�
������һ��TCP������Ҫ�������������֡���
��һ�����֣��ͻ��˷���syn��(syn=j)����������������SYN_SEND״̬���ȴ�������ȷ�ϣ�
�ڶ������֣��������յ�syn��������ȷ�Ͽͻ���SYN��ack=j+1����ͬʱ�Լ�Ҳ����һ��SYN����syn=k������SYN+ACK������ʱ����������SYN_RECV״̬��
���������֣��ͻ����յ���������SYN��ACK���������������ȷ�ϰ�ACK(ack=k+1)���˰�������ϣ��ͻ��˺ͷ���������ESTABLISHED״̬������������֡�
���ֹ����д��͵İ��ﲻ�������ݣ�����������Ϻ󣬿ͻ��������������ʽ��ʼ�������ݡ�����״̬�£�TCP����һ����������ͨ��˫���е��κ�һ�������ر�����֮ǰ��TCP ���Ӷ�����һֱ������ȥ���Ͽ�����ʱ�������Ϳͻ��˾�������������Ͽ�TCP���ӵ����󣬶Ͽ�������Ҫ�������Ĵ����֡������̾Ͳ�ϸд�ˣ����Ƿ������Ϳͻ��˽���������ȷ���Ͽ���

2��HTTP����
HTTPЭ�鼴���ı�����Э��(Hypertext Transfer Protocol )����Web�����Ļ�����Ҳ���ֻ��������õ�Э��֮һ��HTTPЭ���ǽ�����TCPЭ��֮�ϵ�һ��Ӧ�á�
HTTP�������������ص��ǿͻ��˷��͵�ÿ��������Ҫ������������Ӧ������������󣬻������ͷ����ӡ��ӽ������ӵ��ر����ӵĹ��̳�Ϊ��һ�����ӡ���
1����HTTP 1.0�У��ͻ��˵�ÿ������Ҫ����һ�ε��������ӣ��ڴ����걾������󣬾��Զ��ͷ����ӡ�

2����HTTP 1.1���������һ�������д��������󣬲��Ҷ����������ص����У�����Ҫ�ȴ�һ������������ٷ�����һ������

����HTTP��ÿ����������󶼻������ͷ����ӣ����HTTP������һ�֡������ӡ���Ҫ���ֿͻ��˳��������״̬����Ҫ���ϵ��������������������ͨ���������Ǽ�ʱ����Ҫ����κ����ݣ�
�ͻ���Ҳ����ÿ��һ�ι̶���ʱ�������������һ�Ρ��������ӡ������󣬷��������յ��������Կͻ��˽��лظ�������֪���ͻ��ˡ����ߡ�������������ʱ���޷��յ��ͻ��˵���������Ϊ�ͻ��ˡ����ߡ���
���ͻ��˳�ʱ���޷��յ��������Ļظ�������Ϊ�����Ѿ��Ͽ�

3. UTF8��UTF8 without BOM֮������� cocos2d-x

4. http://blog.csdn.net/xiangzilv1987/article/details/8956577


5. winsize���߼���С, framesize��ʵ�ʴ�С, �м��и�scalefactor����

6. �ַ����� http://www.ruanyifeng.com/blog/2007/10/ascii_unicode_and_utf-8.html

7. string https://www.byvoid.com/blog/cpp-string/
size_type find_first_of(const basic_string& s, size_type pos = 0)
size_type find_first_of(const charT* s, size_type pos, size_type n)
size_type find_first_of(const charT* s, size_type pos = 0)
size_type find_first_of(charT c, size_type pos = 0)

eg:������һ�����󣺹���һ�п�ͷ�ͽ�β�����з�Ӣ���ַ���������string ���ʵ�֣�

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
��������е�Ӣ����ĸ��Сд��Ϊ����Ҫ���ҵ��ַ������Ȳ��ҵ�һ��Ӣ����ĸ��λ�ã�Ȼ��������һ��Ӣ����ĸ��λ�ã�Ȼ����substr ���ĵ��м��һ���֣������������������������

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
�������replace�����������ʹ��erase��insert���滻��Ҳ��ʵ��string_replace�����Ĺ��ܣ�

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

8. ���ú����� 
// Override to allow orientations other than the default landscape orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return UIInterfaceOrientationIsLandscape( interfaceOrientation );
}


http://cn.quick-x.com/?p=162�� http://www.cocos2d-x.org/wiki/Device_Orientation

9. http://www.cocos2d-x.org/forums/6/topics/16227
Now the return value of getWinSize() depends on your param of CCEGLView::setDesignResolutionSize(w, h, kResolutionType)
WinSize is no longer a physical param, it's a logic size.
In samples/HelloCpp, setDesignResolutionSize is called in Classes/AppDelegate.cpp

10. �����Ϸ����fixHeight,��������fixwidth


11. 	// ���������Դ��ʾ��Ϣ��ʼ����
	cc_timeval psv;   
	CCTime::gettimeofdayCocos2d( &psv, NULL );    // ����ʱ������   
	unsigned int tsrans = psv.tv_sec*1000 + psv.tv_usec/1000;    // ��ʼ�������   
	srand( tsrans ); 
	
//debug_printf("tsrans = %d\n", tsrans);

	
CProgressData::instance()->orderNum = CCRANDOM_0_1()*(atoi(deString("Tishi_Num")) - 1);
	
debug_printf("total = %d, orderNum = %d\n", atoi(deString("Tishi_Num")), 
CProgressData::instance()->orderNum);


12. mac
��ʾ��defaults write com.apple.finder AppleShowAllFiles -bool true
���أ�defaults write com.apple.finder AppleShowAllFiles -bool false

13. python ��������
 python create_project.py -project HelloWorld -package com.cocos2d-x.org -language cpp

�ʺţ�27779590@qq.com
���룺Onekes5938786

14. http://blog.sina.com.cn/s/blog_67a5e47201019280.html
����ڿ��������������ܶ��л�������ʱ������Ա������ڴ汩�������⡣
����ܽ�һЩ��������Ҫע���Ҫ�㣬

1. �л�ȫ��������ʱ�����ʹ��replaceScene������pushScene��
��ΪpushScene����������ǰһ��scene�������ǽ���һ��scene���ն�ջ�ķ�ʽ���뵽ǰһ��scene�����档�������������ڴ����д�Ĳ��õģ�����pushScene���ѷ��ָ÷�������⣬һ��������λ�����Ѷ�λ��replaceScene���Լ���Ľ��������������¶������

2. ������Ҫ��onEnter�����ʼ������Sprite
����ͺ���һ���е��ϵ�ˣ����ʹ����pushScene����ô��popScene��ʱ���ǲ������ǰһ��������init�����ģ�������ͬѧ��ϲ����һЩ��ʼ������onEnter���棬����Ϊʲô���ã���������һ�²�ͬ�л�������ʱ��ÿ��Scene���������ھ�֪���ˡ�
����scene A�ǻ����������������scene B��pushScene�滻A��A��B�����������������ģ�
B ---- init();
A ---- onExit();
B ---- onEnter();
B ---- onEnterTransitionDidFinish();

��ʱpopScene������scene B�������������£�
B ---- onExit();
B ---- ��������������
A ---- onEnter();

��������Կ������¼��㣬
1. A����������ʼ��δ�����ã����Aһֱ���ڴ��С�
2. ��ִ��B��init()������֮��ŵ���A��onExit()��������֮��ŵ���B��onEnter();���Գ�ʼ�����Ӧ�÷���init������ʼ��������һ�������˳�֮ǰ��ʼ���ú�һ��������Ҫ����Դ��

ͬ���ģ�����������һ��replaceScene�л�������scene����������
����scene A�ǻ����������������scene B��replaceScene�滻A��A��B�����������������ģ�
B ---- init();
A ---- onExit();
A ---- ��������������
B ---- onEnter();
B ---- onEnterTransitionDidFinish();

��ʱB replace A�����ĵ��ø�����һ�������£�
A ---- init();
B ---- onExit();
B ---- ������������
A ---- onEnter();
ref: http://blog.csdn.net/tonny_guan/article/details/28121973#


							IOSѧϰ����
1. �����ǰ����Ӧ�ó���֧�֣�����Զ���ʾInfo.plist�� Localization native development reָ�������ԡ�
2. iOS�ǻ���UNIX�ںˣ�android�ǻ���Linux�ں�
3. UIWindow��������UIView�ĸ���ͼ�������Э����Ӧ�ó������ʾ���ַ��¼���View��UIWindow����UIView�����࣬���Կ����������UIView��һ��Ӧ�ó���ֻ��һ��UIWindow���󣬼�ʹ�ж��UIWindow����
   Ҳֻ��һ��UIWindow���Խ��ܵ��û��Ĵ����¼���UIWindow��ʼ����appDeleDgate����� didFinishLaunchingWithOptions������
   UIView��UIView��̳���UIResponder����������Ļ�� ����һ������������ͼ����չʾ���漰��Ӧ�û����潻����ÿ����ͼ����Ҫ������Ⱦ��ͼ��������ݣ�����Ӧ�������з����Ĳ����¼���
   ������ʾ���ݺʹ����¼�֮�⣬��ͼ����Ƕ�ײ���������ͼ������ͼ��ָǶ�뵽��һ��ͼ�����ڲ�����ͼ���󣬶���Ƕ�����ͼ�����Ǹ���ͼ����ͼ��ӵ�window�оͻ���ʾ������iOS������ôʵ����ͼ��ʾ�ģ�������Ĵ��룺
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
���������������ͼ��view1��view2��view3��view3Ƕ����view2��

4. While reading /Users/hamiltonvergil/Documents/plate/cocos2d-x-2.2.1/client/Resources/Layout/GUI/labelatlasimg.png pngcrush caught libpng error:
   Read Error


5. Lua ȡ��
����

* ����ȡ����Ҳ���Ǵ�һ��
> print(math.ceil(2.1))
3
����ȡ��������Сһ��
> print(math.floor(2.1))
2
>

6. ɾ��table

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

7. UILayout Ĭ��ê����ccp(0, 0)

8. cocostudio ������ layout1 ��ӵ�layout2  ��ʱlayout1ê������ccp(0, 0)��layout2ê������ccp(0.5, 0.5)��
   ����cocostudio ������ layout1ê������ccp(0.5, 0.5)��layout2ê������ccp(0, 0)��
   
   yes:cocostudio������layout1, ���봴����layout2, layout2��ӵ�layout1, layout2ê������ccp(0.5, 0.5), layout1ê������ccp(0, 0) (����˵��layoutָ����UIPanel) 
   layout = UILayout:create()
   cclog(""..layout:getSize().width.."�� "..layout:getSize().height), width��height��Ϊ0

9. ʹ��removeUnusedTexture��������ȽϺã������ͷŵ����ü���Ϊ1������Ҳ��˵��������û����Ϊ���������ü������϶���û���ˡ���Щ����1���������ͷŵ�����ʹ�����ڲ�֪����������ٴμ��أ�Ҳֻ�Ƿ����Ѿ����غ��˵ġ�

10. 3.0�������� cocos new MyGame -p com.MyCompany.AwesomeGame -l cpp -d F:/MyProject ��http://www.cocos2d-x.org/docs/manual/framework/native/getting-started/v3.0/how-to-run-cpp-tests-on-win32/en��

11. ��Ϸ�Ż���
    1. We prefer audio file with MP3 data format. Because it is supported by both android and ios platform. And it is also compressed and hardware accelerated.
       You should keep your background music file with data size under 800KB. The simplest way is reduce background music time and repeat it in your program.
       You should keep your audio file��s sample rate around 96-128kbps and 44kHz bit rate is enough.
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

13. explicit���캯�� http://developer.51cto.com/art/201002/183398.htm

14. 
Max size of textures in cocos2d-x depends on each platform:
In theory, cocos2d-x could show textures in any size, but actually the maxsize of the textures is restricted by the hardware and the system.
Here I provide a texture-size restriction table on different platforms�� emulators.
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

15. �ڴ����ƽ̨�ϣ�Cocos2d-x���ò�ͬ��SDK API�����ű������ֺ���Ч��CocosDenshion��ͬһʱ��ֻ�ܲ���һ�ױ������֣�������ͬʱ���Ŷ����Ч��
Android ��android��CocosDenshion��֧�ֵ���Ƶ��ʽ�Ƕ�Ӧ��android.media.MediaPlayer��֧�ֵĸ�ʽ��Android ogg����õ�ѡ�񣬶�wav��֧�ֲ���̫�á�
IOS ��IOS����Cocos2d-x��CocosDenshion��֧�ֵĸ�ʽ��Cocos2d-iphone����֧�ֵ���һ����caf���Ƽ���һ��.
���棺Samsung i9100 �ƺ�����Ƶ����������һ��bug��������ͬʱ����̫����Ч�����Ե�����Samsung i9100��������ĳ����ʱ����ò�Ҫ����SimpleAudioEngine::playEffect(const char* filePah)̫��Ƶ����










































