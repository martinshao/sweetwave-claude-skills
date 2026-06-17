---
name: sw-task
description: 根据开发规格文档拆解 SweetWave 可执行任务。
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

# SweetWave 任务拆解

用户输入：

```txt
$ARGUMENTS
```

## 输入

读取：

- `.wave/MODULE_MAP.md`
- `.wave/specs/{module}/MODULE.md`
- `.wave/specs/{module}/UI.md`
- `.wave/specs/{module}/ARCH.md`
- `.wave/specs/{module}/SPEC.md`

模块选择规则：

- 如果用户传入 `{module}`，只处理 `.wave/specs/{module}/`。
- 如果无参数，遍历 `.wave/MODULE_MAP.md` 中状态为 `planned` 或 `active` 的所有模块。
- 如果模块缺少 `SPEC.md`，提示先运行 `/sw-spec {module}`。

## 输出文件

创建或更新：

```txt
.wave/specs/{module}/TASKS.md
```

## 任务格式

每个任务必须使用如下结构：

```md
## TASK-001：<任务标题>

- [ ] TASK-001
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

状态行必须紧跟任务标题，便于 `/sw-run` 解析、编辑和复查。已完成任务不要改写正文，除非用户明确要求。

## 工作流程

1. 将模块 `SPEC.md` 拆解为小型、可执行任务。
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
- 只拆目标模块任务；跨模块事项写成联调或依赖任务。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
