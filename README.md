# PyLearn - 交互式 Python 学习平台

一个基于 MkDocs + PyScript 构建的交互式 Python 教学平台，支持在浏览器中直接运行 Python 代码。

## 🌟 特性

- ✅ **交互式 Python 代码**：直接在浏览器中运行 Python
- ✅ **科学计算支持**：集成 NumPy、Pandas、Matplotlib
- ✅ **数学公式渲染**：支持 LaTeX 数学公式
- ✅ **响应式设计**：Material Design 风格界面
- ✅ **搜索功能**：内置全文搜索
- ✅ **代码复制**：一键复制代码块

## 🚀 快速开始

### 环境要求

- Python 3.8+
- Git

### 本地开发

1. **克隆仓库**
   ```bash
   git clone https://github.com/anzchy/pylearn.git
   cd pylearn
   ```

2. **创建虚拟环境**
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # Windows: .venv\Scripts\activate
   ```

3. **安装依赖**
   ```bash
   pip install mkdocs-material
   ```

4. **启动开发服务器**
   ```bash
   mkdocs serve
   ```

   访问 `http://127.0.0.1:8000` 查看网站

5. **其他常用命令**
   ```bash
   # 构建静态网站
   mkdocs build

   # 清理构建缓存
   mkdocs clean

   # 部署到 GitHub Pages
   mkdocs gh-deploy
   ```

## 📁 项目结构

```
pylearn/
├── mkdocs.yml              # MkDocs 配置文件
├── docs/                   # 文档源文件
│   ├── index.md           # 首页
│   ├── assets/            # 静态资源
│   │   └── style.css      # 自定义样式
│   └── lessons/           # 教程目录
│       ├── intro.md       # Python 基础
│       └── pandas_demo.md # Pandas 示例
├── overrides/             # 模板覆盖
│   └── main.html          # 自定义 HTML 模板
└── site/                  # 构建输出目录（git忽略）
```

## ✍️ 添加新教程

1. 在 `docs/lessons/` 目录下创建新的 Markdown 文件
2. 使用 PyScript 标签添加交互式代码：

   ```html
   <py-config>
   packages = ["numpy", "pandas"]
   </py-config>

   <py-script>
   import numpy as np
   print("Hello from browser!")
   </py-script>
   ```

3. 在 `mkdocs.yml` 中添加导航菜单项：

   ```yaml
   nav:
     - 首页: index.md
     - 教程:
         - Python 基础: lessons/intro.md
         - 新教程: lessons/your_tutorial.md  # 添加这一行
   ```

## 🚀 部署指南

### GitHub Pages 部署

1. **确保仓库已推送到 GitHub**
2. **使用自动部署**
   ```bash
   mkdocs gh-deploy
   ```
3. 访问 `https://anzchy.github.io/pylearn` 查看部署的网站

### 腾讯云 EdgeOne Pages 部署

EdgeOne Pages 是腾讯云提供的静态网站托管服务，支持从 Git 仓库自动部署。

#### 部署步骤：

1. **登录腾讯云控制台**
   - 访问 [腾讯云控制台](https://console.cloud.tencent.com/)
   - 搜索 "EdgeOne" 或直接访问 [EdgeOne 控制台](https://console.cloud.tencent.com/edgeone)

2. **创建 EdgeOne Pages 应用**
   - 在 EdgeOne 控制台中选择 "Pages" 服务
   - 点击 "新建应用" 或 "创建应用"

3. **配置 Git 仓库**
   - **仓库平台**：选择 GitHub
   - **仓库地址**：`https://github.com/anzchy/pylearn.git`
   - **分支**：选择 `master` 或 `main` 分支
   - **构建目录**：设置为 `site`（MkDocs 构建输出目录）

4. **构建配置** ⚠️ 重要！
   ```yaml
   # 构建设置
   构建命令: pip3 install --upgrade pip && pip3 install -r requirements.txt && mkdocs build
   输出目录: site
   Python 版本: 3.11 或更高
   ```

   **环境变量设置**（在 EdgeOne Pages 控制台设置）：
   ```
   PYTHON_VERSION=3.11
   ```

   **或者使用构建脚本**：
   ```bash
   构建命令: bash build.sh
   输出目录: site
   ```

5. **域名设置**
   - 使用默认生成的 `.pages.edgeone.app` 域名，或
   - 绑定自定义域名（需要备案）

6. **SSL 证书**
   - EdgeOne 自动提供免费 SSL 证书
   - 支持 HTTPS 访问

7. **部署触发**
   - **自动部署**：代码推送到 GitHub 后自动构建部署
   - **手动部署**：在控制台手动触发构建

#### 高级配置：

**环境变量配置**（如需要）：
```bash
PYTHON_VERSION=3.9
PIP_VERSION=latest
```

**自定义构建脚本**：
```bash
#!/bin/bash
# 安装依赖
pip install mkdocs-material

# 构建网站
mkdocs build

# 检查构建结果
ls -la site/
```

**重定向规则**（可选）：
```yaml
# 将根路径重定向到首页
from: /
to: /index.html
status: 301
```

### 其他部署平台

#### Netlify
1. 连接 GitHub 仓库
2. 构建设置：
   - Build command: `pip install mkdocs-material && mkdocs build`
   - Publish directory: `site`

#### Vercel
1. 导入 GitHub 仓库
2. 配置构建命令：
   ```json
   {
     "buildCommand": "pip install mkdocs-material && mkdocs build",
     "outputDirectory": "site",
     "installCommand": "pip install mkdocs-material"
   }
   ```

#### Cloudflare Pages
1. 连接 Git 仓库
2. 构建设置：
   - Build command: `pip install mkdocs-material && mkdocs build`
   - Build output directory: `site`

## 🔧 故障排除

### PyScript 不工作
1. 检查浏览器控制台是否有错误信息
2. 确保使用最新版本的 PyScript
3. 检查网络连接（需要下载 Python 包）

### 构建失败
```bash
# 清理缓存重新构建
mkdocs clean
mkdocs build
```

### 依赖问题
```bash
# 重新安装依赖
pip install --upgrade mkdocs-material
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

1. Fork 本仓库
2. 创建功能分支：`git checkout -b feature/new-tutorial`
3. 提交更改：`git commit -am 'Add new tutorial'`
4. 推送分支：`git push origin feature/new-tutorial`
5. 提交 Pull Request

## 📄 许可证

MIT License

## 🔗 相关链接

- [MkDocs 官方文档](https://www.mkdocs.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [PyScript 官方文档](https://pyscript.net/)
- [腾讯云 EdgeOne](https://cloud.tencent.com/product/edgeone)