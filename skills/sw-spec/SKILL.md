---
name: sw-spec
description: 根据 PRD、设计、界面原型和架构文档生成开发规格文档。
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

# SweetWave 开发规格

用户输入：

```txt
$ARGUMENTS
```

## 输入

读取：

- `CLAUDE.md`
- `.wave/MODULE_MAP.md`
- `.wave/specs/{module}/MODULE.md`
- `.wave/specs/{module}/DESIGN.md`
- `.wave/specs/{module}/UI.md`
- `.wave/specs/{module}/ARCH.md`
- MODULE.md 中记录的来源 PRD，例如 `.wave/prd/INIT-PRD.md`

模块选择规则：

- 如果用户传入 `{module}`，只处理 `.wave/specs/{module}/`。
- 如果无参数，遍历 `.wave/MODULE_MAP.md` 中状态为 `planned` 或 `active` 的所有模块。
- 如果模块缺少 `DESIGN.md`、`UI.md` 或 `ARCH.md`，提示先运行对应节点。

## 输出文件

创建或更新：

```txt
.wave/specs/{module}/SPEC.md
```

## 工作流程

1. 把模块 PRD 关联内容、模块设计、界面原型和模块架构转成开发规格。
2. 明确模块功能拆解、模块边界、路由、组件、界面状态、API、数据模型。
3. 明确 loading / empty / error / success 状态。
4. 明确安全、权限、性能和兼容性约束。
5. 明确测试策略。
6. 明确禁止修改范围。
7. 明确开发验收标准。
8. 写入 `.wave/specs/{module}/SPEC.md`。

## DEV_SPEC 结构

```md
# 开发规格文档

## 1. 输入文档

## 2. 功能拆解

## 3. 模块边界

## 4. 路由设计

## 5. 组件设计

## 6. 界面与原型约束

## 7. 状态管理

## 8. API 使用方式

## 9. 数据模型使用方式

## 10. Error / Loading / Empty 状态

## 11. 安全与权限约束

## 12. 性能约束

## 13. 测试策略

## 14. 禁止修改范围

## 15. 验收标准
```

## 规则

- 不要写代码。
- 不要创建任务清单；任务拆解交给 `/sw-task`。
- 开发规格必须足够具体，能够指导 `/sw-work TASK-ID` 执行。
- 只写目标模块规格；跨模块内容写依赖和联调约束。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
