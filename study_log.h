 
 1. mac 自定义类绑定：
 创建把MyClass.h .cpp加入clsaaes工程目录
 进入game/MyGame/frameworks/cocos2d-x/tools/tolua拷贝一个ini文件
 修改ini文件
 	[MyClass] （改）
	prefix           = MyClass
	target_namespace = MyNameSpace
	headers          = %(cocosdir)s/../runtime-src/Classes/MyClass.h
	classes          = MyClass
 修改genbindings.py
  cmd_args 加 'MyClass.ini' : ('MyClass', 'lua_MyClass_auto'), \ 把其他注释了
  进入game/MyGame/frameworks/cocos2d-x/tools/tolua，执行python genbingings.py
  在frameworks/cocos2d-x/cocos/scripting/lua-bindings/auto/下找到生产的hpp和cpp文件，把他们加进cocos2d_lua_bindings项目。
  由于lua_MyClass_auto.cpp文件要引用MyClass.h文件，而这俩文件分属于不同的子项目，互相不认识头文件的搜寻路径，因此需要手工修改一下
  cocos2d_lua_bindings.xcodeproj子项目的User Header Search Paths配置。加 $(SRCROOT)/../../../../../runtime-src/Classes

  后记补充：如果C++类定义了namespace，则需要修改frameworks/cocos2d-x/tools/bindings-generator/targets/lua/conversions.yaml文件，
  定义namespace与Lua之间的映射关系，否则会报conversion wasn't set错误
  "MyNameSpace::": "MyNameSpace."
  
  
 error: ImportError: No module named yaml
  解决：readme文件下有：输入下面3条命令 下载安装
  * Install python dependices by pip.
    sudo easy_install pip
    sudo pip install PyYAML
	sudo pip install Cheetah
http://segmentfault.com/a/1190000000631630
http://www.cocoachina.com/bbs/read.php?tid-196416-page-1.html

lua调用C++:
上面的MyClass绑定完后，按照Lua_web_socket.h的写法注册消息lua_MyClass_auto.cpp：
static int tolua_MyClass_registerCallbackHandler(lua_State* tolua_S)
{
#ifndef TOLUA_REELEASE
    tolua_Error tolua_err;
    if (!tolua_isusertype(tolua_S,1,"MyClass",0,&tolua_err))
        goto tolua_lerror;
    else
#endif
    {
        MyClass* self    = (MyClass*)  tolua_tousertype(tolua_S,1,0);
        if (NULL != self ) {
            int handler = (  toluafix_ref_function(tolua_S,2,0));
            ScriptHandlerMgr::getInstance()->addObjectHandler((void*)self, handler, ScriptHandlerMgr::HandlerType::EVENT_CUSTOM_BEGAN);
        }
    }
    return 0;
#ifndef TOLUA_RELEASE
tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'registerScriptHandler'.",&tolua_err);
    return 0;
#endif
}

static void extendMyClassLua(lua_State* tolua_S)
{
    lua_pushstring(tolua_S,"MyClass");
    lua_rawget(tolua_S,LUA_REGISTRYINDEX);
    if (lua_istable(tolua_S,-1))
    {
        lua_pushstring(tolua_S,"registerCallbackHandler");
        lua_pushcfunction(tolua_S,tolua_MyClass_registerCallbackHandler);
        lua_rawset(tolua_S,-3);
    }
    lua_pop(tolua_S, 1);
}

TOLUA_API int register_all_MyClass(lua_State* tolua_S)
{
    tolua_open(tolua_S); 
    
    tolua_module(tolua_S,nullptr,0);
    tolua_beginmodule(tolua_S,nullptr);
    
    lua_register_MyClass_MyClass(tolua_S);
    // 添加Q!!!!!!!
    extendMyClassLua(tolua_S);
    
    tolua_endmodule(tolua_S);
    return 1;
}
lua 调用注册函数：
function onSystemCallback(nType, sMsg)
    cclog("消息IIIIII。。。。"..nType)
end
local myc = MyClass:instance()
myc:registerCallbackHandler(onSystemCallback)

