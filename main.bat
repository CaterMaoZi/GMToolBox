@echo off
::总处理
::=============================================
setlocal EnableDelayedExpansion
set ver=0.4.6
set rever=Gamma
if not exist %SYSTEMDRIVE%\Windows\Logs\GmBox.%ver% (
md %SYSTEMDRIVE%\Windows\GmBox>nul
md %SYSTEMDRIVE%\Windows\GmBox\error>nul
md %SYSTEMDRIVE%\Windows\GmBox\first>nul
md %SYSTEMDRIVE%\Windows\GmBox\uicolour>nul
md %SYSTEMDRIVE%\Windows\GmBox\temp>nul
md %SYSTEMDRIVE%\Windows\GmBox\admin>nul
md %SYSTEMDRIVE%\Windows\GmBox\newshz>nul
md %SYSTEMDRIVE%\Windows\GmBox\findip>nul
md %SYSTEMDRIVE%\Windows\GmBox\defender>nul
md %SYSTEMDRIVE%\Users\GMBox
md %SYSTEMDRIVE%\Users\GMBox\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}>nul
echo true>%SYSTEMDRIVE%\Windows\Logs\GmBox.%ver% )
for /f "delims=" %%a in (%SYSTEMDRIVE%\Windows\GmBox\admin\godefender.ini) do (
set godefender=%%~a
)
for /f "delims=" %%a in (%SYSTEMDRIVE%\Windows\GmBox\admin\debug.ini) do (
set debug=%%~a
)
for /f "delims=" %%a in (%SYSTEMDRIVE%\Windows\GmBox\defender\ban.ban) do (
set bangodo=%%~a
)
for /f "delims=" %%a in (%SYSTEMDRIVE%\Windows\GmBox\uicolour\backcolour.ini) do (
set backcolour=%%~a
)
for /f "delims=" %%a in (%SYSTEMDRIVE%\Windows\GmBox\uicolour\wordcolour.ini) do (
set wordcolour=%%~a
)
if not exist %SYSTEMDRIVE%\Windows\GmBox\uicolour\backcolour.ini (
set backcolour=1)
if not exist %SYSTEMDRIVE%\Windows\GmBox\uicolour\wordcolour.ini (
set wordcolour=F)
if exist %SYSTEMDRIVE%\Windows\GmBox\admin\vip.ini (
set vip=true) else (set vip=false)
if exist %SYSTEMDRIVE%\Windows\GmBox\admin\admingroup.admin (
set admingroup=true) else (set admingroup=false)
set name=%~n0
set pt=%~dp0
set hz=%~x0
::=============================================
goto :defender
:defender
::自我保护
::=============================================
if !debug! == true echo on
if !godefender! == true goto :defendergo1
if !bangodo! == true (
set bannedid=001
goto :bantitle)
if !hz! == .exe ( goto :defendergo1 ) else ( 
set banyear=0
set banmonth=0
set banday=3
set bantime=0
set bannedid=001
goto :banned
)
:defendergo1
if %name% == 光云工具箱%ver% (
    if not exist %SYSTEMDRIVE%\Windows\GmBox\first\%ver%.start (
          goto :first ) else (
                        goto :menu )
						)else (
						      set errorid=001
						      goto :error)
::==============================================
:error
::错误
::==============================================
cls						   
color 4f
title 光云工具箱-ErrorID:!errorid!
echo                            错误
echo 发生了致命的错误！
echo 错误代码:!errorid!
set ing=%date:~0,4%-%date:~5,2%-%date:~8,2%_%random%%time:~1,1%-%time:~3,2%-%time:~6,2%--!errorid!.error
echo false>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
echo 以下是该错误的介绍：
echo.
if !errorid! == 001 (
echo 天盾检测到您使用的光云工具箱有内容被恶意篡改！
echo 已进行修复
echo 请等待1-15秒
ping -n 7 1.1.1.1>nul
goto :reload
:load
start !load!
rename "!pt!!name!!hz!" 光云工具箱%ver%!hz!
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
cls
exit )
if !errorid! == 002 (
echo 您输入的指令错误！无法执行！
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 3 1.1.1.1>nul
cls 
goto :defender)
if !errorid! == 003 (
echo 密码错误！
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 2 127.0.0.1>nul
goto :defender )
if !errorid! == 004 (
echo 未知的调试指令！
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 2 127.0.0.1>nul
goto :create )
if !errorid! == 005 (
echo 未知的错误！请等待片刻返回主页面！
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 4 1.1.1.1>nul
goto :defender)
if !errorid! == 006 (
echo 都被封了就不要再瞎输入了奥！
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 5 1.1.1.1>nul
goto :defender)
if !errorid! == 007 (
echo 禁止在未输入文字的情况下按Enter键！
echo.
echo 会退出的Bug在0.2.4版本已被修复！
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 4 1.1.1.1>nul
goto :defender)

