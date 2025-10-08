@echo off
chcp 932 >nul
cd /d "%~dp0"
echo === Tellrawジェネレーター exe ビルド中... ===

:: typing があれば自動アンインストール
echo === 古い typing パッケージを確認 ===
pip show typing >nul 2>&1
if not errorlevel 1 (
    echo 古い typing パッケージを削除中...
    pip uninstall -y typing
)

:: 必要ライブラリをインストール
echo === ライブラリを確認中 ===
pip install --quiet flask pywebview pyinstaller

:: main.py の存在確認
if not exist "Tellrawジェネレータ.py" (
    echo [エラー] Tellrawジェネレータ.py が見つかりません。
    pause
    exit /b
)

:: icon.ico の存在確認
if not exist "icon.ico" (
    echo [エラー] icon.ico が見つかりません。
    pause
    exit /b
)

:: exe 生成
echo === exe ファイルを作成中 ===
pyinstaller --onefile --noconsole --icon=icon.ico Tellrawジェネレータ.py

echo.
echo === 完了 ===
echo dist\main.exe を実行してください。
pause
