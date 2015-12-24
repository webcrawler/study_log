
#include "FeiyuSdk_Android.h"
#include "feiyuSdk/FeiyuSdk.h"

static FeiyuSdkHelper* _instance = NULL;
static const char* PACKAGE_NAME = "com/feiyu/youli/FeiyuSdk";

FeiyuSdkHelper::FeiyuSdkHelper()
{

}

FeiyuSdkHelper::~FeiyuSdkHelper()
{
}

FeiyuSdkHelper* FeiyuSdkHelper::getInstance()
{
	if (_instance == NULL)
	{
		_instance = new FeiyuSdkHelper();
	}
	return _instance;
}

static bool getMethod(JniMethodInfo& mi, const char* methodName, const char* signature)
{
    return JniHelper::getStaticMethodInfo(mi, PACKAGE_NAME, methodName, signature);
}

static void releaseMethod(JniMethodInfo& mi) 
{
    mi.env->DeleteLocalRef(mi.classID);
}

void FeiyuSdkHelper::doLogin()
{
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "doLogin", "()V");
    if (isHave)
     {
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID);
        releaseMethod(mi);
    }
}

void FeiyuSdkHelper::doPay(const char* amount, const char* coinType, const char* ExtStr, const char* notifyUrl, const char* orderId, 
            const char* productId, const char* productName, const char* roleId, const char* roleLv, const char* roleName, const char* serverId, 
            const char* serverName, const char* userId, const char* userName, const char* vipLv)
{
    JniMethodInfo mi;
    const char* signature = "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V";
    bool isHave = getMethod(mi, "doPay", signature);
    if (isHave)
    {
        jstring amount_content = mi.env->NewStringUTF(amount);
        jstring coinType_content = mi.env->NewStringUTF(coinType);
        jstring ExtStr_content = mi.env->NewStringUTF(ExtStr);
        jstring notifyUrl_content = mi.env->NewStringUTF(notifyUrl);
        jstring orderId_content = mi.env->NewStringUTF(orderId);
        jstring productId_content = mi.env->NewStringUTF(productId);
        jstring productName_content = mi.env->NewStringUTF(productName);
        jstring roleId_content = mi.env->NewStringUTF(roleId);
        jstring roleLv_content = mi.env->NewStringUTF(roleLv);
        jstring roleName_content = mi.env->NewStringUTF(roleName);
        jstring serverId_content = mi.env->NewStringUTF(serverId);
        jstring serverName_content = mi.env->NewStringUTF(serverName);
        jstring userId_content = mi.env->NewStringUTF(userId);
        jstring userName_content = mi.env->NewStringUTF(userName);
        jstring vipLv_content = mi.env->NewStringUTF(vipLv);
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID, amount_content, coinType_content, 
            ExtStr_content, notifyUrl_content, orderId_content, productId_content, productName_content, 
            roleId_content, roleLv_content, roleName_content, serverId_content, serverName_content, 
            userId_content, userName_content, vipLv_content);
        mi.env->DeleteLocalRef(amount_content);
        mi.env->DeleteLocalRef(coinType_content);
        mi.env->DeleteLocalRef(ExtStr_content);
        mi.env->DeleteLocalRef(notifyUrl_content);
        mi.env->DeleteLocalRef(orderId_content);
        mi.env->DeleteLocalRef(productId_content);
        mi.env->DeleteLocalRef(productName_content);
        mi.env->DeleteLocalRef(roleId_content);
        mi.env->DeleteLocalRef(roleLv_content);
        mi.env->DeleteLocalRef(roleName_content);
        mi.env->DeleteLocalRef(serverId_content);
        mi.env->DeleteLocalRef(serverName_content);
        mi.env->DeleteLocalRef(userId_content);
        mi.env->DeleteLocalRef(userName_content);
        mi.env->DeleteLocalRef(vipLv_content);
        releaseMethod(mi);
    }
}

bool FeiyuSdkHelper::doExitGame()
{
    JniMethodInfo mi;
    jboolean hasExitDialog = false;
    bool isHave = getMethod(mi, "doExitGame", "()Z");
    if (isHave)
    {
    	hasExitDialog = mi.env->CallStaticBooleanMethod(mi.classID, mi.methodID);
        releaseMethod(mi);
    }
    return hasExitDialog;
}

