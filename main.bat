@echo off
::�ܴ���
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
::���ұ���
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
if %name% == ���ƹ�����%ver% (
    if not exist %SYSTEMDRIVE%\Windows\GmBox\first\%ver%.start (
          goto :first ) else (
                        goto :menu )
						)else (
						      set errorid=001
						      goto :error)
::==============================================
:error
::����
::==============================================
cls						   
color 4f
title ���ƹ�����-ErrorID:!errorid!
echo                            ����
echo �����������Ĵ���
echo �������:!errorid!
set ing=%date:~0,4%-%date:~5,2%-%date:~8,2%_%random%%time:~1,1%-%time:~3,2%-%time:~6,2%--!errorid!.error
echo false>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
echo �����Ǹô���Ľ��ܣ�
echo.
if !errorid! == 001 (
echo ��ܼ�⵽��ʹ�õĹ��ƹ����������ݱ�����۸ģ�
echo �ѽ����޸�
echo ��ȴ�1-15��
ping -n 7 1.1.1.1>nul
goto :reload
:load
start !load!
rename "!pt!!name!!hz!" ���ƹ�����%ver%!hz!
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
cls
exit )
if !errorid! == 002 (
echo �������ָ������޷�ִ�У�
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 3 1.1.1.1>nul
cls 
goto :defender)
if !errorid! == 003 (
echo �������
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 2 127.0.0.1>nul
goto :defender )
if !errorid! == 004 (
echo δ֪�ĵ���ָ�
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 2 127.0.0.1>nul
goto :create )
if !errorid! == 005 (
echo δ֪�Ĵ�����ȴ�Ƭ�̷�����ҳ�棡
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 4 1.1.1.1>nul
goto :defender)
if !errorid! == 006 (
echo �������˾Ͳ�Ҫ��Ϲ�����˰£�
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 5 1.1.1.1>nul
goto :defender)
if !errorid! == 007 (
echo ��ֹ��δ�������ֵ�����°�Enter����
echo.
echo ���˳���Bug��0.2.4�汾�ѱ��޸���
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
ping -n 4 1.1.1.1>nul
goto :defender)

