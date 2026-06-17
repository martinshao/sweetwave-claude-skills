---
name: sw-spec
description: 根据 PRD、设计和架构文档生成开发规格文档。
argument-hint: >-
  可选：实现约束、模块范围或补充上下文
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

- `docs/sweetwave/01-prd/PRD.md`
- `docs/sweetwave/02-design/*`
- `docs/sweetwave/03-architecture/*`
- `CLAUDE.md`

## 输出文件

创建或更新：

```txt
docs/sweetwave/04-spec/DEV_SPEC.md
```

## 工作流程

1. 把 PRD、设计文档和技术架构转成开发规格。
2. 明确功能拆解、模块边界、路由、组件、状态、API、数据模型。
3. 明确 loading / empty / error / success 状态。
4. 明确安全、权限、性能和兼容性约束。
5. 明确测试策略。
6. 明确禁止修改范围。
7. 明确开发验收标准。

## DEV_SPEC 结构

```md
# 开发规格文档

## 1. 输入文档

## 2. 功能拆解

## 3. 模块边界

## 4. 路由设计

## 5. 组件设计

## 6. 状态管理

## 7. API 使用方式

## 8. 数据模型使用方式

## 9. Error / Loading / Empty 状态

## 10. 安全与权限约束

## 11. 性能约束

## 12. 测试策略

## 13. 禁止修改范围

## 14. 验收标准
```

## 规则

- 不要写代码。
- 不要创建任务清单；任务拆解交给 `/sw-task`。
- 开发规格必须足够具体，能够指导 `/sw-work TASK-ID` 执行。
- 输出语言使用中文。
