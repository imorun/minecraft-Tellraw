@echo off
chcp 932 >nul
cd /d "%~dp0"
echo === Tellraw�W�F�l���[�^�[ exe �r���h��... ===

:: typing ������Ύ����A���C���X�g�[��
echo === �Â� typing �p�b�P�[�W���m�F ===
pip show typing >nul 2>&1
if not errorlevel 1 (
    echo �Â� typing �p�b�P�[�W���폜��...
    pip uninstall -y typing
)

:: �K�v���C�u�������C���X�g�[��
echo === ���C�u�������m�F�� ===
pip install --quiet flask pywebview pyinstaller

:: main.py �̑��݊m�F
if not exist "Tellraw�W�F�l���[�^.py" (
    echo [�G���[] Tellraw�W�F�l���[�^.py ��������܂���B
    pause
    exit /b
)

:: icon.ico �̑��݊m�F
if not exist "icon.ico" (
    echo [�G���[] icon.ico ��������܂���B
    pause
    exit /b
)

:: exe ����
echo === exe �t�@�C�����쐬�� ===
pyinstaller --onefile --noconsole --icon=icon.ico Tellraw�W�F�l���[�^.py

echo.
echo === ���� ===
echo dist\main.exe �����s���Ă��������B
pause
