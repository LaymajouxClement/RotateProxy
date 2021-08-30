@echo off
set ProgramPath=%CD%
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
cd "%~dp0"
:loop
FOR /F %%i IN (proxylist.txt) DO netsh winhttp set proxy %%i & TIMEOUT /T 300 /NOBREAK
goto loop
pause