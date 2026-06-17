---
name: sw-design
description: 根据 PRD 生成用户流程、页面地图和交互说明。
argument-hint: >-
  可选：module-id；无参数时处理 MODULE_MAP 中所有 planned/active 模块
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

- `.wave/MODULE_MAP.md`
- `.wave/specs/{module}/MODULE.md`
- MODULE.md 中记录的来源 PRD，例如 `.wave/prd/INIT-PRD.md`
- 如有必要，读取 `.wave/brief/*.md`

模块选择规则：

- 如果用户传入 `{module}`，只处理 `.wave/specs/{module}/`。
- 如果无参数，遍历 `.wave/MODULE_MAP.md` 中状态为 `planned` 或 `active` 的所有模块。
- 如果模块不存在，提示先运行 `/sw-map`。

## 输出文件

创建或更新：

```txt
.wave/specs/{module}/DESIGN.md
```

## 工作流程

1. 从模块 `MODULE.md` 和来源 PRD 中提取该模块相关用户场景。
2. 设计模块内主流程、分支流程、异常流程。
3. 设计模块页面地图：页面、路由、目标、核心组件、核心状态。
4. 设计模块交互说明：
   - loading
   - empty
   - error
   - success
   - validation
   - responsive behavior
5. 标注模块 UX 风险、跨模块交互依赖和待确认设计问题。
6. 写入 `.wave/specs/{module}/DESIGN.md`。
7. 建议下一步运行 `/sw-ui {module}`，将产品交互设计转成界面与原型设计。

## 规则

- 不要写代码。
- 不要超出 MVP 过度设计。
- PRD 中每个核心功能都应映射到至少一个页面、流程或交互状态。
- 只写目标模块的设计内容；跨模块内容写为依赖，不要展开实现。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