::===============================================
:first
::版本第一次进入跳转区
::===============================================
title 光云工具箱%ver%
cls
color %backcolour%%wordcolour%
echo        检测到您是第一次使用此版本 为您跳转至本页面
echo.
echo                     光云工具箱 [%ver%]
echo           在使用之前，请您务必读完本页面的文字：
echo.
echo 光云工具箱是一个集合各种小工具组成的工具箱，它可以为您提供各种便捷的服务
echo 我在此声明:
echo 禁止在我们未授权的情况下 恶意篡改，破解，反编译此软件
echo 违者按《中华人民共和国著作权保护法》予以追究！
echo 警告！禁止本工具箱所提供的功能用于非法用途!
echo 如您违反并被追究责任，我们将不负任何责任，当您使用此软件时表明您已经同意。
echo 此声明最终解释权归 光云制作组 所有！
echo 工具箱处于测试阶段，如发现Bug请发送邮件至luckycatgod@qq.com或进群反馈，您
echo 将有可能成为我们的测试员。
echo.
echo  [T] 同意                 [F] 拒绝
echo.
set /p first=请输入：
if %first% == T goto :firstT
if %first% == F goto :firstF
if %first% == t goto :firstT
if %first% == f goto :firstF
set errorid=002
goto :error
:firstT
echo true>%SYSTEMDRIVE%\Windows\GmBox\first\%ver%.start
goto :menu
:firstF
exit
::===============================================
:reload
::重启区
::===============================================
set load=%SYSTEMDRIVE%\Windows\GmBox\temp\%date:~0,4%-%date:~5,2%-%date:~8,2%_%random%%time:~1,1%-%time:~3,2%-%time:~6,2%
echo @echo off>>!load!.bat
PowerShell -Command "& {get-content !load!.bat -encoding utf8 | set-content !load!.temp -encoding unicode}"
echo call "!pt!光云工具箱%ver%%hz%">>!load!.bat
echo exit>>!load!.bat
if !errorid! == 001 goto :load
::===============================================
:menu
::菜单区
::===============================================
cls
set menuin=air
title 光云工具箱%ver%-菜单
color %backcolour%%wordcolour%
if %vip% == true echo 尊敬的VIP用户，欢迎使用光云工具箱[%ver%]
echo =============================================================
echo                            菜单
echo [1]设置 [2]垃圾清理 [3]Windows快捷工具库 [4]定时关机
echo [5]系统修复 [6]查看电脑当前所有进程信息 [7]追踪域名的IP地址
echo [8]信息轰炸 [9]分区修复 [10]查看电脑配置 [11]上帝模式
echo [12]社工查询
echo =============================================================
echo.
set /p menuin=输入您要执行的编号:
if %menuin% == air goto airbug
if %menuin% == 1 goto :set
if %menuin% == 2 goto :clean
if %menuin% == 3 goto :tool
if %menuin% == 4 goto :shutdown
if %menuin% == 5 goto :sfc
if %menuin% == 6 goto :lookpc
if %menuin% == 7 goto :findip
if %menuin% == 8 goto :newsboom
if %menuin% == 9 goto :chkdsk
if %menuin% == 10 goto :PCinfo
if %menuin% == 11 goto :godmode
if %menuin% == 12 goto :qbcx
set errorid=002
goto :error
::================================================
:set
::设置区
::================================================
cls
set setin=air
title 光云工具箱%ver%-设置
echo                  设置 [输入No返回菜单]
echo [1]界面颜色
echo [2]加入官方Q群
echo [3]内置Cmd
echo [4]清除缓存
echo [5]当前账户
echo [6]访问官网
echo [7]修复工具箱
echo.
echo [G]立即下载最新版光云工具箱
echo.
echo [A]更新记录 [B]作者信息 [C]调试模式
echo.
echo 工具箱处于测试阶段，如发现Bug请发送邮件至luckycatgod@qq.com或进群反馈
echo.
set /p setin=输入您要执行的编号:
if %setin% == air goto airbug
if %setin% == no goto :menu
if %setin% == nO goto :menu
if %setin% == No goto :menu
if %setin% == NO goto :menu
if %setin% == c goto :createmode
if %setin% == C goto :createmode
IF %setin% == 7 goto :fixall
if %setin% == 1 goto :uicolour
if %setin% == 2 goto :joinQQ
if %setin% == 3 goto :nzcmd
if %setin% == 6 (start http://x.x.x.x/example.html
goto defender)
if %setin% == 4 goto :cleanhc
if %setin% == A goto :max
if %setin% == a goto :max
if %setin% == g (start http://x.x.x.x/example.exe
goto defender)
if %setin% == G (start http://x.x.x.x/example.exe
goto defender)
if %setin% == b goto :info
if %setin% == B goto :info
if %setin% == 5 goto :usernow
set errorid=002
goto :error
::=================================================
:createmode
::调试模式
::=================================================
cls
if %admingroup% == true goto create
title 光云工具箱%ver%-调试模式登录
color %backcolour%%wordcolour%
set /p password=请输入密码:
if !password! == 081103 ( 
cls
echo 欢迎您！
ping -n 1 127.0.0.1>nul
goto :create
) else (
set errorid=003
goto :error
)
:create
cls
color 06
title 光云工具箱%ver%-调试模式
echo                       调试模式
if !godefender! == true (set set1=开启) else (set set1=关闭)
if !debug! == true (set set2=开启) else (set set2=关闭)
echo 跳过Defender检测:!set1!
echo Debug模式: !set2!
echo.
echo                        设置
echo [1]开启/关闭跳过Defender检测 [2]版本信息
echo [3]返回菜单 [4]一键解封
echo [5]Debug模式 开/关 [6]绑定开发者身份
echo.
set /p createin=输入编号:
if !createin! == 1 goto :create1
if !createin! == 2 goto :create2
if !createin! == 3 goto :menu
if !createin! == 4 goto :unban
if !createin! == 5 goto :create3
if !createin! == 6 goto :bindadmin
set errorid=004
goto :error
:create1
if !godefender! == true (goto :c1t) else (goto :c1f)
:c1t
echo false>%SYSTEMDRIVE%\Windows\GmBox\admin\godefender.ini
set godefender=false
goto :create
:c1f
echo true>%SYSTEMDRIVE%\Windows\GmBox\admin\godefender.ini
set godefender=true
goto :create
:create3
if !debug! == true (goto :c3t) else (goto :c3f)
:c3t
echo false>%SYSTEMDRIVE%\Windows\GmBox\admin\debug.ini
set debug=false
@echo off
goto :create
:c3f
echo true>%SYSTEMDRIVE%\Windows\GmBox\admin\debug.ini
set debug=true
@echo on
goto :create
:create2
cls
title 你好 开发者
echo 当前真实版本:!rever!!ver!
echo.
echo 作者:Cater
echo.
echo 作者QQ:3600873229
echo.
echo 按任意键返回
pause>nul
goto :create
:unban
cls
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\defender\time.ban
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\defender\year.ban
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\defender\day.ban
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\defender\month.ban
echo false>%SYSTEMDRIVE%\Windows\GmBox\defender\ban.ban
echo 解封成功！
ping -n 2 127.1.1.1>nul
goto :create
::=================================================
:banned
::banned
::=================================================
echo true>%SYSTEMDRIVE%\Windows\GmBox\defender\ban.ban
if %date:~8,1% == 0 (set /a bannedday=!date:~9,1!+!banday!) else (
set /a bannedday=!date:~8,2!+!banday!)
if %date:~5,1% == 0 (set /a bannedmonth=!date:~6,1!+!banmonth!) else (
set /a bannedmonth=!date:~5,2!+!banmonth!)
if %time:~0,1% == 0 (set /a bannedtime=!time:~1,1!+!bantime!) else (
set /a bannedtime=!time:~0,2!+!bantime!)
set /a bannedyear=!date:~0,4!+!banyear!
if !bannedmonth! == 1 goto :thirtyone
if !bannedmonth! == 3 goto :thirtyone
if !bannedmonth! == 5 goto :thirtyone
if !bannedmonth! == 7 goto :thirtyone
if !bannedmonth! == 8 goto :thirtyone
if !bannedmonth! == 10 goto :thirtyone
if !bannedmonth! == 12 goto :thirtyone
if !bannedmonth! == 2 goto :twentyeight
if !bannedmonth! == 4 goto :thirty
if !bannedmonth! == 6 goto :thirty
if !bannedmonth! == 9 goto :thirty
if !bannedmonth! == 11 goto :thirty
set errorid=005
goto :error
:thirtyone
if !bannedday! GTR 31 (
set /a bannedday=!bannedday!-31
set /a bannedmonth=!bannedmonth!+1
goto :years)
:thirty
if !bannedday! GTR 30 (
set /a bannedday=!bannedday!-30
set /a bannedmonth=!bannedmonth!+1
goto :years)
:twenryeight
if !bannedday! GTR 28 (
set /a bannedday=!bannedday!-28
set /a bannedmonth=!bannedmonth!+1
goto :years)
:years
if !bannedmonth! GTR 12 (
set /a bannedmonth=!bannedmonth!-12
set /a bannedyear=!bannedyear!+1
goto :bantime)
:bantime
echo !bannedyear!>%SYSTEMDRIVE%\Windows\GmBox\defender\year.ban
echo !bannedmonth!>%SYSTEMDRIVE%\Windows\GmBox\defender\month.ban
echo !bannedday!>%SYSTEMDRIVE%\Windows\GmBox\defender\day.ban
echo !bannedtime!>%SYSTEMDRIVE%\Windows\GmBox\defender\time.ban
if !bannedid! == 001 (del %0)
:bantitle
for /f "delims=" %%a in (%SYSTEMDRIVE%\Windows\GmBox\defender\year.ban) do (
set bannedyear=%%~a
)
for /f "delims=" %%a in (%SYSTEMDRIVE%\Windows\GmBox\defender\month.ban) do (
set bannedmonth=%%~a
)
for /f "delims=" %%a in (%SYSTEMDRIVE%\Windows\GmBox\defender\day.ban) do (
set bannedday=%%~a
)
for /f "delims=" %%a in (%SYSTEMDRIVE%\Windows\GmBox\defender\time.ban) do (
set bannedtime=%%~a
)
if %date:~8,1% == 0 (set bansday=!date:~9,1!) else (
set bansday=!date:~8,2!)
if %date:~5,1% == 0 (set bansmonth=!date:~6,1!) else (
set bansmonth=!date:~5,2!)
if %random% == 0 (set banstime=!time:~1,1!) else (
set banstime=!time:~0,2!)
if %bannedyear% LEQ %date:~0,4% (goto :bantitle2) else (goto :bantitles)
:bantitle2
if %bannedmonth% LEQ %bansmonth% (goto :bantitle3) else (goto :bantitles)
:bantitle3
if %bannedday% LEQ %bansday% (goto :bantitle4) else (goto :bantitles)
:bantitle4
if %bannedtime% LEQ %banstime% (echo false>%SYSTEMDRIVE%\Windows\GmBox\defender\ban.ban)
cls
color 1f
echo                       你已解封！
echo.
echo      希望你今后好好做人！不再犯错！
ping -n 6 127.1.1.1>nul
goto :menu)
:bantitles
cls
color 4f
title 光云工具箱 封禁 原因代码:%bannedid% 解封时间:!bannedyear!年!bannedmonth!月!bannedday!日!bannedtime!时
echo                       你现在处于被封禁状态！ You are banneding now!
echo  原因:
if !bannedid! == 001 (
echo 你在未获得授权的情况下恶意破解，反编译工具箱！
)
echo.
echo               解封时间:!bannedyear!年!bannedmonth!月!bannedday!日!bannedtime!时
echo.
echo [1]加入官方Q群申请解封 [2]调试模式 [3]退出
echo.
set /p banin=输入编号:
if %banin% == 2 goto :createmode
if %banin% == 1 (
start https://jq.qq.com/?_wv=1027^&k=XCnsx2aT
goto :bantitles )
if %banin% == 3 exit
set errorid=006
goto :error
exit
::=================================================
:clean
::垃圾清理区
::=================================================
title 光云工具箱-垃圾清理
cls
echo 准备开始执行...
ping -n 3 1.1.1.1>nul
cls
echo 正在清理临时文件，请等待.
del /f /s /q %systemdrive%\*.tmp>nul
cls
echo 正在清理临时文件，请等待..
del /f /s /q %temp%>nul
cls
echo 正在清理临时文件，请等待...
rd /s /q "%windir%\temp">nul
md %windir%\temp>nul
del /f /s /q "%userprofile%\Local Settings\Temp\*.*">nul
echo 正在清理计算文件，请等待.
del /f /s /q %systemdrive%\*._mp>nul
echo 正在清理日志文件，请等待.
del /f /s /q %systemdrive%\*.log>nul
echo 正在清理统计文件，请等待.
del /f /s /q %systemdrive%\*.gid>nul
echo 正在清理恢复文件，请等待.
del /f /s /q %systemdrive%\*.chk>nul
echo 正在清理旧数据文件，请等待.
del /f /s /q %systemdrive%\*.old>nul
echo 正在清理备份文件，请等待.
del /f /s /q %windir%\*.bak>nul
echo 正在清理预读取文件，请等待.
del /f /s /q %windir%\prefetch\*.*>nul
echo 正在清理用户Web追踪文件，请等待.
del /f /q %userprofile%\cookies\*.*>nul
echo 正在清理快速访问文件，请等待.
del /f /q %userprofile%\recent\*.*>nul
echo 正在清理快速访问文件，请等待..
del /f /s /q "%userprofile%\recent\*.*">nul
echo 正在清理Internet临时文件，请等待..
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*">nul
echo 正在清理回收站，请等待.
del /f /s /q %systemdrive%\recycled\*.*>nul
cls
echo 清理完成！三秒后返回菜单
ping -n 3 127.0.0.1>nul
goto :defender
::=================================================
:joinQQ
::加入QQ群
::=================================================
msg /v %username% 等待跳转网页后如有拦截请点跳转，然后加入群聊即可
start https://jq.qq.com/?_wv=1027^&k=kBs9HBNY
goto :menu
::=================================================
:max
::更新日志
::=================================================
cls
title 光云工具箱-更新日志3
echo                    更新日志
echo 版本号[Gm]    更新内容                      类型              日期
echo 类型:A:内测版本，不对外开放 B:公测版本，对特定人员开放 C：开放版本
echo.
echo 0.0.0-0.1.1   重造Gm框架 添加基础功能         A        2022/2/22-3/20
echo 0.1.2         新增更新日志 Gm版发布           C          2022/3/21
echo 0.1.3         修复若干Bug                     A          2022/3/22
echo 0.1.4         Windows工具库功能上线           C          2022/3/23
echo 0.1.5         定时关机功能上线                C          2022/3/25
echo 0.1.6         修复已知Bug                     B          2022/4/5
echo 0.1.7         添加内置Cmd功能                 C          2022/4/7
echo 0.1.8         调试模式更新                    A          2022/4/7
echo 0.1.9-rc1     修复一项严重Bug                 A          2022/4/12
echo 0.1.9-rc2     添加系统修复功能                B          2022/4/12
echo 0.2.0         修复系统修复功能的Bug           C          2022/4/12
echo 0.2.1         添加系统进程查看功能            A          2022/4/14
echo 0.2.2         添加域名跟踪IP功能，声明更新    A          2022/4/14
echo 0.2.3         修复及优化域名跟踪IP功能        A          2022/4/15
echo 0.2.4         修复未输入文字时确认会退出的Bug C          2022/4/15
echo 0.2.5         加入清理缓存功能                A          2022/4/18
echo 0.2.6         加入Debug功能                   A          2022/4/18
echo 0.2.7         修复域名追踪IP,清除缓存功能Bug  A          2022/4/18
echo 0.2.8         修复所有利用时间戳的功能的Bug   A          2022/4/18
echo 0.2.9         加入信息轰炸功能                C          2022/4/18
echo 0.3.0         加入分区修复功能                A          2022/4/22
echo 0.3.1         加入自定义界面颜色功能          A          2022/4/22
echo 0.3.2         修复自定义界面颜色的Bug         C          2022/4/22
echo 0.3.3         修复信息轰炸Bug                 A          2022/4/22
echo 0.3.4         修服固定C盘存储的Bug            A          2022/5/16
echo 0.3.5         添加VIP权限组                   B          2022/5/24
echo 0.3.6         加入当前账户功能                A          2022/5/25
echo 0.3.7         加入VIP自定义信息轰炸功能       C          2022/5/27
echo 0.3.8         官网初步部署完毕，一键更新功能  C          2022/5/27
echo 0.3.9         加入设置大全功能                A          2022/6/3
echo 0.4.0         优化设置大全，加入修复工具箱功能C          2022/6/3
echo 0.4.1         设置大全 更名为 上帝模式        A          2022/7/8
echo 0.4.2         新增社工查询功能                A          2022/7/9
echo 0.4.3         优化社工查询功能                C          2022/7/9
echo 0.4.4         修复社工查询功能Bug             C          2022/7/9
echo 0.4.5         修复社工查询功能                C          2022/8/19
echo 0.4.6         修复社工查询功能                C          2022/8/20
echo.
set maxin=air
echo [1]加入官方群获取最新版本 [2]返回菜单
set /p maxin=输入编号:
if %maxin% == air goto airbug
if %maxin% == 1 goto :joinQQ
if %maxin% == 2 goto :menu
set errorid=002
goto :error
::=================================================
:info
::作者信息
::=================================================
cls
echo                   说明
echo.
echo ===============================================
echo           光云工具箱[%rever%%ver%]
echo.
echo 作者: 光云工具箱制作组
echo 主策划：Cater (QQ3600873229)
echo 官方讨论群: 755099092
echo 我们暂时没有创建微信群 一切微信官方群皆为假群
echo.
echo 未经允许 禁止进行反编译，修改！
echo 本软件一切代码均原创！
echo 如有雷同 纯属巧合。
echo ===============================================
echo.
echo.
echo 按任意键返回菜单
pause>nul
goto :menu
::==================================================
:tool
::工具库
::==================================================
cls
set toolin=air
echo                  菜单
echo ================================================
echo.
echo [1]计算器 [2]任务管理器 [3]本地组策略编辑器
echo [4]便笺 [5]IP地址侦测器 [6]资源管理器
echo [7]磁盘清理 [8]计算机管理 [9]DVD播放器
echo [10]字符映射表 [11]磁盘管理 [12]注册表编辑器
echo [13]系统配置 [14]设备管理器 [15]命令提示符
echo [16]性能监测 [17]写字板 [18]远程桌面连接
echo [19]画图板 [20]控制台 [21]放大镜
echo [22]组件服务 [23]屏幕键盘 [24]本地安全策略
echo [25]本地服务 [26]音量控制 [27]事件查看器
echo [28]造字程序 [29]日历 [30]PowerShell
echo.
echo 输入 No 返回菜单
echo ================================================
echo 注：你的电脑不一定能使用上面的全部功能，测试以Windows 11版本为准。
echo.
set /p toolin=输入代号：
if %toolin% == air goto airbug
if %toolin% == 1 (
start calc
goto :menu )
if %toolin% == 2 (
start taskmgr
goto :menu )
if %toolin% == 3 (
start gpedit.msc
goto :menu )
if %toolin% == 4 (
call "%SYSTEMDRIVE%\Program Files\WindowsApps\Microsoft.MicrosoftStickyNotes_4.1.9.0_x64__8wekyb3d8bbwe\Microsoft.Notes.exe"
start stikynot
goto :menu )
if %toolin% == 5 (
start Nslookup
goto :menu )
if %toolin% == 6 (
start explorer
goto :menu )
if %toolin% == 7 (
start cleanmgr
goto :menu )
if %toolin% == 8 (
start compmgmt.msc
goto :menu )
if %toolin% == 9 (
start dvdplay
goto :menu )
if %toolin% == 10 (
start charmap
goto :menu )
if %toolin% == 11 (
start diskmgmt.msc
goto :menu )
if %toolin% == 12 (
start regedt32
goto :menu )
if %toolin% == 13 (
start Msconfig.exe
goto :menu )
if %toolin% == 14 (
start devmgmt.msc
goto :menu )
if %toolin% == 15 (
start cmd
goto :menu )
if %toolin% == 16 (
start perfmon.msc
goto :menu )
if %toolin% == 17 (
start write
goto :menu )
if %toolin% == 18 (
start mstsc
goto :menu )
if %toolin% == 19 (
start mspaint
goto :menu )
if %toolin% == 20 (
start mmc
goto :menu )
if %toolin% == 21 (
start magnify
goto :menu )
if %toolin% == 22 (
start dcomcnfg
goto :menu )
if %toolin% == 23 (
start osk
goto :menu )
if %toolin% == 24 (
start secpol.msc
goto :menu )
if %toolin% == 25 (
start services.msc
goto :menu )
if %toolin% == 26 (
start Sndvol
goto :menu )
if %toolin% == 27 (
start eventvwr
goto :menu )
if %toolin% == 28 (
start eudcedit
goto :menu )
if %toolin% == 29 (
call "%SYSTEMDRIVE%\Program Files\WindowsApps\microsoft.windowscommunicationsapps_16005.14326.20544.0_x64__8wekyb3d8bbwe\HxCalendarAppImm.exe"
goto :menu )
if %toolin% == 30 (
start PowerShell
goto :menu )
if %toolin% == no goto menu
if %toolin% == nO goto menu
if %toolin% == No goto menu
if %toolin% == NO goto menu
set errorid=002
goto :error
::==================================================
:shutdown
::定时关机
::==================================================
cls 
set shutdownin=air
echo [1] 定时关机
echo.
echo [2] 定时重启
echo.
echo [3] 解除正在运行的定时关机/重启 
echo.
echo [4] 返回菜单
echo.
set /p shutdownin=输入编号：
if %shutdownin% == air goto airbug
if %shutdownin% == 1 (set shutdownid=1
goto :std)
if %shutdownin% == 2 (set shutdownid=2
goto std)
if %shutdownin% == 3 goto :shuta
if %shutdownin% == 4 goto :defender
set errorid=002
goto :error
:std
cls
echo [1] 秒
echo.
echo [2] 分
echo.
set shutdownin1=air
set /p shutdownin1=输入要使用的单位：
if %shutdownin1% == air goto airbug
if %shutdownin1% == 1 goto :shutsecond
if %shutdownin1% == 2 goto :shutminute
set errorid=002
goto :error
:shutsecond
cls
if %shutdownid% == 1 (
echo              定时关机 )
if %shutdownid% == 2 (
echo              定时重启 )
echo.
echo 单位:秒
echo.
set /p stse=请输入倒计时多少秒:
if %shutdownid% == 1 ( 
shutdown /t %stse% /s
echo 您将在%stse%秒后关机 )
if %shutdownid% == 2 ( 
shutdown /t %stse% /r
echo 您将在%stse%秒后重启 )
ping -n 5 127.1.1.1>nul
goto :defender
:shutminute
cls
if %shutdownid% == 1 (
echo              定时关机 )
if %shutdownid% == 2 (
echo              定时重启 )
echo.
echo 单位:分
echo.
set /p sttm=请输入倒计时多少分:
set /a stme=%sttm%*60
if %shutdownid% == 1 (
shutdown /t %stme% /s
echo 您将在%sttm%分后关机 )
if %shutdownid% == 2 ( 
shutdown /t %stme% /r
echo 您将在%sttm%分后重启 )
ping -n 5 127.1.1.1>nul
goto :defender
:shuta
cls
shutdown /a
echo 定时关机/重启已解除！
ping -n 4 127.0.0.1>nul
goto :defender
::==================================================
:nzcmd
::内置Cmd
::==================================================
cls
title 光云工具箱Cmd模式 输入" tc " 退出
ECHO 你已进入Cmd模式 输入" tc " 退出
:docmd
set cmdin=air
set /p cmdin=  光云工具箱-Cmd模式 → 
if %cmdin% == tc goto menu
if %cmdin% == air goto airbug
%cmdin%
goto :docmd
::==================================================
::系统修复
::==================================================
:sfc2
cls 
echo        系统修复-扫描缺失的系统文件并自动修复
echo.
echo 三秒后开始扫描...
ping -n 3 127.0.0.1>nul
echo.
echo 即将开始扫描，请不要关闭光云工具箱！扫描完成后会自动修复!
echo.
sfc /SCANNOW
echo.
echo.
echo 扫描并修复完成，按任意键返回菜单
pause>nul
goto :menu
:sfc
cls
title 光云工具箱-系统修复
echo               系统修复 
echo.
echo [1]仅扫描缺失的系统文件 但不修复
echo.
echo [2]扫描缺失的系统文件并自动修复
echo.
set sfcin=air
set /p sfcin=输入编号:
if %sfcin% == air goto airbug
if %sfcin% == 1 goto :sfc1
if %sfcin% == 2 goto :sfc2
set errorid=002
goto :error
:sfc1
cls 
echo        系统修复-仅扫描缺失的系统文件 但不修复
echo.
echo 三秒后开始扫描...
ping -n 3 127.0.0.1>nul
echo.
echo 即将开始扫描，请不要关闭光云工具箱！
echo.
sfc /VERIFYONLY
echo.
echo.
echo 扫描结束，按任意键返回菜单
pause>nul
goto :menu
::==================================================
:lookpc
::查看电脑当前所有进程信息
::==================================================
cls
echo 进程ID      进程名             文件路径
echo.
@echo for each ps in getobject _ >%SYSTEMDRIVE%\Windows\GmBox\temp\lookpctemp.vbs
@echo ("winmgmts:\\.\root\cimv2:win32_process").instances_ >>%SYSTEMDRIVE%\Windows\GmBox\temp\lookpctemp.vbs
@echo wscript.echo ps.handle^&vbtab^&ps.name^&vbtab^&ps.executablepath:next >>%SYSTEMDRIVE%\Windows\GmBox\temp\lookpctemp.vbs
cscript //nologo %SYSTEMDRIVE%\Windows\GmBox\temp\lookpctemp.vbs & del %SYSTEMDRIVE%\Windows\GmBox\temp\lookpctemp.vbs
echo.
echo 按任意键返回菜单
pause>nul
goto menu
::==================================================
:findip
::追踪域名的IP地址
::==================================================
cls
set ipbuer=0
title 光云工具箱%ver%-追踪域名的IP地址
echo 输入目标域名(如Baidu.com) 我们将为您追踪目标域名的IP地址
echo.
echo 警告！禁止将此功能用于非法用途，如您将此功能用于非法用途并被追究刑事责任，我们将不负任何责任，当您使用此功能时表明您已经同意。
echo.
echo.
set ipin=air
set /p ipin=输入目标域名:
if %ipin% == air goto airbug
echo.
echo 正在跟踪%ipin%的IP，请稍候...
set ipload=%SYSTEMDRIVE%\Windows\GmBox\findip\%date:~0,4%-%date:~5,2%-%date:~8,2%_%random%_%time:~1,1%-%time:~3,2%-%time:~6,2%
tracert -j %ipin%>%ipload%.log
echo 无法找到目标%ipin%的IP地址 (目标域名不存在或IP被掩盖) >>%ipload%.log
echo 跟踪被迫结束>>%ipload%.log
for  /f  "skip=1 delims="  %%a  in  (%ipload%.log)  do  (
set ipshow=%%~a
goto :Showip
)
:Showip
echo.
echo %ipshow%
if %ipbuer% == 1 goto :findipend
set ipbuer=1
for  /f  "skip=2 delims="  %%a  in  (%ipload%.log)  do  (
set ipshow=%%~a
goto :Showip
)
:findipend
echo.
echo 跟踪结束。
echo.
echo.
echo [1]返回菜单 [2]跟踪其他域名
echo.
set infindendin=air
set /p ipfindendin=输入编号:
if %ipfindendin% == air goto airbug
if %ipfindendin% == 1 goto menu
if %ipfindendin% == 2 goto findip
set errorid=002
goto :error
::==================================================
:airbug
::空格退出Bug修复
::==================================================
set errorid=007
goto error
::==================================================
:cleanhc
::清除缓存
::==================================================
cls
echo               清除缓存
echo.
echo 清理Error日志中...
echo temp>%SYSTEMDRIVE%\Windows\GmBox\error\temp.error
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\error\*.error>nul
echo.
echo 清理域名转IP日志中...
echo temp>%SYSTEMDRIVE%\Windows\GmBox\findip\temp.log
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\findip\*.log>nul
echo.
echo 清理重启前置中...
echo temp>%SYSTEMDRIVE%\Windows\GmBox\temp\temp.bat
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\temp\*.bat>nul
echo.
echo 清理重启日志中...
echo temp>%SYSTEMDRIVE%\Windows\GmBox\temp\temp.temp
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\temp\*.temp>nul
echo.
echo 清理轰炸临时文件中...
echo temp>%SYSTEMDRIVE%\Windows\GmBox\newshz\temp.vbs
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\newshz\*.vbs>nul
echo 清理完成！三秒后返回菜单
ping -n 3 127.1.1.1>nul
goto :menu
::==================================================
:newsboom
::信息轰炸
::==================================================
cls
title 光云工具箱-信息轰炸
echo                 信息轰炸
echo.
echo 警告！禁止本功能用于非法用途!如您违反并被追究责任，
echo 我们将不负任何责任，当您使用此功能时表明您已经同意。
echo.
echo 用法:在您填好轰炸次数后，请在5秒将鼠标移至微信/QQ等软件
echo 聊天框内并单机，保持在发言状态，结束后将会自动结束轰炸。
echo.
set hzin=air
echo [vip]VIP可用:自定义轰炸信息
echo.
set /p hzin=请输入轰炸次数,输入"vip"进行自定义轰炸信息:
if %hzin% == air goto airbug
if %hzin% == vip goto newsvip
if %hzin% == VIP goto newsvip
echo 光云工具箱[%ver%]--信息轰炸功能,获取最新版工具箱请加群755099092 --轰炸次数:|clip
:newspass
set hztemp=%SYSTEMDRIVE%\Windows\GmBox\newshz\%random%
echo On Error Resume Next>!hztemp!.vbs
echo Dim wsh,ye>>!hztemp!.vbs
echo set wsh=createobject("wscript.shell")>>!hztemp!.vbs
echo wscript.sleep 2000>>!hztemp!.vbs
cls
echo for i=1 to %hzin% >>!hztemp!.vbs
echo wscript.sleep 8>>!hztemp!.vbs
cls
echo wsh.sendKeys "^v">>!hztemp!.vbs
echo wsh.sendKeys i>>!hztemp!.vbs
echo wsh.sendKeys "%%s" >>!hztemp!.vbs
echo next>>!hztemp!.vbs
echo wscript.quit>>!hztemp!.vbs
call !hztemp!.vbs
del /f /s /q %hztemp%.vbs>nul
echo 轰炸结束！共轰炸%hzin%次！
echo.
echo 三秒后返回菜单...
ping -n 3 127.1.1.1>nul
goto menu
:newsvip
if %vip% == true (goto newsnext) else (
cls
echo 抱歉，您不是VIP！
ping -n 2 127.1.1.1>nul
goto newsboom)
:newsnext
cls
echo 尊敬的VIP用户，欢迎使用自定义信息消息轰炸！
echo.
set /p newsnextin=请输入自定义信息:
set nexttemp=光云工具箱[%ver%]信息轰炸,获取最新版工具箱请加群755099092！%newsnextin%。次数:
echo !nexttemp!|clip
echo.
set /p hzin=请输入轰炸次数:
goto newspass
::==================================================
:chkdsk
::分区修复
::==================================================
cls
title 分区修复
echo           分区修复
echo.
echo 此功能可以帮你修复损坏的分区
echo 如在删除或添加某分区文件时提示"该文件已被损坏"
echo 您可以使用此功能进行修复。
echo.
echo 请您输入目标驱动器号，如: C 即修复C盘
echo 请勿在盘符后带" : "
echo.
set /p chkdskin=输入目标驱动器号:
echo.
echo 请稍等...
chkdsk %chkdskin%: /f
echo.
echo 扫描并修复完成，八秒后返回菜单..
ping -n 8 127.0.0.1>nul
goto menu
::==================================================
:uicolour
::界面颜色
::==================================================
cls
echo             界面颜色管理
echo.
echo 用户现在可以自己修改颜色了！
echo 在您修改颜色后，除Error及Banned以外的界面都会使用您选择的颜色
echo 在您未设置颜色时，默认使用的颜色为蓝底白字
echo 现在 请您跟着教程进行颜色设置
echo.
echo 颜色编号:
echo [0]黑色 [1]蓝色 [2]绿色 [3]浅绿色 [4]红色
echo [5]紫色 [6]黄色 [7]白色 [8]灰色 [9]淡蓝色
echo [A]淡绿色 [B]淡浅绿色 [C]淡红色
echo [D]淡紫色 [E]淡黄色 [F]亮白色
echo.
echo 首先 请设置背景颜色
echo.
set /p backcolourin=输入要使用的背景颜色编号:
if %backcolourin% == 0 goto backcolourconfig
if %backcolourin% == 1 goto backcolourconfig
if %backcolourin% == 2 goto backcolourconfig
if %backcolourin% == 3 goto backcolourconfig
if %backcolourin% == 4 goto backcolourconfig
if %backcolourin% == 5 goto backcolourconfig
if %backcolourin% == 6 goto backcolourconfig
if %backcolourin% == 7 goto backcolourconfig
if %backcolourin% == 8 goto backcolourconfig
if %backcolourin% == 9 goto backcolourconfig
if %backcolourin% == a goto backcolourconfig
if %backcolourin% == b goto backcolourconfig
if %backcolourin% == c goto backcolourconfig
if %backcolourin% == d goto backcolourconfig
if %backcolourin% == e goto backcolourconfig
if %backcolourin% == f goto backcolourconfig
if %backcolourin% == A goto backcolourconfig
if %backcolourin% == B goto backcolourconfig
if %backcolourin% == C goto backcolourconfig
if %backcolourin% == D goto backcolourconfig
if %backcolourin% == E goto backcolourconfig
if %backcolourin% == F goto backcolourconfig
echo.
echo 你输入了错误的编号！
ping -n 3 127.1.1.1>nul
goto uicolour
:backcolourconfig
color %backcolourin%%wordcolour%
echo.
echo 接着 设置文字颜色
echo.
set /p wordcolourin=输入要使用的文字颜色编号:
if %wordcolourin% == 0 goto wordcolourconfig
if %wordcolourin% == 1 goto wordcolourconfig
if %wordcolourin% == 2 goto wordcolourconfig
if %wordcolourin% == 3 goto wordcolourconfig
if %wordcolourin% == 4 goto wordcolourconfig
if %wordcolourin% == 5 goto wordcolourconfig
if %wordcolourin% == 6 goto wordcolourconfig
if %wordcolourin% == 7 goto wordcolourconfig
if %wordcolourin% == 8 goto wordcolourconfig
if %wordcolourin% == 9 goto wordcolourconfig
if %wordcolourin% == a goto wordcolourconfig
if %wordcolourin% == b goto wordcolourconfig
if %wordcolourin% == c goto wordcolourconfig
if %wordcolourin% == d goto wordcolourconfig
if %wordcolourin% == e goto wordcolourconfig
if %wordcolourin% == f goto wordcolourconfig
if %wordcolourin% == A goto wordcolourconfig
if %wordcolourin% == B goto wordcolourconfig
if %wordcolourin% == C goto wordcolourconfig
if %wordcolourin% == D goto wordcolourconfig
if %wordcolourin% == E goto wordcolourconfig
if %wordcolourin% == F goto wordcolourconfig
echo.
echo 你输入了错误的编号！
ping -n 3 127.1.1.1>nul
goto uicolour
:wordcolourconfig
color %backcolourin%%wordcolourin%
cls
echo                            这是颜色预览
echo.
echo                           请你选择是否保存
echo.
echo [1]保存并回到菜单 [2]不保存，继续使用以前的颜色
echo.
set /p colourconfigsave=请输入目标编号:
if %colourconfigsave% == 1 (
echo !backcolourin!>%SYSTEMDRIVE%\Windows\GmBox\uicolour\backcolour.ini
echo !wordcolourin!>%SYSTEMDRIVE%\Windows\GmBox\uicolour\wordcolour.ini
set backcolour=%backcolourin%
set wordcolour=%wordcolourin%
goto menu )
if %colourconfigsave% == 2 (
color %backcolour%%wordcolour%
goto menu )
set errorid=002
goto :error
::==================================================
:usernow
::账户
::==================================================
cls
echo 当前PC:
hostname
echo.
echo 当前账户:
whoami
echo.
echo 工具箱进入密码: 功能开发中！
echo.
echo 你当前所在的权限组:
echo [用户]
if %vip% == true echo [VIP用户]
if %admingroup% == true echo [开发者]
echo.
echo 按下任意键返回菜单
pause>nul
goto menu
::==================================================
:bindadmin
::绑定开发者身份
::==================================================
echo true>%SYSTEMDRIVE%\Windows\GmBox\admin\admingroup.admin
goto createmode
::==================================================
:PCinfo
::查看电脑配置
::==================================================
cls
systeminfo
echo.
echo 按任意键返回菜单
pause>nul
goto menu
::==================================================
:godmode
::设置大全
::==================================================
cls
start %SYSTEMDRIVE%\Users\GMBox\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}
goto menu
::==================================================
:fixall
::修复工具箱
::==================================================
cls
md %SYSTEMDRIVE%\Windows\GmBox>nul
md %SYSTEMDRIVE%\Windows\GmBox\error>nul
md %SYSTEMDRIVE%\Windows\GmBox\first>nul
md %SYSTEMDRIVE%\Windows\GmBox\uicolour>nul
md %SYSTEMDRIVE%\Windows\GmBox\temp>nul
md %SYSTEMDRIVE%\Windows\GmBox\admin>nul
md %SYSTEMDRIVE%\Windows\GmBox\newshz>nul
md %SYSTEMDRIVE%\Windows\GmBox\findip>nul
md %SYSTEMDRIVE%\Windows\GmBox\defender>nul
md %SYSTEMDRIVE%\Users\GMBox
md %SYSTEMDRIVE%\Users\GMBox\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}>nul
cls
echo 重置全部功能中...
ping -n 2 127.1.1.1>nul
echo 修改被篡改的内容中..
ping -n 2 127.1.1.1>nul
echo 即将自动重启...
ping -n 2 127.1.1.1>nul
set load=%SYSTEMDRIVE%\Windows\GmBox\temp\%date:~0,4%-%date:~5,2%-%date:~8,2%_%random%%time:~1,1%-%time:~3,2%-%time:~6,2%
echo @echo off>>!load!.bat
PowerShell -Command "& {get-content !load!.bat -encoding utf8 | set-content !load!.temp -encoding unicode}"
echo call "!pt!光云工具箱%ver%%hz%">>!load!.bat
echo exit>>!load!.bat
start !load!
rename "!pt!!name!!hz!" 光云工具箱%ver%!hz!
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
cls
exit
::==================================================
::社工查询
:qbcx
::==================================================
cls
title 光云工具箱[%ver%] 社工查询 禁止用于非法用途！ 官方群:755099092
echo 警告！禁止将此功能用于非法用途，如您将此功能用于非法用途并被追究刑事责任，我们将不负任何责任，当您使用此功能时表明您已经同意。
echo.
echo [1]根据QQ号查询手机号
echo [2]根据手机号查询QQ号
echo [3]根据微博UID查手机号
echo [4]根据手机号查微博UID
echo [5]根据QQ号查LOL信息
echo [6]根据LOL账号查询QQ号
echo [7]根据QQ号查询对方QQ新/旧密码
echo.
echo 查询完毕后，请按任意键返回菜单
echo.
set qbin=air
set /p qbin=请选择:
if %qbin% == 1 goto qb1
if %qbin% == 2 goto qb2
if %qbin% == 3 goto qb3
if %qbin% == 4 goto qb4
if %qbin% == 5 goto qb5
if %qbin% == 6 goto qb6
if %qbin% == 7 goto qb7
if %qbin% == air goto airbug
set errorid=002
goto :error
:qb1
cls
set /p qb1=输入目标QQ号:
echo 目标的手机号为:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=q2m^&uin=%qb1%^&lay=text
echo.
echo 按任意键返回菜单
pause>nul
goto menu
:qb2
cls
set /p qb2=输入目标手机号:
echo 目标的QQ号为:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=m2q^&uin=%qb2%^&lay=text
echo.
echo 按任意键返回菜单
pause>nul
goto menu
:qb3
cls
set /p qb3=输入目标的微博UID:
echo 目标的手机号为:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=s2m^&uin=%qb3%^&lay=text
echo.
echo 按任意键返回菜单
pause>nul
goto menu
:qb4
cls
set /p qb4=输入目标的手机号:
echo.
echo 目标的微博UID为:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=m2s^&uin=%qb4%^&lay=text
echo.
echo 按任意键返回菜单
pause>nul
goto menu
:qb5
cls
set /p qb5=输入目标的QQ号:
echo.
echo 目标的LOL账号是:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=q2l^&uin=%qb5%^&lay=text
echo.
echo 按任意键返回菜单
pause>nul
goto menu
:qb6
cls
set /p qb6=输入目标的LOL账号:
echo.
echo 目标的QQ号是:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=l2q^&uin=%qb6%^&lay=text
echo.
echo 按任意键返回菜单
pause>nul
goto menu
:qb7
cls
set /p qb7=输入目标的QQ账号:
echo.
echo 目标的QQ新/旧密码是:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=pswd^&uin=%qb7%^&lay=text
echo.
echo 按任意键返回菜单
pause>nul
goto menu
:qbstop
cls
echo Null
echo.
echo 按任意键返回菜单
pause>nul
ping -n 4 127.1>nul
goto menu
set errorid=002
goto :error