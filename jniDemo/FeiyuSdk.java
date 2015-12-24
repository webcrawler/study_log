
package com.feiyu.youli;

import org.cocos2dx.cpp.AppActivity;
import org.cocos2dx.lib.Cocos2dxActivity;

import com.feiyu.youli.sdk.SDKAccount;
import com.feiyu.youli.sdk.base.bean.SDKGameInfo;
import com.feiyu.youli.sdk.base.bean.SDKInitInfo;
import com.feiyu.youli.sdk.base.bean.SDKOrderInfo;
import com.feiyu.youli.sdk.base.bean.SDKPayInfo;
import com.feiyu.youli.sdk.base.bean.SDKUserInfo;
import com.feiyu.youli.sdk.base.config.SDKGameConfig;
import com.feiyu.youli.sdk.base.listener.SDKListener;
import com.feiyu.youli.sdk.replace.SDKContainer;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;

public class FeiyuSdk 
{ 
	private static Cocos2dxActivity mActivity = null;
	
    private static Handler mSDKHandler = new Handler(Looper.getMainLooper());;
    private static final int DELAY_MS = 50;
	
    // op type
	private static int kEvent_type_loginFail = 0;
	private static int kEvent_type_loginCancel = 1;
	private static int kEvent_type_paySuccess = 2;
	private static int kEvent_type_payFail = 3;
	private static int kEvent_type_payCancel = 4;
	private static int kEvent_type_userCenterShow = 5;
	private static int kEvent_type_userCenterHide = 6;
	private static int kEvent_type_pausePageShow = 7;
	private static int kEvent_type_pausePageHide = 8;
	private static int kEvent_type_exitGame = 9;
	private static int kEvent_type_antiAddiction = 10;
	
    // 设置activity
    public static void initSDK(Activity activity)
    {
		if (activity instanceof Cocos2dxActivity) 
		{
			mActivity = (Cocos2dxActivity) activity;
		} 
		else 
		{
			throw new IllegalArgumentException("initSDK函数的activity参数必须设置为Cocos2dxActivity类型, 且不为null. ");
		}

        // 生命周期接口
        doOnCreate(mActivity);
    	// init
    	doInit();
    }
    
