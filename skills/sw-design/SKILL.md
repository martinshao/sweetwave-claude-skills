---
description: 根据 PRD 生成用户流程、页面地图和交互说明。
disable-model-invocation: true
allowed-tools:
  - Read
  - Write
  - Edit
  - MultiEdit
  - Glob
  - Grep
  - Bash(git status)
  - Bash(git diff *)
  - Bash(ls *)
  - Bash(find *)
  - Bash(mkdir -p *)
  - Bash(test *)
---

# SweetWave 产品设计

用户输入：

```txt
$ARGUMENTS
```

## 输入

读取：

- `docs/sweetwave/01-prd/PRD.md`
- 如有必要，读取 `docs/sweetwave/00-brief/BRIEF.md`

## 输出文件

创建或更新：

```txt
docs/sweetwave/02-design/USER_FLOW.md
docs/sweetwave/02-design/PAGE_MAP.md
docs/sweetwave/02-design/INTERACTION.md
```

## 工作流程

1. 从 PRD 中提取核心用户场景。
2. 设计主流程、分支流程、异常流程。
3. 设计页面地图：页面、路由、目标、核心组件、核心状态。
4. 设计交互说明：
   - loading
   - empty
   - error
   - success
   - validation
   - responsive behavior
5. 标注 UX 风险和待确认设计问题。

## 规则

- 不要写代码。
- 不要超出 MVP 过度设计。
- PRD 中每个核心功能都应映射到至少一个页面、流程或交互状态。
- 输出语言使用中文。