void FeiyuSdkHelper::doEnterGame(const char* serverId, const char* roleId)
{
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "doEnterGame", "(Ljava/lang/String;Ljava/lang/String;)V");
    if (isHave)
     {
        jstring roleId_content = mi.env->NewStringUTF(roleId);
        jstring serverId_content = mi.env->NewStringUTF(serverId);
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID, serverId_content, roleId_content);
        mi.env->DeleteLocalRef(roleId_content);
        mi.env->DeleteLocalRef(serverId_content);
        releaseMethod(mi);
    }
}

void FeiyuSdkHelper::doUpdateRole(const char* roleId, const char* roleLv)
{
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "doUpdateRole", "(Ljava/lang/String;Ljava/lang/String;)V");
    if (isHave)
     {
        jstring roleId_content = mi.env->NewStringUTF(roleId);
        jstring roleLv_content = mi.env->NewStringUTF(roleLv);
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID, roleId_content, roleLv_content);
        mi.env->DeleteLocalRef(roleId_content);
        mi.env->DeleteLocalRef(roleLv_content);
        releaseMethod(mi);
    }
}

void FeiyuSdkHelper::doLogout()
{
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "doLogout", "()V");
    if (isHave)
     {
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID);
        releaseMethod(mi);
    }
}

void FeiyuSdkHelper::doSetting(bool bOpen)
{
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "doSetting", "(Z)V");
    if (isHave)
     {
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID, bOpen);
        releaseMethod(mi);
    }
}

void FeiyuSdkHelper::doUserCenter()
{
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "doUserCenter", "()V");
    if (isHave)
     {
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID);
        releaseMethod(mi);
    }
}

void FeiyuSdkHelper::doAntiAddiction()
{
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "doAntiAddiction", "()V");
    if (isHave)
     {
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID);
        releaseMethod(mi);
    }
}

void FeiyuSdkHelper::doUploadGameInfo(const char* serverId, const char* serverName, const char* roleId, const char* roleLv, 
    const char* roleName, const char* uid, const char* nickName, const char* extStr)
{
    JniMethodInfo mi;
    const char* signature = "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V";
    bool isHave = getMethod(mi, "doUploadGameInfo", signature);
    if (isHave)
     {
        jstring serverId_content = mi.env->NewStringUTF(serverId);
        jstring serverName_content = mi.env->NewStringUTF(serverName);
        jstring roleId_content = mi.env->NewStringUTF(roleId);
        jstring roleLv_content = mi.env->NewStringUTF(roleLv);
        jstring roleName_content = mi.env->NewStringUTF(roleName);
        jstring uid_content = mi.env->NewStringUTF(uid);
        jstring nickName_content = mi.env->NewStringUTF(nickName);
        jstring extStr_content = mi.env->NewStringUTF(extStr);
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID, serverId_content, serverName_content, roleId_content, 
            roleLv_content, roleName_content, uid_content, nickName_content, extStr_content);
        mi.env->DeleteLocalRef(extStr_content);
        mi.env->DeleteLocalRef(roleId_content);
        mi.env->DeleteLocalRef(roleLv_content);
        mi.env->DeleteLocalRef(roleName_content);
        mi.env->DeleteLocalRef(serverId_content);
        mi.env->DeleteLocalRef(serverName_content);
        mi.env->DeleteLocalRef(nickName_content);
        mi.env->DeleteLocalRef(uid_content);
        releaseMethod(mi);
    }
}

void FeiyuSdkHelper::doCreateRole(const char* serverId, const char* serverName, const char* roleId, const char* roleLv, 
    const char* roleName, const char* uid, const char* nickName, const char* extStr)
{
    JniMethodInfo mi;
    const char* signature = "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V";
    bool isHave = getMethod(mi, "doCreateRole", signature);
    if (isHave)
    {
        jstring serverId_content = mi.env->NewStringUTF(serverId);
        jstring serverName_content = mi.env->NewStringUTF(serverName);
        jstring roleId_content = mi.env->NewStringUTF(roleId);
        jstring roleLv_content = mi.env->NewStringUTF(roleLv);
        jstring roleName_content = mi.env->NewStringUTF(roleName);
        jstring uid_content = mi.env->NewStringUTF(uid);
        jstring nickName_content = mi.env->NewStringUTF(nickName);
        jstring extStr_content = mi.env->NewStringUTF(extStr);
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID, serverId_content, serverName_content, roleId_content, 
            roleLv_content, roleName_content, uid_content, nickName_content, extStr_content);
        mi.env->DeleteLocalRef(extStr_content);
        mi.env->DeleteLocalRef(roleId_content);
        mi.env->DeleteLocalRef(roleLv_content);
        mi.env->DeleteLocalRef(roleName_content);
        mi.env->DeleteLocalRef(serverId_content);
        mi.env->DeleteLocalRef(serverName_content);
        mi.env->DeleteLocalRef(nickName_content);
        mi.env->DeleteLocalRef(uid_content);
        releaseMethod(mi);
    }
}