    private static void doInit()
    {
    	// 初始化配置
    	SDKInitInfo initInfo = new SDKInitInfo();
    	// todo
    	initInfo.setGameVersion(AppActivity.getVersionName());
    	// SDK初始化
    	SDKAccount.getInstance().doInit(mActivity, initInfo, new SDKListener() 
    	{
    	    /**
    	     * 初始化结束回调
    	     * isSuccess true成功 false失败
    	     */
    	    @Override
    	    public void initFinish(boolean isSuccess) 
    	    {
    	    	onInitFinish(isSuccess);
    	    }

    	    /**
    	     * 登陆成功回调
    	     * userInfo 用户信息
    	     */
    	    @Override
    	    public void loginSuccess(SDKUserInfo userInfo)
    	    {
    	        // 第三方SDK的user id
    	        String uid = userInfo.getUid();
    	        // uuid(全网唯一)，游戏根据这个值找到对应的账号
    	        String uuid = userInfo.getUuid();
    	        // 第三方账号名字
    	        String username = userInfo.getUsername();
    	        // 昵称
    	        String nickname = userInfo.getNickname();
    	        // token用于服务端校验用户是否登录的认证码
    	        String token = userInfo.getToken();
    	        // 平台代号
    	        String platform = userInfo.getPlatform();
    	        // 第三方平台额外信息
    	        String ext = userInfo.getExt();
    	        
    	        onLoginSuccess(uid, uuid, username, nickname, token, platform, ext);
    	    }

    	    /**
    	     * 登陆失败回调
    	     */
    	    @Override
    	    public void loginFailure() {
    	    	onFeiyuSdkEvent(kEvent_type_loginFail);
    	    }

    	    /**
    	     * 登陆取消回调
    	     */
    	    @Override
    	    public void loginCancel() {
    	    	System.out.println("java 登录取消!!!");
    	    	onFeiyuSdkEvent(kEvent_type_loginCancel);
    	    }

    	    /**
    	     * 注销成功回调
    	     * isSuccess true成功 false失败
    	     */
    	    @Override
    	    public void logouFinish(boolean isSuccess) {
    	    	System.out.println("java 注销成功回调");
    	    	onlogoutFinish(isSuccess);
    	    }

    	    /**
    	     * 支付成功回调
    	     */
    	    @Override
    	    public void paySuccess() {
    	    	onFeiyuSdkEvent(kEvent_type_paySuccess);
    	    	String orderId = SDKOrderInfo.getInstance().getOrderId();
    	    	System.out.println("支付成功回调，订单号：" + orderId);
    	    	onPaySuccess(orderId);
    	    }

    	    /**
    	     * 支付失败回调
    	     */
    	    @Override
    	    public void payFailure() {
    	    	onFeiyuSdkEvent(kEvent_type_payFail);
    	    	String orderId = SDKOrderInfo.getInstance().getOrderId();
    	    	System.out.println("支付失败回调，订单号：" + orderId);
    	    	onPayFail(orderId);
    	    }

    	    /**
    	     * 支付取消回调
    	     */
    	    @Override
    	    public void payCancel() {
    	    	onFeiyuSdkEvent(kEvent_type_payCancel);
    	    }

    	    /**
    	     * 用户中心显示回调
    	     */
    	    @Override
    	    public void usercenterShowed() {
    	    	onFeiyuSdkEvent(kEvent_type_userCenterShow);
    	    }

    	    /**
    	     * 用户中心隐藏回调
    	     */
    	    @Override
    	    public void usercenterHided() {
    	    	onFeiyuSdkEvent(kEvent_type_userCenterHide);
    	    }

    	    /**
    	     * 暂停页面显示回调
    	     */
    	    @Override
    	    public void pausePageShowed() {
    	    	onFeiyuSdkEvent(kEvent_type_pausePageShow);
    	    }

    	    /**
    	     * 暂停页面隐藏回调
    	     */
    	    @Override
    	    public void pausePageHided() {
    	    	onFeiyuSdkEvent(kEvent_type_pausePageHide);
    	    }

    	    /**
    	     * 退出/关闭游戏
    	     */
    	    @Override
    	    public void exitGame() {
    	    	System.out.println("java 退出/关闭游戏");
    	        //执行游戏退出代码
    	    	onFeiyuSdkEvent(kEvent_type_exitGame);
    	    }

    	    /**
    	     * 防沉迷查询回调
    	     */
    	    @Override
    	    public void antiAddiction() {
    	    	onFeiyuSdkEvent(kEvent_type_antiAddiction);
    	    }

    	    /**
    	     * 显示log信息 方便调试
    	     * code信息编码
    	     * desc信息内容
    	     */
    	    @Override
    	    public void showMessege(int code, String desc) {
    	    	System.out.println("feiyu sdk showMessege: code=" + code + ", message=" + desc);
    	    }
    	});
    }
    
    // 该接口用来弹出登录窗口。在游戏需要登录的地方调用。
    public static void doLogin()
    {
    	System.out.println("飞鱼sdk doLogin");
        SDKAccount.getInstance().doLogin(mActivity);
    }

    // 该接口会先调用退出接口，然后调用登录接口。一般是用在游戏要注销用户或切换用户的地方。
    // 调用该方法，会先将原来的用户信息注销，然后弹出登录窗口。
    public static void doSwitchAccount()
    {
        SDKAccount.getInstance().doSwitchAccount(mActivity);
    }

    // 该接口是在点击支付的时候调用。SDKPayInfo是支付信息类，用来传递支付信息。
    public static void doPay(String amount, String coinType, String ExtStr, String notifyUrl, String orderId, 
    		String productId, String productName, String roleId, String roleLv, String roleName, String serverId, 
    		String serverName, String userId, String userName, String vipLv)
    {
        // 支付信息
        SDKPayInfo sdkPayInfo = new SDKPayInfo();

        // 支付金额(单位：分)
        sdkPayInfo.setAmount(amount);
        // 货币类型
        sdkPayInfo.setCoinType(coinType);
        // 额外信息
        sdkPayInfo.setExt(ExtStr);
        // 支付回调地址            
        sdkPayInfo.setNotifyUri(notifyUrl);
        // 订单号
        sdkPayInfo.setOrderId(orderId);
        // 产品id
        sdkPayInfo.setProductId(productId);
        // 产品名称
        sdkPayInfo.setProductName(productName);
        // 角色名称
        sdkPayInfo.setRoleId(roleId);
        // 角色等级
        sdkPayInfo.setRoleLevel(roleLv);
        // 角色名字
        sdkPayInfo.setRoleName(roleName);
        // 区服id
        sdkPayInfo.setServerId(serverId);
        // 区服名称
        sdkPayInfo.setServerName(serverName);
        // 用户id
        sdkPayInfo.setUserId(userId);
        // 用户名称
        sdkPayInfo.setUsername(userName);
        // vip等级
        sdkPayInfo.setVipLevel(vipLv);

        // 调用支付
        SDKAccount.getInstance().doPay(mActivity, sdkPayInfo);
    }

