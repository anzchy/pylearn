# 欢迎来到 PyLearn Demo 🎓

本网站演示了如何用 **MkDocs + PyScript** 构建交互式 Python 教学平台。

支持：
- ✅ Markdown + 数学公式（如 $E=mc^2$）
- ✅ 可运行的 Python 代码
- ✅ Pandas / NumPy / Matplotlib

---

点击右上角的 **Run** 按钮运行代码，或使用快捷键 **Ctrl+Enter** (Mac: **Cmd+Enter**) 👇

<script type="py-editor" config='{"packages": ["numpy"]}'>
import numpy as np

# 创建一个3x3矩阵
a = np.arange(9).reshape(3,3)
print("矩阵 A:")
print(a)
print("A 的转置:")
print(a.T)

# 计算一些基本统计信息
print(f"矩阵元素总和: {a.sum()}")
print(f"矩阵平均值: {a.mean():.2f}")
</script>