c++ 调用执行上面注册的handler
void MyClass::scriptTest()
{
    int nHandler = cocos2d::ScriptHandlerMgr::getInstance()->getObjectHandler(this, cocos2d::ScriptHandlerMgr::HandlerType::EVENT_CUSTOM_BEGAN);
    if(nHandler == 0) {
        return;
    }
    auto _stack = cocos2d::LuaEngine::getInstance()->getLuaStack();
    _stack->pushInt(123);
    _stack->executeFunctionByHandler(nHandler, 1);
//    _stack->pushInt((int)SDK_MSG_APPSTORY_BUY_SUCCESS);
//    _stack->pushString(productIdentifier.c_str());
//    _stack->pushString(transactionIdentifier.c_str());
//    _stack->pushString(transactionReceipt.c_str());
//    _stack->executeFunctionByHandler(nHandler, 4); // 参数个数
    _stack->clean();
}



2. adb logcat > foo.txt    保存在当前目录
ndk-stack -sym /Users/admin/Documents/git/BatteryClient/Maze2.0.0/proj.android/obj/local/armeabi  -dump /Users/admin/Documents/log17.txt

3.现在的SourceTree版本解决这个真的是太方便了
请看到右边 External Diff 模块 最下面有四个按钮
Stage Hunk 和 Discard Hunk

服务器直接覆盖掉本地冲突整个文件
直接单击按钮:Discard Hunk
本地直接覆盖掉服务器冲突文件
直接单击按钮:Stage Hunk

服务器直接覆盖掉本地冲突文件中某几行
选中文件中冲突的那几行
直接单击按钮:Discard Selected Lines
本地直接覆盖掉服务器冲突某几行
选中文件中冲突的那几行
直接单击按钮:Stage Selected Lines

最后，也可以点击External Diff 按钮，进行编辑。

3. android list targets （获得Android可用的虚拟设备）
   adb devices   (列出连接的设备)

4.
typedef pair <const int, string> value_type;
const std::map<int, string>::value_type init_value[] =
{
    std::map<int, string>::value_type( 0, "123"),
    std::map<int, string>::value_type( 1, "235"),
    std::map<int, string>::value_type( 2, "569"),
};
const std::map<int, string> m_mapPn(init_value, init_value+3);

5. 删除某目录下所有.svn文件 sudo find /Users/admin/Documents/git/BatteryClient/Maze2.0.0/proj.android/ -name ".svn" -exec rm -r {} \;

6. git 导出2个版本之间的差异文件 git diff 205c28c 0ab6198  --name-only >> diff.txt

7. py 学习

chmod +x test.py     # 脚本文件添加可执行权限

8. SourceTree mac下使用BeyondCompare出来冲突文件 http://adad184.com/2015/07/28/use-git-with-sourcetree-and-beyondcompare/
 显示 git配置 git config --list

1. 先安装好Beyond Compare (拷贝Beyond Compare.app到Applications目录)
2. 打开SourceTree的Preferences 选择Diff 在下面的External Diff/Merge中做如下设置
Visual Diff Tool: Other
Diff Command: /usr/local/bin/bcomp
Arguments: \$LOCAL \$REMOTE

Merge Tool: Other
Merge Command: /usr/local/bin/bcomp
Arguments: \$LOCAL \$REMOTE \$BASE \$MERGED

3. 打开终端 输入命令 (链接链接)
ln -s /Applications/Beyond Compare\ Compare.app/Contents/MacOS/bcomp /usr/local/bin/

9. open ~/.bash_profile

10. mac解压bin文件:
    1.cd 进入bin文件目录
    2.获取文件权限 chmod a+x android-ndk-r10c-darwin-x86_64.bin
    3.解压出文件在当前目录下 ./android-ndk-r10c-darwin-x86_64.bin

11. cocos2dx3.2 ndkr9d，在android5.0下 curl无效
描述
cocos2dx3.2 ndkr9d，在android5.0下 curl无效
原因
curl引起
解决方法
更新cocos官方最新curl, https://github.com/cocos2d/cocos2d-x-3rd-party-libs-bin
使用ndkr10c  (maybe ndkr10e)
编译提示 BundleReader::tell() 函数定义和声明的类型不一致，修改声明 long int tell() 为 ssize_t tell();  （ndk bug）
参考
https://github.com/cocos2d/cocos2d-x/issues/9138
http://cocos2d-x.org/news/307
http://discuss.cocos2d-x.org/t/httpclient-does-not-work-correctly-with-android-5-0/18190

