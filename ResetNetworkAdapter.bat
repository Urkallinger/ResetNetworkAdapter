@echo off

set ADAPTER_NAME=Wi-Fi
set TIME_TO_WAIT=5


REM disable adapter
call :SetAdapter disabled
if errorlevel 1 goto :eof

REM wait
call :Wait %TIME_TO_WAIT%

REM enable adapter
call :SetAdapter enabled
if errorlevel 1 goto :eof

REM exit batch file
goto :eof


REM Sets the given status (enabled, disabled) for the adapter (%ADAPTER_NAME%).
:SetAdapter
    echo set %ADAPTER_NAME% adapter: %1

    netsh interface set interface %ADAPTER_NAME% %1 && ( echo >NUL ) || (
        pause
        exit /b 1
    )
    exit /b 0

REM Wait for the given number of seconds
:Wait
    echo wait for %1 seconds
    echo.
    PING localhost -n %1+1 >NUL
    exit /b 0