::===============================================
:first
::�汾��һ�ν�����ת��
::===============================================
title ���ƹ�����%ver%
cls
color %backcolour%%wordcolour%
echo        ��⵽���ǵ�һ��ʹ�ô˰汾 Ϊ����ת����ҳ��
echo.
echo                     ���ƹ����� [%ver%]
echo           ��ʹ��֮ǰ��������ض��걾ҳ������֣�
echo.
echo ���ƹ�������һ�����ϸ���С������ɵĹ����䣬������Ϊ���ṩ���ֱ�ݵķ���
echo ���ڴ�����:
echo ��ֹ������δ��Ȩ������� ����۸ģ��ƽ⣬����������
echo Υ�߰����л����񹲺͹�����Ȩ������������׷����
echo ���棡��ֹ�����������ṩ�Ĺ������ڷǷ���;!
echo ����Υ������׷�����Σ����ǽ������κ����Σ�����ʹ�ô����ʱ�������Ѿ�ͬ�⡣
echo ���������ս���Ȩ�� ���������� ���У�
echo �����䴦�ڲ��Խ׶Σ��緢��Bug�뷢���ʼ���luckycatgod@qq.com���Ⱥ��������
echo ���п��ܳ�Ϊ���ǵĲ���Ա��
echo.
echo  [T] ͬ��                 [F] �ܾ�
echo.
set /p first=�����룺
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
::������
::===============================================
set load=%SYSTEMDRIVE%\Windows\GmBox\temp\%date:~0,4%-%date:~5,2%-%date:~8,2%_%random%%time:~1,1%-%time:~3,2%-%time:~6,2%
echo @echo off>>!load!.bat
PowerShell -Command "& {get-content !load!.bat -encoding utf8 | set-content !load!.temp -encoding unicode}"
echo call "!pt!���ƹ�����%ver%%hz%">>!load!.bat
echo exit>>!load!.bat
if !errorid! == 001 goto :load
::===============================================
:menu
::�˵���
::===============================================
cls
set menuin=air
title ���ƹ�����%ver%-�˵�
color %backcolour%%wordcolour%
if %vip% == true echo �𾴵�VIP�û�����ӭʹ�ù��ƹ�����[%ver%]
echo =============================================================
echo                            �˵�
echo [1]���� [2]�������� [3]Windows��ݹ��߿� [4]��ʱ�ػ�
echo [5]ϵͳ�޸� [6]�鿴���Ե�ǰ���н�����Ϣ [7]׷��������IP��ַ
echo [8]��Ϣ��ը [9]�����޸� [10]�鿴�������� [11]�ϵ�ģʽ
echo [12]�繤��ѯ
echo =============================================================
echo.
set /p menuin=������Ҫִ�еı��:
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
::������
::================================================
cls
set setin=air
title ���ƹ�����%ver%-����
echo                  ���� [����No���ز˵�]
echo [1]������ɫ
echo [2]����ٷ�QȺ
echo [3]����Cmd
echo [4]�������
echo [5]��ǰ�˻�
echo [6]���ʹ���
echo [7]�޸�������
echo.
echo [G]�����������°���ƹ�����
echo.
echo [A]���¼�¼ [B]������Ϣ [C]����ģʽ
echo.
echo �����䴦�ڲ��Խ׶Σ��緢��Bug�뷢���ʼ���luckycatgod@qq.com���Ⱥ����
echo.
set /p setin=������Ҫִ�еı��:
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
::����ģʽ
::=================================================
cls
if %admingroup% == true goto create
title ���ƹ�����%ver%-����ģʽ��¼
color %backcolour%%wordcolour%
set /p password=����������:
if !password! == 081103 ( 
cls
echo ��ӭ����
ping -n 1 127.0.0.1>nul
goto :create
) else (
set errorid=003
goto :error
)
:create
cls
color 06
title ���ƹ�����%ver%-����ģʽ
echo                       ����ģʽ
if !godefender! == true (set set1=����) else (set set1=�ر�)
if !debug! == true (set set2=����) else (set set2=�ر�)
echo ����Defender���:!set1!
echo Debugģʽ: !set2!
echo.
echo                        ����
echo [1]����/�ر�����Defender��� [2]�汾��Ϣ
echo [3]���ز˵� [4]һ�����
echo [5]Debugģʽ ��/�� [6]�󶨿��������
echo.
set /p createin=������:
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
title ��� ������
echo ��ǰ��ʵ�汾:!rever!!ver!
echo.
echo ����:Cater
echo.
echo ����QQ:3600873229
echo.
echo �����������
pause>nul
goto :create
:unban
cls
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\defender\time.ban
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\defender\year.ban
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\defender\day.ban
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\defender\month.ban
echo false>%SYSTEMDRIVE%\Windows\GmBox\defender\ban.ban
echo ���ɹ���
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
echo                       ���ѽ�⣡
echo.
echo      ϣ������ú����ˣ����ٷ���
ping -n 6 127.1.1.1>nul
goto :menu)
:bantitles
cls
color 4f
title ���ƹ����� ��� ԭ�����:%bannedid% ���ʱ��:!bannedyear!��!bannedmonth!��!bannedday!��!bannedtime!ʱ
echo                       �����ڴ��ڱ����״̬�� You are banneding now!
echo  ԭ��:
if !bannedid! == 001 (
echo ����δ�����Ȩ������¶����ƽ⣬�����빤���䣡
)
echo.
echo               ���ʱ��:!bannedyear!��!bannedmonth!��!bannedday!��!bannedtime!ʱ
echo.
echo [1]����ٷ�QȺ������ [2]����ģʽ [3]�˳�
echo.
set /p banin=������:
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
::����������
::=================================================
title ���ƹ�����-��������
cls
echo ׼����ʼִ��...
ping -n 3 1.1.1.1>nul
cls
echo ����������ʱ�ļ�����ȴ�.
del /f /s /q %systemdrive%\*.tmp>nul
cls
echo ����������ʱ�ļ�����ȴ�..
del /f /s /q %temp%>nul
cls
echo ����������ʱ�ļ�����ȴ�...
rd /s /q "%windir%\temp">nul
md %windir%\temp>nul
del /f /s /q "%userprofile%\Local Settings\Temp\*.*">nul
echo ������������ļ�����ȴ�.
del /f /s /q %systemdrive%\*._mp>nul
echo ����������־�ļ�����ȴ�.
del /f /s /q %systemdrive%\*.log>nul
echo ��������ͳ���ļ�����ȴ�.
del /f /s /q %systemdrive%\*.gid>nul
echo ��������ָ��ļ�����ȴ�.
del /f /s /q %systemdrive%\*.chk>nul
echo ��������������ļ�����ȴ�.
del /f /s /q %systemdrive%\*.old>nul
echo �����������ļ�����ȴ�.
del /f /s /q %windir%\*.bak>nul
echo ��������Ԥ��ȡ�ļ�����ȴ�.
del /f /s /q %windir%\prefetch\*.*>nul
echo ���������û�Web׷���ļ�����ȴ�.
del /f /q %userprofile%\cookies\*.*>nul
echo ����������ٷ����ļ�����ȴ�.
del /f /q %userprofile%\recent\*.*>nul
echo ����������ٷ����ļ�����ȴ�..
del /f /s /q "%userprofile%\recent\*.*">nul
echo ��������Internet��ʱ�ļ�����ȴ�..
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*">nul
echo �����������վ����ȴ�.
del /f /s /q %systemdrive%\recycled\*.*>nul
cls
echo ������ɣ�����󷵻ز˵�
ping -n 3 127.0.0.1>nul
goto :defender
::=================================================
:joinQQ
::����QQȺ
::=================================================
msg /v %username% �ȴ���ת��ҳ���������������ת��Ȼ�����Ⱥ�ļ���
start https://jq.qq.com/?_wv=1027^&k=kBs9HBNY
goto :menu
::=================================================
:max
::������־
::=================================================
cls
title ���ƹ�����-������־3
echo                    ������־
echo �汾��[Gm]    ��������                      ����              ����
echo ����:A:�ڲ�汾�������⿪�� B:����汾�����ض���Ա���� C�����Ű汾
echo.
echo 0.0.0-0.1.1   ����Gm��� ��ӻ�������         A        2022/2/22-3/20
echo 0.1.2         ����������־ Gm�淢��           C          2022/3/21
echo 0.1.3         �޸�����Bug                     A          2022/3/22
echo 0.1.4         Windows���߿⹦������           C          2022/3/23
echo 0.1.5         ��ʱ�ػ���������                C          2022/3/25
echo 0.1.6         �޸���֪Bug                     B          2022/4/5
echo 0.1.7         �������Cmd����                 C          2022/4/7
echo 0.1.8         ����ģʽ����                    A          2022/4/7
echo 0.1.9-rc1     �޸�һ������Bug                 A          2022/4/12
echo 0.1.9-rc2     ���ϵͳ�޸�����                B          2022/4/12
echo 0.2.0         �޸�ϵͳ�޸����ܵ�Bug           C          2022/4/12
echo 0.2.1         ���ϵͳ���̲鿴����            A          2022/4/14
echo 0.2.2         �����������IP���ܣ���������    A          2022/4/14
echo 0.2.3         �޸����Ż���������IP����        A          2022/4/15
echo 0.2.4         �޸�δ��������ʱȷ�ϻ��˳���Bug C          2022/4/15
echo 0.2.5         ���������湦��                A          2022/4/18
echo 0.2.6         ����Debug����                   A          2022/4/18
echo 0.2.7         �޸�����׷��IP,������湦��Bug  A          2022/4/18
echo 0.2.8         �޸���������ʱ����Ĺ��ܵ�Bug   A          2022/4/18
echo 0.2.9         ������Ϣ��ը����                C          2022/4/18
echo 0.3.0         ��������޸�����                A          2022/4/22
echo 0.3.1         �����Զ��������ɫ����          A          2022/4/22
echo 0.3.2         �޸��Զ��������ɫ��Bug         C          2022/4/22
echo 0.3.3         �޸���Ϣ��ըBug                 A          2022/4/22
echo 0.3.4         �޷��̶�C�̴洢��Bug            A          2022/5/16
echo 0.3.5         ���VIPȨ����                   B          2022/5/24
echo 0.3.6         ���뵱ǰ�˻�����                A          2022/5/25
echo 0.3.7         ����VIP�Զ�����Ϣ��ը����       C          2022/5/27
echo 0.3.8         ��������������ϣ�һ�����¹���  C          2022/5/27
echo 0.3.9         �������ô�ȫ����                A          2022/6/3
echo 0.4.0         �Ż����ô�ȫ�������޸������书��C          2022/6/3
echo 0.4.1         ���ô�ȫ ����Ϊ �ϵ�ģʽ        A          2022/7/8
echo 0.4.2         �����繤��ѯ����                A          2022/7/9
echo 0.4.3         �Ż��繤��ѯ����                C          2022/7/9
echo 0.4.4         �޸��繤��ѯ����Bug             C          2022/7/9
echo 0.4.5         �޸��繤��ѯ����                C          2022/8/19
echo 0.4.6         �޸��繤��ѯ����                C          2022/8/20
echo.
set maxin=air
echo [1]����ٷ�Ⱥ��ȡ���°汾 [2]���ز˵�
set /p maxin=������:
if %maxin% == air goto airbug
if %maxin% == 1 goto :joinQQ
if %maxin% == 2 goto :menu
set errorid=002
goto :error
::=================================================
:info
::������Ϣ
::=================================================
cls
echo                   ˵��
echo.
echo ===============================================
echo           ���ƹ�����[%rever%%ver%]
echo.
echo ����: ���ƹ�����������
echo ���߻���Cater (QQ3600873229)
echo �ٷ�����Ⱥ: 755099092
echo ������ʱû�д���΢��Ⱥ һ��΢�Źٷ�Ⱥ��Ϊ��Ⱥ
echo.
echo δ������ ��ֹ���з����룬�޸ģ�
echo �����һ�д����ԭ����
echo ������ͬ �����ɺϡ�
echo ===============================================
echo.
echo.
echo ����������ز˵�
pause>nul
goto :menu
::==================================================
:tool
::���߿�
::==================================================
cls
set toolin=air
echo                  �˵�
echo ================================================
echo.
echo [1]������ [2]��������� [3]��������Ա༭��
echo [4]��� [5]IP��ַ����� [6]��Դ������
echo [7]�������� [8]��������� [9]DVD������
echo [10]�ַ�ӳ��� [11]���̹��� [12]ע���༭��
echo [13]ϵͳ���� [14]�豸������ [15]������ʾ��
echo [16]���ܼ�� [17]д�ְ� [18]Զ����������
echo [19]��ͼ�� [20]����̨ [21]�Ŵ�
echo [22]������� [23]��Ļ���� [24]���ذ�ȫ����
echo [25]���ط��� [26]�������� [27]�¼��鿴��
echo [28]���ֳ��� [29]���� [30]PowerShell
echo.
echo ���� No ���ز˵�
echo ================================================
echo ע����ĵ��Բ�һ����ʹ�������ȫ�����ܣ�������Windows 11�汾Ϊ׼��
echo.
set /p toolin=������ţ�
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
::��ʱ�ػ�
::==================================================
cls 
set shutdownin=air
echo [1] ��ʱ�ػ�
echo.
echo [2] ��ʱ����
echo.
echo [3] ����������еĶ�ʱ�ػ�/���� 
echo.
echo [4] ���ز˵�
echo.
set /p shutdownin=�����ţ�
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
echo [1] ��
echo.
echo [2] ��
echo.
set shutdownin1=air
set /p shutdownin1=����Ҫʹ�õĵ�λ��
if %shutdownin1% == air goto airbug
if %shutdownin1% == 1 goto :shutsecond
if %shutdownin1% == 2 goto :shutminute
set errorid=002
goto :error
:shutsecond
cls
if %shutdownid% == 1 (
echo              ��ʱ�ػ� )
if %shutdownid% == 2 (
echo              ��ʱ���� )
echo.
echo ��λ:��
echo.
set /p stse=�����뵹��ʱ������:
if %shutdownid% == 1 ( 
shutdown /t %stse% /s
echo ������%stse%���ػ� )
if %shutdownid% == 2 ( 
shutdown /t %stse% /r
echo ������%stse%������� )
ping -n 5 127.1.1.1>nul
goto :defender
:shutminute
cls
if %shutdownid% == 1 (
echo              ��ʱ�ػ� )
if %shutdownid% == 2 (
echo              ��ʱ���� )
echo.
echo ��λ:��
echo.
set /p sttm=�����뵹��ʱ���ٷ�:
set /a stme=%sttm%*60
if %shutdownid% == 1 (
shutdown /t %stme% /s
echo ������%sttm%�ֺ�ػ� )
if %shutdownid% == 2 ( 
shutdown /t %stme% /r
echo ������%sttm%�ֺ����� )
ping -n 5 127.1.1.1>nul
goto :defender
:shuta
cls
shutdown /a
echo ��ʱ�ػ�/�����ѽ����
ping -n 4 127.0.0.1>nul
goto :defender
::==================================================
:nzcmd
::����Cmd
::==================================================
cls
title ���ƹ�����Cmdģʽ ����" tc " �˳�
ECHO ���ѽ���Cmdģʽ ����" tc " �˳�
:docmd
set cmdin=air
set /p cmdin=  ���ƹ�����-Cmdģʽ �� 
if %cmdin% == tc goto menu
if %cmdin% == air goto airbug
%cmdin%
goto :docmd
::==================================================
::ϵͳ�޸�
::==================================================
:sfc2
cls 
echo        ϵͳ�޸�-ɨ��ȱʧ��ϵͳ�ļ����Զ��޸�
echo.
echo �����ʼɨ��...
ping -n 3 127.0.0.1>nul
echo.
echo ������ʼɨ�裬�벻Ҫ�رչ��ƹ����䣡ɨ����ɺ���Զ��޸�!
echo.
sfc /SCANNOW
echo.
echo.
echo ɨ�貢�޸���ɣ�����������ز˵�
pause>nul
goto :menu
:sfc
cls
title ���ƹ�����-ϵͳ�޸�
echo               ϵͳ�޸� 
echo.
echo [1]��ɨ��ȱʧ��ϵͳ�ļ� �����޸�
echo.
echo [2]ɨ��ȱʧ��ϵͳ�ļ����Զ��޸�
echo.
set sfcin=air
set /p sfcin=������:
if %sfcin% == air goto airbug
if %sfcin% == 1 goto :sfc1
if %sfcin% == 2 goto :sfc2
set errorid=002
goto :error
:sfc1
cls 
echo        ϵͳ�޸�-��ɨ��ȱʧ��ϵͳ�ļ� �����޸�
echo.
echo �����ʼɨ��...
ping -n 3 127.0.0.1>nul
echo.
echo ������ʼɨ�裬�벻Ҫ�رչ��ƹ����䣡
echo.
sfc /VERIFYONLY
echo.
echo.
echo ɨ�����������������ز˵�
pause>nul
goto :menu
::==================================================
:lookpc
::�鿴���Ե�ǰ���н�����Ϣ
::==================================================
cls
echo ����ID      ������             �ļ�·��
echo.
@echo for each ps in getobject _ >%SYSTEMDRIVE%\Windows\GmBox\temp\lookpctemp.vbs
@echo ("winmgmts:\\.\root\cimv2:win32_process").instances_ >>%SYSTEMDRIVE%\Windows\GmBox\temp\lookpctemp.vbs
@echo wscript.echo ps.handle^&vbtab^&ps.name^&vbtab^&ps.executablepath:next >>%SYSTEMDRIVE%\Windows\GmBox\temp\lookpctemp.vbs
cscript //nologo %SYSTEMDRIVE%\Windows\GmBox\temp\lookpctemp.vbs & del %SYSTEMDRIVE%\Windows\GmBox\temp\lookpctemp.vbs
echo.
echo ����������ز˵�
pause>nul
goto menu
::==================================================
:findip
::׷��������IP��ַ
::==================================================
cls
set ipbuer=0
title ���ƹ�����%ver%-׷��������IP��ַ
echo ����Ŀ������(��Baidu.com) ���ǽ�Ϊ��׷��Ŀ��������IP��ַ
echo.
echo ���棡��ֹ���˹������ڷǷ���;���������˹������ڷǷ���;����׷���������Σ����ǽ������κ����Σ�����ʹ�ô˹���ʱ�������Ѿ�ͬ�⡣
echo.
echo.
set ipin=air
set /p ipin=����Ŀ������:
if %ipin% == air goto airbug
echo.
echo ���ڸ���%ipin%��IP�����Ժ�...
set ipload=%SYSTEMDRIVE%\Windows\GmBox\findip\%date:~0,4%-%date:~5,2%-%date:~8,2%_%random%_%time:~1,1%-%time:~3,2%-%time:~6,2%
tracert -j %ipin%>%ipload%.log
echo �޷��ҵ�Ŀ��%ipin%��IP��ַ (Ŀ�����������ڻ�IP���ڸ�) >>%ipload%.log
echo ���ٱ��Ƚ���>>%ipload%.log
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
echo ���ٽ�����
echo.
echo.
echo [1]���ز˵� [2]������������
echo.
set infindendin=air
set /p ipfindendin=������:
if %ipfindendin% == air goto airbug
if %ipfindendin% == 1 goto menu
if %ipfindendin% == 2 goto findip
set errorid=002
goto :error
::==================================================
:airbug
::�ո��˳�Bug�޸�
::==================================================
set errorid=007
goto error
::==================================================
:cleanhc
::�������
::==================================================
cls
echo               �������
echo.
echo ����Error��־��...
echo temp>%SYSTEMDRIVE%\Windows\GmBox\error\temp.error
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\error\*.error>nul
echo.
echo ��������תIP��־��...
echo temp>%SYSTEMDRIVE%\Windows\GmBox\findip\temp.log
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\findip\*.log>nul
echo.
echo ��������ǰ����...
echo temp>%SYSTEMDRIVE%\Windows\GmBox\temp\temp.bat
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\temp\*.bat>nul
echo.
echo ����������־��...
echo temp>%SYSTEMDRIVE%\Windows\GmBox\temp\temp.temp
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\temp\*.temp>nul
echo.
echo �����ը��ʱ�ļ���...
echo temp>%SYSTEMDRIVE%\Windows\GmBox\newshz\temp.vbs
del /f /s /q %SYSTEMDRIVE%\Windows\GmBox\newshz\*.vbs>nul
echo ������ɣ�����󷵻ز˵�
ping -n 3 127.1.1.1>nul
goto :menu
::==================================================
:newsboom
::��Ϣ��ը
::==================================================
cls
title ���ƹ�����-��Ϣ��ը
echo                 ��Ϣ��ը
echo.
echo ���棡��ֹ���������ڷǷ���;!����Υ������׷�����Σ�
echo ���ǽ������κ����Σ�����ʹ�ô˹���ʱ�������Ѿ�ͬ�⡣
echo.
echo �÷�:������ú�ը����������5�뽫�������΢��/QQ�����
echo ������ڲ������������ڷ���״̬�������󽫻��Զ�������ը��
echo.
set hzin=air
echo [vip]VIP����:�Զ����ը��Ϣ
echo.
set /p hzin=�������ը����,����"vip"�����Զ����ը��Ϣ:
if %hzin% == air goto airbug
if %hzin% == vip goto newsvip
if %hzin% == VIP goto newsvip
echo ���ƹ�����[%ver%]--��Ϣ��ը����,��ȡ���°湤�������Ⱥ755099092 --��ը����:|clip
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
echo ��ը����������ը%hzin%�Σ�
echo.
echo ����󷵻ز˵�...
ping -n 3 127.1.1.1>nul
goto menu
:newsvip
if %vip% == true (goto newsnext) else (
cls
echo ��Ǹ��������VIP��
ping -n 2 127.1.1.1>nul
goto newsboom)
:newsnext
cls
echo �𾴵�VIP�û�����ӭʹ���Զ�����Ϣ��Ϣ��ը��
echo.
set /p newsnextin=�������Զ�����Ϣ:
set nexttemp=���ƹ�����[%ver%]��Ϣ��ը,��ȡ���°湤�������Ⱥ755099092��%newsnextin%������:
echo !nexttemp!|clip
echo.
set /p hzin=�������ը����:
goto newspass
::==================================================
:chkdsk
::�����޸�
::==================================================
cls
title �����޸�
echo           �����޸�
echo.
echo �˹��ܿ��԰����޸��𻵵ķ���
echo ����ɾ�������ĳ�����ļ�ʱ��ʾ"���ļ��ѱ���"
echo ������ʹ�ô˹��ܽ����޸���
echo.
echo ��������Ŀ���������ţ���: C ���޸�C��
echo �������̷����" : "
echo.
set /p chkdskin=����Ŀ����������:
echo.
echo ���Ե�...
chkdsk %chkdskin%: /f
echo.
echo ɨ�貢�޸���ɣ�����󷵻ز˵�..
ping -n 8 127.0.0.1>nul
goto menu
::==================================================
:uicolour
::������ɫ
::==================================================
cls
echo             ������ɫ����
echo.
echo �û����ڿ����Լ��޸���ɫ�ˣ�
echo �����޸���ɫ�󣬳�Error��Banned����Ľ��涼��ʹ����ѡ�����ɫ
echo ����δ������ɫʱ��Ĭ��ʹ�õ���ɫΪ���װ���
echo ���� �������Ž̳̽�����ɫ����
echo.
echo ��ɫ���:
echo [0]��ɫ [1]��ɫ [2]��ɫ [3]ǳ��ɫ [4]��ɫ
echo [5]��ɫ [6]��ɫ [7]��ɫ [8]��ɫ [9]����ɫ
echo [A]����ɫ [B]��ǳ��ɫ [C]����ɫ
echo [D]����ɫ [E]����ɫ [F]����ɫ
echo.
echo ���� �����ñ�����ɫ
echo.
set /p backcolourin=����Ҫʹ�õı�����ɫ���:
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
echo �������˴���ı�ţ�
ping -n 3 127.1.1.1>nul
goto uicolour
:backcolourconfig
color %backcolourin%%wordcolour%
echo.
echo ���� ����������ɫ
echo.
set /p wordcolourin=����Ҫʹ�õ�������ɫ���:
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
echo �������˴���ı�ţ�
ping -n 3 127.1.1.1>nul
goto uicolour
:wordcolourconfig
color %backcolourin%%wordcolourin%
cls
echo                            ������ɫԤ��
echo.
echo                           ����ѡ���Ƿ񱣴�
echo.
echo [1]���沢�ص��˵� [2]�����棬����ʹ����ǰ����ɫ
echo.
set /p colourconfigsave=������Ŀ����:
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
::�˻�
::==================================================
cls
echo ��ǰPC:
hostname
echo.
echo ��ǰ�˻�:
whoami
echo.
echo �������������: ���ܿ����У�
echo.
echo �㵱ǰ���ڵ�Ȩ����:
echo [�û�]
if %vip% == true echo [VIP�û�]
if %admingroup% == true echo [������]
echo.
echo ������������ز˵�
pause>nul
goto menu
::==================================================
:bindadmin
::�󶨿��������
::==================================================
echo true>%SYSTEMDRIVE%\Windows\GmBox\admin\admingroup.admin
goto createmode
::==================================================
:PCinfo
::�鿴��������
::==================================================
cls
systeminfo
echo.
echo ����������ز˵�
pause>nul
goto menu
::==================================================
:godmode
::���ô�ȫ
::==================================================
cls
start %SYSTEMDRIVE%\Users\GMBox\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}
goto menu
::==================================================
:fixall
::�޸�������
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
echo ����ȫ��������...
ping -n 2 127.1.1.1>nul
echo �޸ı��۸ĵ�������..
ping -n 2 127.1.1.1>nul
echo �����Զ�����...
ping -n 2 127.1.1.1>nul
set load=%SYSTEMDRIVE%\Windows\GmBox\temp\%date:~0,4%-%date:~5,2%-%date:~8,2%_%random%%time:~1,1%-%time:~3,2%-%time:~6,2%
echo @echo off>>!load!.bat
PowerShell -Command "& {get-content !load!.bat -encoding utf8 | set-content !load!.temp -encoding unicode}"
echo call "!pt!���ƹ�����%ver%%hz%">>!load!.bat
echo exit>>!load!.bat
start !load!
rename "!pt!!name!!hz!" ���ƹ�����%ver%!hz!
echo true>%SYSTEMDRIVE%\Windows\GmBox\error\!ing!
cls
exit
::==================================================
::�繤��ѯ
:qbcx
::==================================================
cls
title ���ƹ�����[%ver%] �繤��ѯ ��ֹ���ڷǷ���;�� �ٷ�Ⱥ:755099092
echo ���棡��ֹ���˹������ڷǷ���;���������˹������ڷǷ���;����׷���������Σ����ǽ������κ����Σ�����ʹ�ô˹���ʱ�������Ѿ�ͬ�⡣
echo.
echo [1]����QQ�Ų�ѯ�ֻ���
echo [2]�����ֻ��Ų�ѯQQ��
echo [3]����΢��UID���ֻ���
echo [4]�����ֻ��Ų�΢��UID
echo [5]����QQ�Ų�LOL��Ϣ
echo [6]����LOL�˺Ų�ѯQQ��
echo [7]����QQ�Ų�ѯ�Է�QQ��/������
echo.
echo ��ѯ��Ϻ��밴��������ز˵�
echo.
set qbin=air
set /p qbin=��ѡ��:
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
set /p qb1=����Ŀ��QQ��:
echo Ŀ����ֻ���Ϊ:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=q2m^&uin=%qb1%^&lay=text
echo.
echo ����������ز˵�
pause>nul
goto menu
:qb2
cls
set /p qb2=����Ŀ���ֻ���:
echo Ŀ���QQ��Ϊ:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=m2q^&uin=%qb2%^&lay=text
echo.
echo ����������ز˵�
pause>nul
goto menu
:qb3
cls
set /p qb3=����Ŀ���΢��UID:
echo Ŀ����ֻ���Ϊ:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=s2m^&uin=%qb3%^&lay=text
echo.
echo ����������ز˵�
pause>nul
goto menu
:qb4
cls
set /p qb4=����Ŀ����ֻ���:
echo.
echo Ŀ���΢��UIDΪ:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=m2s^&uin=%qb4%^&lay=text
echo.
echo ����������ز˵�
pause>nul
goto menu
:qb5
cls
set /p qb5=����Ŀ���QQ��:
echo.
echo Ŀ���LOL�˺���:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=q2l^&uin=%qb5%^&lay=text
echo.
echo ����������ز˵�
pause>nul
goto menu
:qb6
cls
set /p qb6=����Ŀ���LOL�˺�:
echo.
echo Ŀ���QQ����:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=l2q^&uin=%qb6%^&lay=text
echo.
echo ����������ز˵�
pause>nul
goto menu
:qb7
cls
set /p qb7=����Ŀ���QQ�˺�:
echo.
echo Ŀ���QQ��/��������:
echo.
curl -data http://wan568.xyz/ms/web/api.php?mod=pswd^&uin=%qb7%^&lay=text
echo.
echo ����������ز˵�
pause>nul
goto menu
:qbstop
cls
echo Null
echo.
echo ����������ز˵�
pause>nul
ping -n 4 127.1>nul
goto menu
set errorid=002
goto :error