void FeiyuSdkHelper::doQuitRole(const char* serverId, const char* serverName, const char* roleId, const char* roleLv, 
    const char* roleName, const char* uid, const char* nickName, const char* extStr)
{
    JniMethodInfo mi;
    const char* signature = "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V";
    bool isHave = getMethod(mi, "doQuitRole", signature);
    if (isHave)
    {
        jstring serverId_content = mi.env->NewStringUTF(serverId);
        jstring serverName_content = mi.env->NewStringUTF(serverName);
        jstring roleId_content = mi.env->NewStringUTF(roleId);
        jstring roleLv_content = mi.env->NewStringUTF(roleLv);
        jstring roleName_content = mi.env->NewStringUTF(roleName);
        jstring uid_content = mi.env->NewStringUTF(uid);
        jstring nickName_content = mi.env->NewStringUTF(nickName);
        jstring extStr_content = mi.env->NewStringUTF(extStr);
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID, serverId_content, serverName_content, roleId_content, 
            roleLv_content, roleName_content, uid_content, nickName_content, extStr_content);
        mi.env->DeleteLocalRef(extStr_content);
        mi.env->DeleteLocalRef(roleId_content);
        mi.env->DeleteLocalRef(roleLv_content);
        mi.env->DeleteLocalRef(roleName_content);
        mi.env->DeleteLocalRef(serverId_content);
        mi.env->DeleteLocalRef(serverName_content);
        mi.env->DeleteLocalRef(nickName_content);
        mi.env->DeleteLocalRef(uid_content);
        releaseMethod(mi);
    }
}

string FeiyuSdkHelper::getFYDataChannelId()
{
    string channelId = "";
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "getFYDataChannelId", "()Ljava/lang/String;");
    if (isHave)
    {
        jstring jstr_value = (jstring)mi.env->CallStaticObjectMethod(mi.classID, mi.methodID);
        channelId = cocos2d::JniHelper::jstring2string(jstr_value);
        mi.env->DeleteLocalRef(jstr_value);
        releaseMethod(mi);
    }
    return channelId;
}

string FeiyuSdkHelper::getFYDataAppId()
{
    string appId = "";
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "getFYDataAppId", "()Ljava/lang/String;");
    if (isHave)
    {
        jstring jstr_value = (jstring)mi.env->CallStaticObjectMethod(mi.classID, mi.methodID);
        appId = cocos2d::JniHelper::jstring2string(jstr_value);
        mi.env->DeleteLocalRef(jstr_value);
        releaseMethod(mi);
    }
    return appId;
}

string FeiyuSdkHelper::getFYDataAppKey()
{
    string appKey = "";
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "getFYDataAppKey", "()Ljava/lang/String;");
    if (isHave)
    {
        jstring jstr_value = (jstring)mi.env->CallStaticObjectMethod(mi.classID, mi.methodID);
        appKey = cocos2d::JniHelper::jstring2string(jstr_value);
        mi.env->DeleteLocalRef(jstr_value);
        releaseMethod(mi);
    }
    return appKey;
}

string FeiyuSdkHelper::getFYDataDeviceId()
{
    string deviceId = "";
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "getFYDataDeviceId", "()Ljava/lang/String;");
    if (isHave)
    {
        jstring jstr_value = (jstring)mi.env->CallStaticObjectMethod(mi.classID, mi.methodID);
        deviceId = cocos2d::JniHelper::jstring2string(jstr_value);
        mi.env->DeleteLocalRef(jstr_value);
        releaseMethod(mi);
    }
    return deviceId;
}

