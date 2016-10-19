#if 0
1. // proj.linux/main.cpp  linux 平台手动指定画面大小
CCEGLView* eglView = CCEGLView::sharedOpenGLView();
eglView->setFrameSize(720, 480);  // FrameSize 是实际的屏幕分辨率
在此我们首先认识了 FrameSize 参数，在游戏运行时，我们可以通过 CCEGLView::sharedOpenGLView()->getFrameSize();获得此值。
如果在手机上运行，那么不同分辨率将会得到不同的值，既然这个值不可控，那么在写游戏中也就没有参考价值了，比如我们写一个精灵的位置距离底部 320 高度，在 480×320 分辨率，能看到其在屏幕上方，如果换一台手机分辨率 960×540 那么只能显示在中间靠上的位置，如果设置精灵位置为距离屏幕上方（高度）320，反之依然，显示效果不一。

2. DesignResolutionSize！顾名思义，也就是逻辑上的游戏屏幕大小，在这里我们设置了其分辨率为 720×480 为例，那么在游戏中，我么设置精灵的位置便可以参照此值，如 左下角 ccp(0,0)，右上角 ccp(720, 480)，而不论 FrameSize 的大小为多少，是 720×480 也是，是 480×320 也罢，总能正确显示其位置，左下角和右上角。能够实现这一点的原因是，固定了设计分辨率大小，从而确定了其固定的宽高比，它的 优势 是可以使用具体的数值摆放精灵位置，不会因为实际屏幕大小宽高比而使得内部元素相对位置关系出现混乱。

3. 我们可以通过如下方法获取到 setDesignResolutionSize 所设置的值：CCSize winSize = CCDirector::sharedDirector()->getWinSize();

4. http://www.zhihu.com/question/20583941 
iOS 设备现有的分辨率如下：
iPhone/iPod Touch
普通屏 320像素 x 480像素 iPhone 1、3G、3GS，iPod Touch 1、2、3
3：2 Retina 屏 640像素 x 960像素 iPhone 4、4S，iPod Touch 4
16：9 Retina 屏 640像素 x 1136像素 iPhone 5，iPod Touch 5
iPad
普通屏 768像素 x 1024像素 iPad 1， iPad2，iPad mini
Retina屏 1536像素 x 2048像素 New iPad，iPad 4

5. FrameSize 是实际的屏幕分辨率，而 VisibleSize 是在 WinSize 之内，保持 FrameSize 的宽高比所能占用的最大区域，实际屏幕分辨率 H I J K (黑色) 可以大于 WinSize ，但VisibleSize 一定会小于或者等于 WinSize，这两者相同的是宽高比。VisibleSize 有着 WinSize 大小（随WinSize 的大小改变而改变），还有着 FrameSize 的宽高比，它标示 在设计分辨率（WinSize）下，在屏幕中的可见区域大小。 而 VisibleOrigin 则标示在设计分辨率下被截取的区域大小，用点 K 标示，有了这些数据，我们想让游戏元素始终在屏幕显示的区域之内不成难事.
eg:
FrameSize:          width = 720, height = 420
WinSize:            width = 720, height = 480
VisibleSize:        width = 720, height = 420
VisibleOrigin:      x = 0, y = 30

6. COCOS2D_VERSION 

7. virtual void update(float fDelta);
		// 升级特效
		CCParticleSystemQuad* meteor = CCParticleSystemQuad::create( "particles/forgeMonsterUp.plist"); 
		if (meteor != NULL)
		{
			meteor->setBlendAdditive(true);
			meteor->setAutoRemoveOnFinish(true);
			meteor->setPosition(ccp(480, 235)); 
			addChild(meteor, 20000);
			this->scheduleUpdate();
		}
    void CForgeMonster::update(float fDelta)
{
	static unsigned int i = 0;
	debug_Printf("static i = %d\n", i);

	if (meteor != NULL)
	{
		meteor->setPosition(ccp(600, 235)); 
	}
	else
	{
		debug_Printf("NULL\n");
	}
}

8. 当一张图片被加载到内存后，它是以纹理的形式存在的。纹理是什么东西呢？纹理就是一块内存，这块内存中存放的是按照指定的像素格式填充的图片像素信息。它被最终作为三角面着色所依据的数据源。 http://blog.csdn.net/honghaier/article/details/8068895

9. 一张宽高均为1024大小的格式为RGBA8888的纹理。其占用的内存量至少是4M。所以，你一定要在纹理的优化上下功夫。
10.        //对容器进行一个随机排序  
        random_shuffle(m_pSpriteVec.begin(),m_pSpriteVec.end());  
        //初始化一下随机种子，后面用于产生随机位置  
        srand(GetTickCount());  
        //产生精灵  
        for(int i = 0 ; i < nRepeat; i++)  
        {  
            for(int j = 0 ; j < 34; j++)  
            {  
                int nIndex = i * 34 + j ;  
                int nPosX  = rand()%960;  
                int nPosY  = rand()%640;  
                m_pSpriteVec[nIndex]->setPosition(ccp(origin.x + nPosX, origin.y + nPosY));  
                this->addChild(m_pSpriteVec[nIndex], 1);  
            }  
        }  
  
    }  
	
11.	int* p = new int();
	*p = 19;
	CCCallFuncN* delNodeCall		= CCCallFuncND::create(this, callfuncND_selector(CShopForPumpCardAni::delNode), p);
	
	void CShopForPumpCardAni::delNode(CCNode* node, void* p)
{
	debug_Printf("callFunNd:%d\n", *((int*)p) );
	node->removeFromParentAndCleanup(true);
	node = NULL;
}

12.
	// 取得引擎的配置信息  
	CCConfiguration* conf = CCConfiguration::sharedConfiguration(); 
	// 取得配置信息中指定的最大纹理大小  
	unsigned maxTextureSize = conf->getMaxTextureSize(); 
	// 查看是否支持非2的幂次方大小的纹理
	if ( conf->supportsNPOT() )
	{
		printf("yes supportsNPOT !\n");
	}
	printf("maxTextureSize = %d\n", maxTextureSize);

	CCTextureCache::sharedTextureCache()->addImage("background2.jpg");
	CCTextureCache::sharedTextureCache()->addImage("background2.png");
	CCTextureCache::sharedTextureCache()->removeTextureForKey("background2.png");

	CCTextureCache::sharedTextureCache()->dumpCachedTextureInfo();
	
	CCTextureCache::sharedTextureCache()->removeUnusedTextures();  // 删除资源引用计数为1的纹理

removeUnusedTextures(); //将引用计数为1的图片释放掉	
	
13. NSURL* url = [NSURL URLWithString:@"http://www.firedragonpzy.com.cn"];
[[UIApplication sharedApplication] openURL:url];  混编

14. you can get the real screen size by CCEGLView::sharedOpenGLView()->getFrameSize().
	All your game's coordinates rely on design resolution no matter what the size of your device screen. If the UI layout of your game is the same on all resolutions, you just need only a set of coordinates. Design resolution is set by CCEGLView::sharedOpenGLView()->setDesignResolutionSize(width, height, policy), the first and second parameters are the width and height of design resoultion and the third parameter is the policy you want to use. I will explain the third parameter later. 

15. 加快动画：CCDirector::sharedDirector()->getScheduler()->setTimeScale(2.0f);
广州|好嘢(490826200)  15:55:54
单个用CCSpeed

16. http://www.dapps.net/dev/gamedev/ios-dev-cocos2d-x-get-img-url.html

17. CCMessageBox("COn", "title");

18. 




























































































































































#endif