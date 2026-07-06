@echo off
title 生化迷局：轮回实验室
chcp 65001 >nul 2>&1
cd /d "%~dp0"

:check_python
echo.
echo   ╔══════════════════════════════════════════════╗
echo   ║                                            ║
echo   ║     生 化 迷 局 ： 轮 回 实 验 室         ║
echo   ║     BioMystery: Recursion Lab             ║
echo   ║                                            ║
echo   ║     [36m双击对话框继续  点击选项选择[0m            ║
echo   ║     [36m左上角菜单存档  知识问答学知识[0m            ║
echo   ║                                            ║
echo   ╚══════════════════════════════════════════════╝
echo.
echo   [*] 正在检测运行环境...

:: Check if Python is available
where python >nul 2>&1
if %errorlevel% equ 0 (
    goto :start_python
)

:: Python not found, check Node.js
where npx >nul 2>&1
if %errorlevel% equ 0 (
    goto :start_node
)

:: Neither found
echo.
echo   ╔══════════════════════════════════════════════╗
echo   ║  [X] 未检测到 Python 或 Node.js            ║
echo   ║                                            ║
echo   ║  请先安装 Python 3:                       ║
echo   ║  https://www.python.org/downloads/         ║
echo   ║                                            ║
echo   ║  安装时请勾选 ✓ Add Python to PATH        ║
echo   ║  安装完成后重新双击此文件即可             ║
echo   ║                                            ║
echo   ║  如果已安装但无法识别，请尝试：           ║
echo   ║  1. 重启电脑                              ║
echo   ║  2. 或打开命令行输入 python --version     ║
echo   ╚══════════════════════════════════════════════╝
echo.
pause
goto :end

:start_python
    echo   [OK] 检测到 Python
    echo   [*] 正在启动游戏服务器...
    echo.
    echo   ┌────────────────────────────────────────┐
    echo   │  浏览器即将打开 http://localhost:21777 │
    echo   │                                        │
    echo   │  ★ 双击对话框 = 继续 / 快进           │
    echo   │  ★ 左上角 ☰ = 存档 / 读档            │
    echo   │  ★ 标题画面 = 查看实验笔记（知识库）  │
    echo   │                                        │
    echo   │  游戏结束后关闭本窗口即可              │
    echo   └────────────────────────────────────────┘
    echo.
    timeout /t 3 /nobreak >nul
    start "" http://localhost:21777
    python -m http.server 21777 --bind 127.0.0.1
    goto :end

:start_node
    echo   [OK] 检测到 Node.js
    echo   [*] 正在启动游戏服务器...
    echo.
    echo   ┌────────────────────────────────────────┐
    echo   │  浏览器即将打开 http://localhost:21777 │
    echo   │  游戏结束后关闭本窗口即可              │
    echo   └────────────────────────────────────────┘
    echo.
    timeout /t 2 /nobreak >nul
    start "" http://localhost:21777
    npx --yes serve . -l 21777 --no-clipboard
    goto :end

:end
    echo.
    echo   游戏服务器已停止。感谢游玩！
    timeout /t 2 >nul