    // 是否有关闭游戏对话框 true有/false没有
    public static boolean doExitGame()
    {
    	return SDKAccount.getInstance().doExitGame(mActivity);
    }

    // 该接口是在选择角色以后，进入游戏时调用，用来做数据统计。SDKGameInfo为游戏的信息类，用来传递一些游戏信息。
    public static void doEnterGame(String serverId, String roleId)
    {
        SDKGameInfo gameInfo = new SDKGameInfo();
        // 服务器id
        gameInfo.setServerId(serverId);
        // 角色id
        gameInfo.setRoleId(roleId);
        // 进入游戏时调用
        SDKAccount.getInstance().doEnterGame(mActivity, gameInfo);
    }

    // 该接口是在角色升级时调用，用来做数据统计。SDKGameInfo为游戏的信息类，用来传递一些游戏信息。
    public static void doUpdateRole(String roleId, String roleLv)
    {
        SDKGameInfo gameInfo = new SDKGameInfo();
        // 角色id
        gameInfo.setRoleId(roleId);
        // 角色等级
        gameInfo.setRoleLevel(roleLv);
        // 角色升级
        SDKAccount.getInstance().doUpdateRole(mActivity, gameInfo);
    }

    // 用户退出时调用。
    public static void doLogout()
    {
        SDKContainer.getInstance().doLogout(mActivity);
    }

    // 此方法用来控制悬浮窗口的打开或关闭。isVisiabletrue为打开，false为关闭。
    public static void doSetting(final boolean bOpen)
    {
        // 在UI线程执行
        runOnMainThread(new Runnable() 
        {
            @Override
            public void run()
            {
            	SDKContainer.getInstance().doSetting(mActivity, bOpen);
            }
        });
    }
    
    private static void runOnMainThread(Runnable runnable) {
        mSDKHandler.postDelayed(runnable, DELAY_MS);
    }

    // 该方法用来打开SDK的用户中心。
    public static void doUserCenter()
    {
        SDKContainer.getInstance().doUserCenter(mActivity);
    }

    // 该接口是比较特殊的接口。像360这样的SDK才会用到。用来弹出防沉迷系统。
    public static void doAntiAddiction()
    {
        SDKContainer.getInstance().doAntiAddiction(mActivity);
    }

    // 上传游戏信息, 该接口用于SDK收集游戏数据。
    public static void doUploadGameInfo(String serverId, String serverName, String roleId, String roleLv, String roleName, String uid, String nickName, String extStr)
    {
        SDKGameInfo gameInfo = new SDKGameInfo();
        gameInfo.setServerId(serverId);
        gameInfo.setServerName(serverName);
        gameInfo.setRoleId(roleId);
        gameInfo.setRoleLevel(roleLv);
        gameInfo.setRoleName(roleName);
        gameInfo.setUid(uid);
        gameInfo.setNickName(nickName);
        gameInfo.setExt(extStr);
        SDKAccount.getInstance().doUploadGameInfo(mActivity, gameInfo);
    }

    // 该接口用于SDK数据采集。在创建角色的时候调用。
    public static void doCreateRole(String serverId, String serverName, String roleId, String roleLv, String roleName, String uid, String nickName, String extStr)
    {
        SDKGameInfo gameInfo = new SDKGameInfo();
        gameInfo.setServerId(serverId);
        gameInfo.setServerName(serverName);
        gameInfo.setRoleId(roleId);
        gameInfo.setRoleLevel(roleLv);
        gameInfo.setRoleName(roleName);
        gameInfo.setUid(uid);
        gameInfo.setNickName(nickName);
        gameInfo.setExt(extStr);
        SDKAccount.getInstance().doCreateRole(mActivity, gameInfo);
    }

