@echo off
cd /d "%~dp0"
powershell -ExecutionPolicy Bypass -File "sync-to-server.ps1"
pause
