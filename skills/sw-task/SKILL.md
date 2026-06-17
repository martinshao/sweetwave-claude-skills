---
name: sw-task
description: 根据开发规格文档拆解 SweetWave 可执行任务。
argument-hint: >-
  可选：任务拆分范围、优先级或交付约束
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

# SweetWave 任务拆解

用户输入：

```txt
$ARGUMENTS
```

## 输入

读取：

- `docs/sweetwave/04-spec/DEV_SPEC.md`
- `docs/sweetwave/01-prd/PRD.md`
- `docs/sweetwave/03-architecture/*`

## 输出文件

创建或更新：

```txt
docs/sweetwave/05-task/TASKS.md
```

## 任务格式

每个任务必须使用如下结构：

```md
## TASK-001：<任务标题>

状态：- [ ] TASK-001
预估：30min
依赖：无
涉及范围：app/**, tests/**

### 目标

### 输入文档

### 允许修改范围

### 禁止修改范围

### 实现说明

### 验收标准

- [ ] [AC-001] 

### 验证命令

```bash
```

### 风险点
```

## 状态标记

任务状态必须能被 `/sw-run` 断点恢复：

```md
- [ ] TASK-001：待执行
- [x] TASK-001：已完成
- [NEW] TASK-001：需求变更新增
- [CHANGED] TASK-001：需求变更影响，按更新后描述执行
- [DROPPED] TASK-001：需求变更废弃，跳过
```

状态行必须靠近任务标题，便于编辑和复查。已完成任务不要改写正文，除非用户明确要求。

## 工作流程

1. 将 `DEV_SPEC.md` 拆解为小型、可执行任务。
2. 按依赖顺序排列任务。
3. 每个任务都应能在一次聚焦的 `/sw-work` 会话中完成。
4. 避免一个任务横跨多个无关模块。
5. 尽量让每个任务可以独立验证。
6. 为每个任务标注预估时间、依赖关系和涉及范围。
7. 如果任务之间无依赖但会修改同一文件或同一模块，仍按串行排列。

## 规则

- 不要写代码。
- 不要创建过大的任务。
- 不要把无关关注点混进同一个任务。
- 必须写出验证命令；如果暂时未知，标记为 TODO。
- 每个任务必须有稳定 ID、状态标记、依赖关系、涉及范围和验收标准。
- 单个任务建议控制在 5min / 15min / 30min / 1h 粒度。
- 输出语言使用中文。