环境变量设置：

CLASSPATH  .;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar
JAVA_HOME  D:\Program Files\Java\jdk1.7.0_51
path  %JAVA_HOME%\bin;C:\Program Files\Java\jre7\bin;C:\Python27;


COCOS_CONSOLE_ROOT  D:\cocos2d-x-3.2\tools\cocos2d-console\bin
ANDROID_SDK_ROOT  D:\android\adt-bundle-windows-x86-20140702\adt-bundle-windows-x86-20140702\sdk
ANT_ROOT  D:\android\apache-ant-1.9.3-bin\apache-ant-1.9.3\bin
NDK_ROOT  D:\android\android-ndk-r9-windows-x86\android-ndk-r9
Path   %NDK_ROOT%;%ANT_ROOT%;%ANDROID_SDK_ROOT%;%ANDROID_SDK_ROOT%\tools;%ANDROID_SDK_ROOT%\platform-tools;%COCOS_CONSOLE_ROOT%;
编译打包(1):
1. 按住shift键+鼠标右键 选择在此处(F:\cocos2d-x-3.2alpha0\cocos2d-x-3.2alpha0\tests\cpp-empty-test)打开命令窗口
2. cocos compile -p android –-ap 20
3. 生成包 F:\cocos2d-x-3.2alpha0\cocos2d-x-3.2alpha0\tests\cpp-empty-test\publish\android\CppEmptyTest-debug.apk
4. cd到apk目录 adb install CppEmptyTest-debug.apk
编译打包(2)(旧方法):
1. 进入 F:\cocos2d-x-3.2alpha0\cocos2d-x-3.2alpha0\build
2. 查看当前sdk中所包含的target以及相应id: android list targets
3. python android-build.py -p 19 cpp-empty-test     (19为target)
4. 生成包 F:\cocos2d-x-3.2alpha0\cocos2d-x-3.2alpha0\tests\cpp-empty-test\proj.android\bin\CppEmptyTest-debug.apk


使用Cocos2d-Console这个工具来创建和构建工程，这个工具提供了下面几个功能：
new 创建一个新的工程
compile 编译当前工程，生成二进制文件
deploy 发布程序到一个平台
run 编译和发布，和运行程序

cocos new Hello -p com.fjut.org -l cpp -d E:\

/////////////////// 
http://[jenkins-server]/[command] 
在这里[command]可以是：exit 退出，restart 重启， reload 重载。

1、BUILD FAILED: Android Unable to resolve target 'android-8'
在打包.apk的时候报下错误：
BUILD FAILED: Android Unable to resolve target 'android-8' .
这是因为原有project.properties 的 Project target 的版本号与你当前的android环境所支持的AVD版本号不一致，
解决： 打开项目文件project.properties ,修改其 target值，如 target=android-10//(对应的版本) 如果没有project.properties, 自己建立一个。

1、Android NDK: WARNING: APP_PLATFORM android-9 is larger than android:minSdkVersion 8 in ./AndroidManifest.xml
解决： NDK指定的版本与minSdkVersion不一致,找到proj.android目录下的AndroidManifest.xml，修改其minSdkVersion值  如<uses-sdk android:minSdkVersion="9"/>

3. Installation error: INSTALL_FAILED_INSUFFICIENT_STORAGE
解决方法1：直接在手机上面卸载该APK
解决方法2：试试修改一下manifest文件 :添加一句: 
android:installLocation="preferExternal" 

4.
android mac上环境变量配置 open ~/.bash_profile

export NDK_ROOT=/Users/admin/Documents/game/android-ndk-r9d
export PATH=$NDK_ROOT:$PATH

export COCOS_CONSOLE_ROOT=/Users/admin/Documents/game/cocos2d-x-3.2/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

export ANDROID_SDK_ROOT=/Users/admin/Documents/game/adt-bundle-mac-x86_64-20140624/sdk
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

