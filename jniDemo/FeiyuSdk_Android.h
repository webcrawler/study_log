#ifndef __FEIYU_SDK_ANDROID_H__
#define __FEIYU_SDK_ANDROID_H__

#include "cocos2d.h"

using namespace std;

#if (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID)
#include <jni.h>
#include "platform/android/jni/JniHelper.h"
#endif

using namespace cocos2d;

class FeiyuSdkHelper
{
public:
	FeiyuSdkHelper();
	virtual ~FeiyuSdkHelper();
	static FeiyuSdkHelper* getInstance();

public:
	void doLogin();
	void doPay(const char* amount, const char* coinType, const char* ExtStr, const char* notifyUrl, const char* orderId, 
            const char* productId, const char* productName, const char* roleId, const char* roleLv, const char* roleName, const char* serverId, 
            const char* serverName, const char* userId, const char* userName, const char* vipLv);
	bool doExitGame();
	void doEnterGame(const char* serverId, const char* roleId);
	void doUpdateRole(const char* roleId, const char* roleLv);
	void doLogout();
	void doSetting(bool bOpen);
	void doUserCenter();
	void doAntiAddiction();
	void doUploadGameInfo(const char* serverId, const char* serverName, const char* roleId, const char* roleLv, 
    const char* roleName, const char* uid, const char* nickName, const char* extStr);
	void doCreateRole(const char* serverId, const char* serverName, const char* roleId, const char* roleLv, 
    const char* roleName, const char* uid, const char* nickName, const char* extStr);
	void doQuitRole(const char* serverId, const char* serverName, const char* roleId, const char* roleLv, 
    const char* roleName, const char* uid, const char* nickName, const char* extStr);
	string getFYDataChannelId();
	string getFYDataAppId();
	string getFYDataAppKey();
	string getFYDataDeviceId();
	void showExitGameDialog();
};

#endif
