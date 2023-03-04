@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
	echo Select Windows Version
	echo.
	echo 1: Windows Pro
	echo 2: Windows Home
	echo 3: Home Single Language
	echo 4: Enterprise
	echo 5: Education
	echo.
    set /p input=Enter your choice : 
	if %input%==1 (
		slmgr.vbs /ipk RBJYN-Y76DX-6PVMD-RY9HQ-3PBQ3
		slmgr.vbs /skms kms.lotro.cc
		slmgr.vbs /ato
	) else if %input%==2 (
		slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
		slmgr.vbs /skms kms.lotro.cc
		slmgr.vbs /ato
	) else if %input%==3 (
		slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
		slmgr.vbs /skms kms.lotro.cc
		slmgr.vbs /ato
	) else if %input%==4 (
		slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43B8YKP-D69TJ
		slmgr.vbs /skms kms.lotro.cc
		slmgr.vbs /ato
	) else if %input%==5 (
		slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
		slmgr.vbs /skms kms.lotro.cc
		slmgr.vbs /ato
	) else (
	   echo Invalid input
	)
	pause
:--------------------------------------
