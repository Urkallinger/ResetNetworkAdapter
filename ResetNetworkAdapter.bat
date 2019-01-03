@echo off

set ADAPTER_NAME=Wi-Fi
set TIMEOUT=5

REM === disable adapter =======================================================
echo disable %ADAPTER_NAME% adapter

netsh interface set interface %ADAPTER_NAME% disabled && ( echo >NUL ) || (
    pause
    goto :eof
)
REM ===========================================================================


REM === wait ==================================================================
echo wait for %TIMEOUT% seconds
echo.
PING localhost -n %TIMEOUT%+1 >NUL
REM ===========================================================================


REM === enable adapter ========================================================
echo enable %ADAPTER_NAME% adapter
netsh interface set interface %ADAPTER_NAME% enabled && ( echo >NUL ) || (
    pause
    goto :eof
)
REM ===========================================================================