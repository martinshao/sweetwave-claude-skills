---
name: sw-ui-design-engineer
description: 根据 SweetWave 产品流程生成模块界面、组件、布局、状态、响应式和原型设计。由 /sw-plan 的 UI 节点调用。
disable-model-invocation: true
allowed-tools:
  - Read
  - Write
  - Edit
  - MultiEdit
  - Glob
  - Grep
  - Bash(mkdir -p *)
---

# SweetWave UI 设计工程师

创建或更新：

```txt
.wave/specs/{module}/UI.md
.wave/specs/{module}/prototype/*（仅明确需要时）
```

## 工作流程

1. 读取 MODULE、DESIGN、来源 PRD 和项目现有设计系统线索。
2. 定义页面、信息架构、布局、视觉层级、组件、表单和反馈状态。
3. 覆盖响应式、可访问性和 loading/empty/error/success。
4. 默认生成文档化原型；用户明确要求时才生成静态 HTML 原型。
5. 外部 Figma/Stitch 链接只作为来源引用，不主动调用外部 MCP。
6. 不编造品牌规范；缺失信息写为假设。
7. 不写技术架构或任务。
8. 不修改 `.wave/PLAN_STATE.md`、`.wave/STATUS.md`、`.wave/RUN_STATE.md`。

## 输出

```md
## 执行结果

- 角色：ui-design-engineer
- 状态：COMPLETED / BLOCKED
- 输入物料：
- 输出文件：
- 覆盖需求：
- 假设：
- 待确认问题：
- 下游影响：
- 建议下一节点：P6_ARCHITECTURE / BLOCKED
```
