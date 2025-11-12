# Pandas 数据分析示例

演示在浏览器中运行 Pandas 的基本用法。

**提示**：代码可编辑！修改后点击右上角的 **Run** 按钮运行，或使用 **Ctrl+Enter** (Mac: **Cmd+Enter**) 快捷键。

<script type="py-editor" config='{"packages": ["numpy", "pandas"]}'>
import pandas as pd
import numpy as np

# 设置随机种子以获得可重复的结果
np.random.seed(42)

# 创建 DataFrame
data = pd.DataFrame({
    "姓名": ["张三", "李四", "王五", "赵六"],
    "成绩": np.random.randint(60, 100, 4)
})

print("学生成绩表：")
print(data)

print(f"\n平均分：{data['成绩'].mean():.1f}")
print(f"最高分：{data['成绩'].max()}")
print(f"最低分：{data['成绩'].min()}")

# 找出成绩最高的学生
top_student = data.loc[data['成绩'].idxmax()]
print(f"\n成绩最高的学生：{top_student['姓名']}，分数：{top_student['成绩']}")
</script>