export ANT_ROOT=/Users/admin/Documents/game/apache-ant-1.9.5/bin
export PATH=$ANT_ROOT:$PATH

5. iOS开发-Xcode Debug、Release、Archive、Profile、Analyze概念解释
   http://blog.csdn.net/mad1989/article/details/40658033

6. 报错: "relocation overflow in R_ARM_THM_CALL"  解决: 删除proj.android下obj文件夹，重新build

12. Gitlab配置ssh连接:
1. ssh-keygen -t rsa -C "xx@feiyu.com" -C 选项后是备注，可随意。
命令执行后会要求输入key存储的文件名和passphrase：
输入一个特有的文件名，否则使用默认的 id_rsa。
passphrase。不输入也可以。输入之后，提交的时候要输入这个passphrase
完成后在 ~/.ssh/ 会生成2个文件。id_rsa 和 id_rsa.pub。前者是私钥，注意保管，后者是公钥。
目录：/Users/admin/.ssh/id_rsa.pub，打开拷贝里面公钥，登录gitlab: Profile Settings => SSH-/Keys => Add SSH key。
测试：$ ssh -T git@github.com  如果出现错误提示：Permission denied (publickey) 因为新生成的key不能加入ssh就会导致连接不上github，输入以下命令：
先输入$ ssh-agent，再输入$ ssh-add ~/.ssh/id_rsa，这样就可以了
2. git clone git@192.168.1.22:xx/xx.git
3. SourceTree 添加文件夹

7. I faced a problem during "weibo sdk"(like facebook sdk) integration for android, cocos2dx3.2.
when the sdk is login success it will trigger my app from jni, that my app will show a UI.
the issue is that some CCLabels is replaced with black (ios will be fine, the issue is just on android)。
so i use "runAction" to let the UI show at next frame, then it will be ok.
the app enter foreground will trigger cocos2d::VolatileTextureMgr::reloadAllTextures() to reload texture.
so we should handle UI at next frame(maybe need more time).
the following code:
auto act = cocos2d::CallFunc::create([=](){
    showUI();
});
Scene* pScene = Director::getInstance()->getRunningScene();
pScene->runAction(act);

8. android.mk 包含文件： （ http://blog.ready4go.com/blog/2013/10/12/update-android-dot-mk-with-local-src-files-and-local-c-includes/ ）
# 配置自己的源文件目录和源文件后缀名
MY_FILES_PATH  :=  $(LOCAL_PATH) \
$(LOCAL_PATH)/../../Classes

MY_FILES_SUFFIX := %.cpp %.c

# 递归遍历目录下的所有的文件
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

# 获取相应的源文件
MY_ALL_FILES := $(foreach src_path,$(MY_FILES_PATH), $(call rwildcard,$(src_path),*.*) )
MY_ALL_FILES := $(MY_ALL_FILES:$(MY_CPP_PATH)/./%=$(MY_CPP_PATH)%)
MY_SRC_LIST  := $(filter $(MY_FILES_SUFFIX),$(MY_ALL_FILES))
MY_SRC_LIST  := $(MY_SRC_LIST:$(LOCAL_PATH)/%=%)

# 去除字串的重复单词
define uniq =
$(eval seen :=)
$(foreach _,$1,$(if $(filter $_,${seen}),,$(eval seen += $_)))
${seen}
endef

# 递归遍历获取所有目录
MY_ALL_DIRS := $(dir $(foreach src_path,$(MY_FILES_PATH), $(call rwildcard,$(src_path),*/) ) )
MY_ALL_DIRS := $(call uniq,$(MY_ALL_DIRS))

# 赋值给NDK编译系统
LOCAL_SRC_FILES  := $(MY_SRC_LIST)
LOCAL_C_INCLUDES := $(MY_ALL_DIRS)

