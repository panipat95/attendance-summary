@echo off
chcp 65001 > nul
title ระบบอัพเดทข้อมูลสรุปการเข้าแถวจาก Google Sheet
echo ===================================================================
echo     ระบบอัพเดทสถิติการเข้าแถว โฮมรูม และจิตศึกษา ม.1
echo     ดึงข้อมูลจาก Google Sheet (ID: 1EQ86CzyKT0JX__siFIZW0u9ZuAmk25iudGXXlX2xcbk)
echo ===================================================================
echo.

echo [1/3] กำลังประมวลผลข้อมูลจาก Google Sheet...
python sync_attendance.py
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] เกิดข้อผิดพลาดในการดึงข้อมูล กรุณาตรวจสอบอินเทอร์เน็ต!
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo [2/3] กำลังส่งข้อมูลขึ้น GitHub Pages...
git add index.html sync_attendance.py .github/workflows
git commit -m "Auto-update attendance data from online Google Sheet"
git push origin main

echo.
echo ===================================================================
echo   อัพเดทข้อมูลขึ้นเว็บไซต์สำเร็จเรียบร้อยแล้ว!
echo   เว็บไซต์: https://panipat95.github.io/attendance-summary/
echo ===================================================================
echo.
pause
