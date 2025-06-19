#!/bin/bash

# VS Code Insider更新スクリプト
set -e  # エラーが発生したら停止

echo "VS Code Insiderを更新しています..."

# 現在のディレクトリを確認
CURRENT_DIR=$(pwd)
echo "現在のディレクトリ: $CURRENT_DIR"

# VS Code Insiderをダウンロード
echo "VS Code Insiderをダウンロードしています..."
wget -O vscode-insider.tar.gz "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64"

# VS Code Insiderをkill
echo "VS Code Insiderを終了しています..."
if pgrep -x "code-insiders" > /dev/null; then
    pkill -f "code-insiders"
    echo "VS Code Insiderを終了しました。"
else
    echo "VS Code Insiderは実行されていません。"
fi

# 既存のVSCode-linux-x64ディレクトリを削除
if [ -d "VSCode-linux-x64" ]; then
    echo "既存のVSCode-linux-x64ディレクトリを削除しています..."
    rm -rf ./VSCode-linux-x64
fi

# ダウンロードしたファイルを解凍
echo "VS Code Insiderを解凍しています..."
tar xvf vscode-insider.tar.gz

# ダウンロードしたファイルを削除
echo "一時ファイルを削除しています..."
rm ./vscode-insider.tar.gz

echo "VS Code Insiderの更新が完了しました！"
echo "VSCode-linux-x64/bin/code-insiders で起動できます。"