9. ios 判断网络状态
使用apple教程Reachability.h, Reachability.m
int getNetworkStatus(std::string remoteHostName)
{
    NSString* nsRemoteHostName = [NSString stringWithUTF8String:remoteHostName.c_str()];
    Reachability* pReachability = nil;
    
    if (remoteHostName.length() > 0)
    {
        // a Reachability object for a remote host
        pReachability = [Reachability reachabilityWithHostName:nsRemoteHostName];
    }
    else
    {
        // a Reachability object for the internet
        pReachability = [Reachability reachabilityForInternetConnection];
    }
    
    NetworkStatus netStatus = [pReachability currentReachabilityStatus];
    switch (netStatus)
    {
            // NOT NET
        case NotReachable:
        {
            return 0;
            break;
        }
            // 3G/GPRS
        case ReachableViaWWAN:
        {
            return 1;
            break;
        }
            // WIFI
        case ReachableViaWiFi:
        {
            return 2;
            break;
        }
    }
    // unknow
    return 3;
}
int status = getNetworkStatus();
NSLog(@"网络状态: %d", status);

android 判断网络状态:
    需要访问网络，首先需要添加权限
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
public int getNetworkStatus(Context context)
{
    ConnectivityManager connActivityManager = (ConnectivityManager) context.getSystemService(context.CONNECTIVITY_SERVICE);
    NetworkInfo mNetworkInfo = connActivityManager.getActiveNetworkInfo();
    if (mNetworkInfo != null && mNetworkInfo.isAvailable())
    {
        // wifi
        if (mNetworkInfo.getType()==ConnectivityManager.TYPE_WIFI)
        {
            return 2;
        }
        // gprs
        else if (mNetworkInfo.getType()==ConnectivityManager.TYPE_MOBILE)
        {
            return 3;
        }
        // unknow
        else
        {
            return 0;
        }
    }
    // not available
    return 1;
}

10. xcodebuild, xcrun 命令行编译打包ipa
xcodebuild -scheme 'maze2.0.0 iOS' -destination 'platform=iphonesimulator,name=iPhone 6 Plus' -derivedDataPath build

11. 十分钟搞清字符集和字符编码:
小伙伴QQ上传过来的文件，在我们本地打开又乱码了。于是为了实现转换标准，各种字符集标准就出现了。简单的说字符集就规定了某个文字对应的二进制数字存放方式（编码）和某串二进制数值代表了哪个文字（解码）的转换关系。
简单的说乱码的出现是因为：编码和解码时用了不同或者不兼容的字符集。
http://cenalulu.github.io/linux/character-encoding/

12. .dSYM(debugging SYMbols)又称为调试符号表，是苹果为了方便调试和定位问题而使用的一种调试方案，本质上使用的是起源于贝尔实验室的DWARF（Debugging With Attributed Record Formats），其在.xcarchive目录中的层次结构为：
.xcarchive
--dSYMs
|--Your.app.dSYM
|--Contents
|--Resources
|--DWARF

13. 使Xcode调试控制台色彩更丰富 : https://github.com/robbiehanson/XcodeColors
下载编译XcodeColors target 插件自动拷贝到"~/Library/Application Support/Developer/Shared/Xcode/Plug-ins/XcodeColors.xcplugin"，退出xcode，重启。
使用：
#define XCODE_COLORS_ESCAPE @"\033["
#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color
#define LogBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

调用:
setenv("XcodeColors", "YES", 0);
char *xcode_colors = getenv("XcodeColors");
if (xcode_colors && (strcmp(xcode_colors, "YES") == 0))
{
    NSLog(@"// XcodeColors is installed and enabled!");
}

NSLog(@"After building the XcodeColors plugin for the first time, you MUST RESTART XCODE.");
NSLog(@"If you still don't see colors below, please consult the README.");
NSLog(XCODE_COLORS_ESCAPE @"fg0,0,255;" @"Blue text" XCODE_COLORS_RESET);
NSLog(XCODE_COLORS_ESCAPE @"bg220,0,0;" @"Red background" XCODE_COLORS_RESET);
NSLog(XCODE_COLORS_ESCAPE @"fg0,0,255;"
      XCODE_COLORS_ESCAPE @"bg220,0,0;"
      @"Blue text on red background"
      XCODE_COLORS_RESET);

NSLog(XCODE_COLORS_ESCAPE @"fg209,57,168;" @"You can supply your own RGB values!" XCODE_COLORS_RESET);
LogBlue(@"Blue text via macro");




































