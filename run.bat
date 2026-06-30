@echo off
chcp 65001 >nul
cd /d "%~dp0"

if not exist ".venv" (
    echo Создаю виртуальное окружение...
    python -m venv .venv
)

echo Устанавливаю зависимости...
.venv\Scripts\pip install playwright openpyxl nodriver >nul 2>&1
.venv\Scripts\playwright install chromium >nul 2>&1

echo Запускаю скрипт...
.venv\Scripts\python -u export_chats.py

echo.
pause