    // 该接口用于SDK数据采集。在角色退出的时候调用。
    public static void doQuitRole(String serverId, String serverName, String roleId, String roleLv, String roleName, String uid, String nickName, String extStr)
    {
        SDKGameInfo gameInfo = new SDKGameInfo();
        gameInfo.setServerId(serverId);
        gameInfo.setServerName(serverName);
        gameInfo.setRoleId(roleId);
        gameInfo.setRoleLevel(roleLv);
        gameInfo.setRoleName(roleName);
        gameInfo.setUid(uid);
        gameInfo.setNickName(nickName);
        gameInfo.setExt(extStr);
        // 角色退出
        SDKAccount.getInstance().doQuitRole(mActivity, gameInfo);
    }

    // 该接口用来获取数据中心的渠道id。
    public static String getFYDataChannelId()
    {
        return SDKAccount.getInstance().getFYDataChannelId();
    }
    
    // 该接口用来获取数据中心的渠道名称
    public static String getFYDataChannelName()
    {
    	String channel = SDKGameConfig.FYSDK_GAME_CHANNEL;
        return channel;
    }

    // 该方法用来获取用户中心app id。
    public static String getFYDataAppId()
    {
        return SDKAccount.getInstance().getFYDataAppId();
    }

    // 该方法用来获取用户中心app key。
    public static String getFYDataAppKey()
    {
        return SDKAccount.getInstance().getFYDataAppKey();
    }

    // 该方法用来获取用户中心设备id。
    public static String getFYDataDeviceId()
    {
        return SDKAccount.getInstance().getFYDataDeviceId(mActivity);
    }

    // ******************** 生命周期 begin********************
    private static void doOnCreate(Activity activity)
    {
        SDKAccount.getInstance().doOnCreate(activity);
    }

    public static void doOnStart(Activity activity)
    {
        SDKAccount.getInstance().doOnStart(activity);
    }

    public static void doOnResumed(Activity activity)
    {
        SDKAccount.getInstance().doOnResumed(activity);
    }

    public static void doOnPaused(Activity activity)
    {
        SDKAccount.getInstance().doOnPaused(activity);
    }

    public static void doOnStop(Activity activity)
    {
        SDKAccount.getInstance().doOnStop(activity);
    }

    public static void doOnDestroy(Activity activity)
    {
        SDKAccount.getInstance().doOnDestroy(activity);
    }

    public static void doOnActivityResult(Activity activity, int requestCode, int resultCode, Intent intent)
    {
        SDKAccount.getInstance().doOnActivityResult(activity, requestCode, resultCode, intent);
    }

    public static void doOnNewIntent(Activity activity, Intent intent)
    {
        SDKAccount.getInstance().doOnNewIntent(activity, intent);
    }

    public static void doOnRestart(Activity activity)
    {
        SDKAccount.getInstance().doOnRestart(activity);
    }
    // ******************** 生命周期 end********************
    
    public static void showExitGameDialog()
    {
        // 在UI线程执行
        runOnMainThread(new Runnable() 
        {
            @Override
            public void run()
            {
                new AlertDialog.Builder(mActivity).setTitle("提示")
                .setIconAttribute(android.R.attr.alertDialogIcon)
                .setMessage("确定要退出游戏吗?")
                .setPositiveButton("确认", new DialogInterface.OnClickListener()
                {
                    @Override
                    public void onClick(DialogInterface dialog, int which)
                    {
                    	onFeiyuSdkEvent(kEvent_type_exitGame);
                    	//mActivity.finish();
                    }
                })
                .setNegativeButton("取消", null)
                .create().show();
            }
        });
    }
    
    private static native void onLoginSuccess(String uid, String uuid, String username, String nickname, String token, String platform, String ext);
    private static native void onFeiyuSdkEvent(int eventType);
    private static native void onInitFinish(boolean isSuccess);
    private static native void onlogoutFinish(boolean isSuccess);
    private static native void onPaySuccess(String orderId);
    private static native void onPayFail(String orderId);
}








