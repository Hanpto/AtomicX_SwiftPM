#!/bin/bash

# AlbumPicker 业务层构建脚本快速入口

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON_SCRIPT="$SCRIPT_DIR/build_landun.py"

# 检查Python是否可用
if ! command -v python3 &> /dev/null; then
    echo "错误: 未找到python3，请确保已安装Python 3"
    exit 1
fi

# 检查构建脚本是否存在
if [ ! -f "$PYTHON_SCRIPT" ]; then
    echo "错误: 未找到构建脚本 $PYTHON_SCRIPT"
    exit 1
fi

# 执行Python构建脚本
echo "开始执行AlbumPicker构建..."
python3 "$PYTHON_SCRIPT" "$@"

echo "构建脚本执行完成"
