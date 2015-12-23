#!/bin/bash
security unlock-keychain -p " " ~/Library/Keychains/login.keychain
# 当前文件权限
chmod 777 "$0"

########### ReadMe ############
# cocos2d-x android项目打包
# 配置好android开发环境
# android工程下 配置好ant.properties文件签名证书

########### 项目配置 ############
targetName="shellIpaTest"  #target name
projctDir="/Users/admin/Documents/shellIpaTest"  #项目目录(可选)
buildConfig="Debug"  #编译配置 Debug Release (可选)
androidPlat=17 # android sdk 编译版本 (可选)
apkOutputPath=""  # apk生成路径, 默认工程目录下 (可选)
aotuInstall=""	#打包完,是否自动安装到设备上(true,false), 默认false (可选)

########### 目录名称初始化 ############
if test ${#projctDir} -eq 0
then
	projctDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  #当前shell脚本目录
fi
# apk path 
if test ${#apkOutputPath} -eq 0
then
	apkOutputPath="${projctDir}"
fi

buildModeName=`echo $buildConfig | tr "[:upper:]" "[:lower:]"` #编译模式 名称转小写
tmpApkFilePath="${projctDir}"/bin/"${buildModeName}"/android     #默认apk生成路径
apkOutputFile=""  #输出的apk文件名
tmpApkFile=""	#默认生成的apk文件名

# ########### 删除projectDir/bin下文件 ############
rm -rf "${tmpApkFilePath}"

cd $projctDir  # cd
curTime="$(date +%Y%m%d_)$(date "+%H%M%S")"  #当前时间

########### 执行build run ############
cocos compile -p android -m ${buildModeName} --ap ${androidPlat} -s "${projctDir}"

########### 文件名 ############
if [ "${buildModeName}"x = "debug"x ]
then
	tmpApkFile="${tmpApkFilePath}"/"${targetName}"-debug.apk     #默认生成的不带签名 apk名称
	apkOutputFile="${apkOutputPath}"/"${targetName}"-debug_"${curTime}".apk  #输出生成的不带签名 apk名称
else
	tmpApkFile="${tmpApkFilePath}"/"${targetName}"-release-signed.apk     #默认生成的不带签名 apk名称
	apkOutputFile="${apkOutputPath}"/"${targetName}"-release-signed_"${curTime}".apk  #输出生成的不带签名 apk名称
fi

########### 检查tmp apk文件是否存在 ############
if test -e "${tmpApkFile}" 
then
	echo "生成的tmp apk文件路径: $tmpApkFile"
else 
	echo "生成tmp apk失败! $tmpApkFile 文件不存在!!!!!!"
	exit 1
fi

########### 拷贝apk到指定目录 ############
cp ${tmpApkFile} ${apkOutputFile}

########### 检查输出的apk文件是否存在 ############
if test -e "${apkOutputFile}" 
then
	echo ""
	echo -e "\033[35m~~~~~~~~~~~~~~~~ success ~~~~~~~~~~~~~~~~~~~~~~\033[0m"
	echo -e "\033[35m生成的apk文件路径: "${apkOutputFile}"\033[0m"
else 
	echo "生成apk失败! $apkOutputFile 文件不存在!!!!!!"
	echo "请检查: $tmpApkFilePath 文件是否存在!!!!!"
	exit 1
fi

########### 登陆用户IP ############
replaceString()
{
	local inputString=$1
	result=${inputString//(/}
	result=${result//)/}
	echo $result
}
loginIp=""
loginServer=`echo $loginInfo |awk '{print $6}'`
if [ -n "$loginServer" ]; then
	loginIp="$(replaceString $loginServer)"
else
    loginIp="localhost(127.0.0.1)" 
fi

########### 信息 ############
echo -e "\033[35m项目名称: "${targetName}" \033[0m"
echo -e "\033[35m编译模式: "${buildConfig}" \033[0m"
echo -e "\033[35m打包时间: "${curTime}" \033[0m"
echo -e "\033[35m登陆用户: "${LOGNAME}" \033[0m"
echo -e "\033[35m登陆地址: "${loginIp}" \033[0m"
echo -e "\033[35m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[0m\033[0m"

########### 安装到设备上 ############
if [ "${aotuInstall}"x = "true"x ]
then
	echo "安装中..."
	adb install "$apkOutputFile"
fi








