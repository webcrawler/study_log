#!/bin/bash
#security unlock-keychain -p " " ~/Library/Keychains/login.keychain
# 当前文件权限
#chmod 777 "$0"

########### ReadMe ############
# cocos2d-x ios项目打包
# 确保项目在xcode能正常执行 （配置好项目）

########### 项目配置 ############
targetName="shellIpaTest iOS"  #target name
productName="shellIpaTest iOS"  #product name
buildConfig="Release"  #编译配置 Debug Release
projctDir="/Users/admin/Documents/shellIpaTest/proj.ios_mac"  #项目目录(可选)
# codeSignIdentity="iPhone Distribution: Feiyu Co.,Ltd. (xxxx)"  #证书(可选)
# provisionFile="/Users/admin/Documents/XC_Ad_Hoc_comxxxx.mobileprovision" #描述文件(可选)

installFileScriptName="transporter_chief.rb"  #安装ipa到设备脚本

######## 安装ipa到设备脚本 ###########
fileRootPath=${0%/*}
installFileScriptName="transporter_chief.rb"
chmod 777 ${fileRootPath}/${installFileScriptName}

########### 目录名称初始化 ############
if test ${#projctDir} -eq 0
then
	projctDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  #当前shell脚本目录
fi
cd $projctDir  # cd
curTime="$(date +%Y%m%d_)$(date "+%H%M%S")"  #当前时间
buildDir=$projctDir/build  #build目录
appDir=$buildDir/$buildConfig-iphoneos	#build对应配置目录
ipaName=`echo $targetName | tr "[:upper:]" "[:lower:]"` #iap名称转小写
formatFileName=_"${buildConfig}"_"${curTime}"
appFileDir=$appDir/"${productName}".app  #生成的.app文件
iapExportDir=$appDir/"${ipaName}"${formatFileName}.ipa  #生成的.iap文件

########### 删除build ############
# rm -rf "${buildDir}"
# rm -rf "$appDir/$ipaName.ipa"

########### 执行结果检测 ############
resultCheck()
{
	operateStr=("Clean" "编译" "生成ipa" "安装ipa")
    if test $2 -eq 0 
    then
    	echo "~~~~~~~~~~~~~~~~~~~${operateStr[$1]}成功~~~~~~~~~~~~~~~~~~~"
    else
    	echo "~~~~~~~~~~~~~~~~~~~${operateStr[$1]}失败~~~~~~~~~~~~~~~~~~~"
    	exit 1
    fi
}

########### 执行build run ############
# xcodebuild -target "${targetName}" clean  #target clean
# resultCheck 0 $?
# xcodebuild -target "${targetName}" -showBuildSettings  #显示build settings

# 判断是否有证书  #PRODUCT_NAME="${targetName}"
if test ${#codeSignIdentity} -eq 0
then
	echo "~~~~~~~~~~~~~~~~~~~没有配置证书, 默认使用工程配置~~~~~~~~~~~~~~~~~~~"
	xcodebuild -target "${targetName}" -configuration $buildConfig
	resultCheck 1 $?
	xcrun -sdk iphoneos packageapplication -v "${appFileDir}" -o "${iapExportDir}"
	resultCheck 2 $?
else
	echo "~~~~~~~~~~~~~~~~~~~存在证书~~~~~~~~~~~~~~~~~~~"
	xcodebuild -target "${targetName}" CODE_SIGN_IDENTITY="${codeSignIdentity}" -configuration $buildConfig
	resultCheck 1 $?
	# 判断是否有描述文件
	if test ${#provisionFile} -eq 0
	then
		xcrun -sdk iphoneos packageapplication -v "${appFileDir}" -o "${iapExportDir}" \
		CODE_SIGN_IDENTITY="${codeSignIdentity}"
		resultCheck 2 $?
	else
		echo "~~~~~~~~~~~~~~~~~~~存在描述文件~~~~~~~~~~~~~~~~~~~"
		xcrun -sdk iphoneos packageapplication -v "${appFileDir}" -o "${iapExportDir}" \
		CODE_SIGN_IDENTITY="${codeSignIdentity}" EMBEDDED_PROFILE_NAME="${provisionFile}"
		resultCheck 2 $?
	fi
fi

########### 检查iap文件是否存在 ############
if test -e "$iapExportDir" 
then
	echo ""
	echo -e "\033[35m~~~~~~~~~~~~~~~~ success ~~~~~~~~~~~~~~~~~~~~~~\033[0m"
	echo -e "\033[35m生成的文件路径: "${iapExportDir}"\033[0m"
else 
	echo "生成失败! $iapExportDir 文件不存在!!!!!!"
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

########### 安装ipa到设备上 ############
installIpaScriptPath=${0%/*}/${installFileScriptName}
chmod 777 installIpaScriptPath

echo -e "\033[35m"~~~~~~~~~~~~~~~~~~~ 正在安装... /~~~~~~~~~~~~~~~" \033[0m"
# install ipa to device
${installIpaScriptPath} ${iapExportDir}
resultCheck 3 $?
#echo -e "\033[35m"~~~~~~~~~~~~~~~~~~~ 安装成功！~~~~~~~~~~~~~~~~~~~" \033[0m"
echo -e "\033[0m\033[0m"







