#!/bin/bash

# EdgeOne Pages 构建脚本
# 确保使用 Python 3

echo "开始构建 PyLearn..."

# 检查 Python 版本
if command -v python3 &> /dev/null; then
    echo "使用 Python 3"
    PYTHON_CMD=python3
    PIP_CMD=pip3
elif command -v python &> /dev/null; then
    PYTHON_VERSION=$(python --version 2>&1 | grep -oP '(?<=Python )\d+')
    if [ "$PYTHON_VERSION" -ge 3 ]; then
        echo "使用 Python $PYTHON_VERSION"
        PYTHON_CMD=python
        PIP_CMD=pip
    else
        echo "错误：需要 Python 3，但找到的是 Python $PYTHON_VERSION"
        exit 1
    fi
else
    echo "错误：未找到 Python"
    exit 1
fi

# 升级 pip
echo "升级 pip..."
$PYTHON_CMD -m pip install --upgrade pip

# 安装依赖
echo "安装依赖..."
$PYTHON_CMD -m pip install -r requirements.txt

# 构建网站
echo "构建网站..."
$PYTHON_CMD -m mkdocs build

echo "构建完成！"
