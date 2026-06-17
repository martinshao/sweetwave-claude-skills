---
description: 根据开发规格文档拆解 SweetWave 可执行任务。
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

### 目标

### 输入文档

### 允许修改范围

### 禁止修改范围

### 实现说明

### 验收标准

- [ ] 

### 验证命令

```bash
```

### 风险点
```

## 工作流程

1. 将 `DEV_SPEC.md` 拆解为小型、可执行任务。
2. 按依赖顺序排列任务。
3. 每个任务都应能在一次聚焦的 `/sw-work` 会话中完成。
4. 避免一个任务横跨多个无关模块。
5. 尽量让每个任务可以独立验证。

## 规则

- 不要写代码。
- 不要创建过大的任务。
- 不要把无关关注点混进同一个任务。
- 必须写出验证命令；如果暂时未知，标记为 TODO。
- 输出语言使用中文。