void FeiyuSdkHelper::showExitGameDialog()
{
    JniMethodInfo mi;
    bool isHave = getMethod(mi, "showExitGameDialog", "()V");
    if (isHave)
     {
        mi.env->CallStaticVoidMethod(mi.classID, mi.methodID);
        releaseMethod(mi);
    }
}

extern "C"
{
#if (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID) 
	// 登录成功
	void Java_com_feiyu_youli_FeiyuSdk_onLoginSuccess(JNIEnv* env, jobject thiz, jstring uid, jstring uuid,
			jstring username, jstring nickname, jstring token, jstring platform, jstring ext)
	{
		CCLOGINFO("call Java_com_feiyu_youli_FeiyuSdk_onLoginSuccess succeed");

		const char* uid_ = env->GetStringUTFChars(uid, NULL);
		const char* uuid_ = env->GetStringUTFChars(uuid, NULL);
		const char* username_ = env->GetStringUTFChars(username, NULL);
		const char* nickname_ = env->GetStringUTFChars(nickname, NULL);
		const char* token_ = env->GetStringUTFChars(token, NULL);
		const char* platform_ = env->GetStringUTFChars(platform, NULL);
		const char* ext_ = env->GetStringUTFChars(ext, NULL);

		FeiyuSdkUserInfo info;
		info.uid = uid_;
		info.uuid = uuid_;
		info.username = username_;
		info.nickname = nickname_;
		info.token = token_;
		info.platform = platform_;
		info.ext = ext_;
        log("登录成功: uid=%s, uuid=%s, username=%s, nickname=%s, token=%s, platform=%s, ext=%s", uid_, uuid_, username_, nickname_, token_, platform_, ext_);
        // set
		FeiyuSdk::getInstance()->setFeiyuSdkInfo(info);

		env->ReleaseStringUTFChars(uid, uid_);
		env->ReleaseStringUTFChars(uuid, uuid_);
		env->ReleaseStringUTFChars(username, username_);
		env->ReleaseStringUTFChars(nickname, nickname_);
		env->ReleaseStringUTFChars(token, token_);
		env->ReleaseStringUTFChars(platform, platform_);
		env->ReleaseStringUTFChars(ext, ext_);
	}

	// 回调事件
	void Java_com_feiyu_youli_FeiyuSdk_onFeiyuSdkEvent(JNIEnv* env, jobject thiz, jint eventType)
	{
		log("call Java_com_feiyu_youli_FeiyuSdk_onFeiyuSdkEvent succeed");
		string str = "";
		int eventType_ = (int)eventType;
        FeiyuSdk::getInstance()->onFeiyuSdkEvent(eventType_);
	}

	// sdk 初始化结果
	void Java_com_feiyu_youli_FeiyuSdk_onInitFinish(JNIEnv* env, jobject thiz, jboolean isSuccess)
	{
		CCLOGINFO("call Java_com_feiyu_youli_FeiyuSdk_onInitFinish succeed");
		unsigned char b = isSuccess;
		bool b_ = (b) ? true : false;
		log("飞鱼sdk 初始化回调");
		FeiyuSdk::getInstance()->setSdkInitState(b_);
	}

	// 注销回调
	void Java_com_feiyu_youli_FeiyuSdk_onlogoutFinish(JNIEnv* env, jobject thiz, jboolean isSuccess)
	{
		log("call Java_com_feiyu_youli_FeiyuSdk_onlogoutFinish succeed");
		unsigned char b = isSuccess;
		bool b_ = (b) ? true : false;
        FeiyuSdk::getInstance()->onSwitchAccount(b_);
	}

    // 支付成功回调
    void Java_com_feiyu_youli_FeiyuSdk_onPaySuccess(JNIEnv* env, jobject thiz, jstring orderId)
    {
        const char* orderId_ = env->GetStringUTFChars(orderId, NULL);
        FeiyuSdk::getInstance()->onPaySuccess(orderId_);
        env->ReleaseStringUTFChars(orderId, orderId_);  
    }

    // 支付失败回调

    void Java_com_feiyu_youli_FeiyuSdk_onPayFail(JNIEnv* env, jobject thiz, jstring orderId)
    {
        const char* orderId_ = env->GetStringUTFChars(orderId, NULL);
        FeiyuSdk::getInstance()->onPayFail(orderId_);
        env->ReleaseStringUTFChars(orderId, orderId_); 
    }     
#endif
}










