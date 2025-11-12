# PyLearn 开发指南

本指南详细说明如何在 PyLearn 平台上创建交互式 Python 教程文档。

---

## 📋 目录

1. [基本 Markdown 语法](#基本-markdown-语法)
2. [嵌入 Python 代码](#嵌入-python-代码)
3. [外部包管理](#外部包管理)
4. [配置选项详解](#配置选项详解)
5. [最佳实践](#最佳实践)
6. [完整示例](#完整示例)
7. [常见问题](#常见问题)

---

## 基本 Markdown 语法

### 标题层级

```markdown
# 一级标题
## 二级标题
### 三级标题
#### 四级标题
```

### 文本格式

```markdown
**粗体文字**
*斜体文字*
~~删除线~~
`行内代码`
```

### 列表

```markdown
- 无序列表项 1
- 无序列表项 2
  - 子项 2.1
  - 子项 2.2

1. 有序列表项 1
2. 有序列表项 2
3. 有序列表项 3
```

### 链接和图片

```markdown
[链接文字](https://example.com)
![图片描述](./images/example.png)
```

### 数学公式

使用 MathJax 语法：

```markdown
行内公式：$E = mc^2$

块级公式：
$$
\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}
$$
```

示例：行内公式 $E = mc^2$，块级公式如下：

$$
\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}
$$

---

## 嵌入 Python 代码

PyLearn 使用 **PyScript 2025.11.1** 技术，支持在浏览器中运行 Python 代码。

### 基本语法

使用 `<script type="py-editor">` 标签嵌入可编辑的 Python 代码：

```html
<script type="py-editor">
# 这里写 Python 代码
print("Hello, PyLearn!")
</script>
```

### 重要说明

⚠️ **注意事项：**

1. ✅ **直接写 Python 代码** - 不要使用 Markdown 代码围栏（\`\`\`）
2. ✅ **保持缩进** - Python 缩进必须正确
3. ✅ **使用标准语法** - 代码将在 Pyodide（Python 3.11）中运行
4. ✅ **可编辑** - 用户可以修改代码并点击 Run 按钮运行

---

## 外部包管理

### 示例 1：无需外部包

简单的 Python 代码不需要任何配置：

```html
<script type="py-editor">
# 纯 Python 标准库代码
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

for i in range(10):
    print(f"F({i}) = {fibonacci(i)}")
</script>
```

**实际效果：**

<script type="py-editor">
# 纯 Python 标准库代码
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

for i in range(10):
    print(f"F({i}) = {fibonacci(i)}")
</script>

---

### 示例 2：使用单个外部包

使用 `config` 属性引入包（如 NumPy）：

```html
<script type="py-editor" config='{"packages": ["numpy"]}'>
import numpy as np

# 创建数组
arr = np.array([1, 2, 3, 4, 5])
print(f"数组: {arr}")
print(f"平均值: {arr.mean()}")
print(f"标准差: {arr.std():.2f}")
</script>
```

**实际效果：**

<script type="py-editor" config='{"packages": ["numpy"]}'>
import numpy as np

# 创建数组
arr = np.array([1, 2, 3, 4, 5])
print(f"数组: {arr}")
print(f"平均值: {arr.mean()}")
print(f"标准差: {arr.std():.2f}")
</script>

---

### 示例 3：使用多个外部包

引入多个包（如 NumPy + Pandas）：

```html
<script type="py-editor" config='{"packages": ["numpy", "pandas"]}'>
import numpy as np
import pandas as pd

# 创建 DataFrame
data = pd.DataFrame({
    "姓名": ["张三", "李四", "王五"],
    "年龄": [25, 30, 35],
    "工资": [8000, 12000, 15000]
})

print("员工数据:")
print(data)
print(f"\n平均年龄: {data['年龄'].mean()}")
print(f"平均工资: {data['工资'].mean()}")
</script>
```

**实际效果：**

<script type="py-editor" config='{"packages": ["numpy", "pandas"]}'>
import numpy as np
import pandas as pd

# 创建 DataFrame
data = pd.DataFrame({
    "姓名": ["张三", "李四", "王五"],
    "年龄": [25, 30, 35],
    "工资": [8000, 12000, 15000]
})

print("员工数据:")
print(data)
print(f"\n平均年龄: {data['年龄'].mean()}")
print(f"平均工资: {data['工资'].mean()}")
</script>

---

## 配置选项详解

### config 属性

`config` 属性使用 JSON 格式，必须用**单引号**包裹：

```html
<script type="py-editor" config='{"packages": ["包名1", "包名2"]}'>
```

### 常用包列表

PyScript 支持的常用科学计算包：

| 包名 | 说明 | 示例用途 |
|------|------|----------|
| `numpy` | 数值计算 | 数组、矩阵运算 |
| `pandas` | 数据分析 | DataFrame、数据处理 |
| `matplotlib` | 数据可视化 | 绘制图表 |
| `scikit-learn` | 机器学习 | 模型训练、预测 |
| `scipy` | 科学计算 | 统计、优化、信号处理 |
| `sympy` | 符号计算 | 代数、微积分 |
| `requests` | HTTP 请求 | API 调用 |

### 配置示例

```html
<!-- 无包依赖 -->
<script type="py-editor">

<!-- 单个包 -->
<script type="py-editor" config='{"packages": ["numpy"]}'>

<!-- 多个包 -->
<script type="py-editor" config='{"packages": ["numpy", "pandas", "matplotlib"]}'>
```

---

## 最佳实践

### 1. 文档结构

推荐的文档结构：

```markdown
# 教程标题

简短的介绍说明本教程的内容和目标。

**学习目标：**
- 目标 1
- 目标 2
- 目标 3

---

## 第一部分：基础概念

文字说明...

<script type="py-editor">
# 示例代码
</script>

## 第二部分：进阶应用

文字说明...

<script type="py-editor" config='{"packages": ["numpy"]}'>
# 带包的示例代码
</script>

---

## 小结

总结本教程的要点...
```

### 2. 代码注释规范

```python
# ✅ 好的注释：清晰说明目的
# 创建一个 5x5 的单位矩阵
identity = np.eye(5)

# ❌ 不好的注释：重复代码
# 创建 eye
identity = np.eye(5)
```

### 3. 输出友好性

```python
# ✅ 好的输出：带描述
print(f"平均值: {data.mean():.2f}")
print(f"最大值: {data.max()}")

# ❌ 不好的输出：无上下文
print(data.mean())
print(data.max())
```

### 4. 错误处理

```python
# ✅ 添加错误处理，提高用户体验
try:
    result = 10 / 0
except ZeroDivisionError:
    print("错误：不能除以零！")

# ❌ 没有错误处理，用户看到难懂的报错
result = 10 / 0
```

### 5. 数据展示

```python
# ✅ 格式化输出，便于阅读
print("\n学生成绩统计：")
print("=" * 40)
print(f"最高分: {scores.max()}")
print(f"最低分: {scores.min()}")
print(f"平均分: {scores.mean():.2f}")
print("=" * 40)

# ❌ 混乱的输出
print(scores.max(), scores.min(), scores.mean())
```

---

## 完整示例

### 示例 1：Python 基础教程

```markdown
# Python 列表操作

学习 Python 列表的基本操作方法。

## 创建和访问列表

<script type="py-editor">
# 创建列表
fruits = ["苹果", "香蕉", "橙子", "葡萄"]

# 访问元素
print(f"第一个水果: {fruits[0]}")
print(f"最后一个水果: {fruits[-1]}")

# 切片操作
print(f"前两个水果: {fruits[:2]}")
</script>

## 列表方法

<script type="py-editor">
# 添加元素
numbers = [1, 2, 3]
numbers.append(4)
numbers.extend([5, 6])
print(f"添加后: {numbers}")

# 删除元素
numbers.remove(3)
print(f"删除 3 后: {numbers}")

# 排序
numbers.sort(reverse=True)
print(f"降序排序: {numbers}")
</script>
```

### 示例 2：NumPy 数据分析

```markdown
# NumPy 数组统计

使用 NumPy 进行基本的统计分析。

## 创建随机数据

<script type="py-editor" config='{"packages": ["numpy"]}'>
import numpy as np

# 设置随机种子，确保结果可重复
np.random.seed(42)

# 生成 100 个正态分布的随机数
data = np.random.normal(loc=100, scale=15, size=100)

print(f"数据点数: {len(data)}")
print(f"前 5 个数据: {data[:5]}")
</script>

## 统计分析

<script type="py-editor" config='{"packages": ["numpy"]}'>
import numpy as np

# 继续使用上面的数据
np.random.seed(42)
data = np.random.normal(loc=100, scale=15, size=100)

# 计算统计量
print("=" * 50)
print("统计摘要：")
print("=" * 50)
print(f"平均值: {np.mean(data):.2f}")
print(f"中位数: {np.median(data):.2f}")
print(f"标准差: {np.std(data):.2f}")
print(f"最小值: {np.min(data):.2f}")
print(f"最大值: {np.max(data):.2f}")
print("=" * 50)
</script>
```

### 示例 3：Pandas 数据处理

```markdown
# Pandas DataFrame 操作

学习使用 Pandas 处理表格数据。

## 创建 DataFrame

<script type="py-editor" config='{"packages": ["pandas", "numpy"]}'>
import pandas as pd
import numpy as np

# 创建学生成绩数据
data = pd.DataFrame({
    "姓名": ["张三", "李四", "王五", "赵六", "钱七"],
    "数学": [85, 92, 78, 95, 88],
    "英语": [90, 85, 92, 88, 91],
    "Python": [88, 94, 85, 90, 92]
})

print("学生成绩表：")
print(data)
</script>

## 数据分析

<script type="py-editor" config='{"packages": ["pandas", "numpy"]}'>
import pandas as pd

# 重新创建数据
data = pd.DataFrame({
    "姓名": ["张三", "李四", "王五", "赵六", "钱七"],
    "数学": [85, 92, 78, 95, 88],
    "英语": [90, 85, 92, 88, 91],
    "Python": [88, 94, 85, 90, 92]
})

# 计算总分和平均分
data["总分"] = data[["数学", "英语", "Python"]].sum(axis=1)
data["平均分"] = data[["数学", "英语", "Python"]].mean(axis=1).round(2)

print("成绩统计：")
print(data)

print("\n" + "=" * 50)
print("各科平均分：")
print(f"数学: {data['数学'].mean():.2f}")
print(f"英语: {data['英语'].mean():.2f}")
print(f"Python: {data['Python'].mean():.2f}")
print("=" * 50)
</script>
```

---

## 常见问题

### Q1: 为什么我的代码没有显示？

**A:** 检查以下几点：

1. 确保使用 `<script type="py-editor">` 标签
2. 不要在 `<script>` 标签内使用 Markdown 代码围栏（\`\`\`）
3. 检查 HTML 标签是否正确闭合

```html
<!-- ✅ 正确 -->
<script type="py-editor">
print("Hello")
</script>

<!-- ❌ 错误：使用了代码围栏 -->
<script type="py-editor">
```python
print("Hello")
```
</script>
```

### Q2: 为什么包导入失败？

**A:** 检查以下几点：

1. 确保 `config` 属性使用**单引号**包裹 JSON
2. 包名必须在双引号内
3. 多个包用逗号分隔

```html
<!-- ✅ 正确 -->
<script type="py-editor" config='{"packages": ["numpy", "pandas"]}'>

<!-- ❌ 错误：使用了双引号包裹 JSON -->
<script type="py-editor" config="{"packages": ["numpy"]}">

<!-- ❌ 错误：包名没有用引号 -->
<script type="py-editor" config='{"packages": [numpy]}'>
```

### Q3: 代码可以跨多个编辑器共享变量吗？

**A:** 默认情况下，每个编辑器都是独立的环境。如果需要共享变量，需要使用 `env` 属性：

```html
<!-- 第一个编辑器：定义变量 -->
<script type="py-editor" env="shared">
x = 100
y = 200
</script>

<!-- 第二个编辑器：使用变量 -->
<script type="py-editor" env="shared">
# 可以访问上面定义的 x 和 y
print(f"x + y = {x + y}")
</script>
```

### Q4: 如何隐藏初始化代码？

**A:** 使用 `setup` 属性：

```html
<!-- 隐藏的初始化代码 -->
<script type="py-editor" env="demo" setup>
import numpy as np
data = np.random.randn(100)
</script>

<!-- 可见的主代码 -->
<script type="py-editor" env="demo">
# data 变量已经准备好
print(f"数据均值: {data.mean():.2f}")
</script>
```

### Q5: 首次加载很慢怎么办？

**A:** 这是正常的。PyScript 需要下载 Python 解释器和包：

- **首次加载**：可能需要 5-10 秒（下载 Pyodide）
- **后续加载**：1-2 秒（使用浏览器缓存）
- **大型包**：如 pandas、matplotlib 会更慢

建议在文档中添加说明：

```markdown
⏱️ **首次加载提示**：首次运行可能需要几秒钟下载 Python 环境，请耐心等待。
```

### Q6: 支持哪些 Python 版本特性？

**A:** PyScript 使用 Pyodide，基于 **Python 3.11**：

✅ **支持：**
- f-strings
- 类型提示
- 异步编程（async/await）
- 上下文管理器（with）
- 装饰器

❌ **不支持：**
- 文件系统操作（open, os.path）
- 多线程/多进程
- 系统命令（subprocess）
- 纯 C 扩展包

---

## 添加新教程到导航

创建新教程后，需要在 `mkdocs.yml` 中添加导航：

```yaml
nav:
  - 首页: index.md
  - 教程:
      - Python 基础: lessons/intro.md
      - Pandas 示例: lessons/pandas_demo.md
      - 你的新教程: lessons/your_tutorial.md  # 添加这里
  - 部署指南: deployment.md
  - 开发指南: dev-guide.md
```

---

## 本地测试

创建或修改文档后，使用以下命令测试：

```bash
# 激活虚拟环境
source .venv/bin/activate

# 启动开发服务器
mkdocs serve

# 访问 http://127.0.0.1:8000/pylearn/
```

---

## 文档模板

使用以下模板快速创建新教程：

```markdown
# 教程标题

简短介绍教程内容。

**学习目标：**
- 目标 1
- 目标 2
- 目标 3

---

## 第一部分：基础知识

解释基本概念...

**示例：**

<script type="py-editor">
# 基础示例代码
print("Hello, World!")
</script>

---

## 第二部分：实践应用

更复杂的示例...

**示例：**

<script type="py-editor" config='{"packages": ["numpy"]}'>
import numpy as np

# 实践代码
arr = np.array([1, 2, 3, 4, 5])
print(f"数组: {arr}")
</script>

---

## 练习

尝试修改上面的代码，完成以下任务：

1. 任务 1
2. 任务 2
3. 任务 3

---

## 小结

总结本教程的关键点...

**下一步：**
- [相关教程 1](./other_tutorial.md)
- [相关教程 2](./another_tutorial.md)
```

---

## 进阶技巧

### 添加用户提示

```markdown
💡 **提示**：将鼠标悬停在编辑器右上角可以看到 Run 按钮。

⚠️ **注意**：首次加载可能需要几秒钟。

✅ **成功**：如果看到输出结果，说明代码运行成功！

❌ **错误**：如果出现红色错误信息，请检查代码语法。
```

### 使用折叠区域（可选）

```markdown
<details>
<summary>点击查看答案</summary>

<script type="py-editor">
# 答案代码
def solution():
    return 42
print(solution())
</script>

</details>
```

---

## 资源链接

- [PyScript 官方文档](https://docs.pyscript.net/)
- [MkDocs 文档](https://www.mkdocs.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [Pyodide 包列表](https://pyodide.org/en/stable/usage/packages-in-pyodide.html)
- [Markdown 语法指南](https://www.markdownguide.org/)

---

## 获取帮助

如果遇到问题：

1. 查看本文档的[常见问题](#常见问题)部分
2. 检查浏览器控制台（F12）的错误信息
3. 参考现有教程的源代码
4. 查阅 PyScript 官方文档

---

**祝你创作愉快！** 🚀
