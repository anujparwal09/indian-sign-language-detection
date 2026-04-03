@echo off
REM Setup script for Indian Sign Language Detection - Streamlit (Windows)

echo.
echo 🚀 Setting up Indian Sign Language Detection App...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python is not installed or not in PATH. Please install Python first.
    pause
    exit /b 1
)

echo ✅ Python found: 
python --version

REM Create virtual environment
echo.
echo 📦 Creating virtual environment...
python -m venv venv

REM Activate virtual environment
echo 🔌 Activating virtual environment...
call venv\Scripts\activate.bat

REM Install dependencies
echo.
echo ⬇️  Installing dependencies from requirements.txt...
python -m pip install --upgrade pip
pip install -r requirements.txt

echo.
echo ✅ Setup complete!
echo.
echo To run the app:
echo   streamlit run appUI.py
echo.
echo For cloud deployment (Streamlit Cloud), use:
echo   streamlit run appUI_cloud.py
echo.
echo Press any key to exit...
pause

