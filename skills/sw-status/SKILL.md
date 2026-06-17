---
name: sw-status
description: 检查当前项目的 SweetWave 文档进度、git 状态和下一步建议。
disable-model-invocation: true
allowed-tools:
  - Read
  - Glob
  - Bash(git status)
  - Bash(git diff *)
  - Bash(find .wave -maxdepth 4 -type f 2>/dev/null | sort)
  - Bash(test *)
  - Bash(grep -R -n "^- \\[\\|^状态：" .wave/specs 2>/dev/null)
---

# SweetWave 状态检查

请检查当前项目的 SweetWave 工作流状态。

## 当前 git 状态

!`git status --short 2>/dev/null || true`

## SweetWave 文档文件

!`find .wave -maxdepth 4 -type f 2>/dev/null | sort || true`

## SweetWave 任务状态

!`grep -R -n "^- \\[\|^状态：" .wave/specs 2>/dev/null || true`

## 检查内容

1. 是否已经执行 `/sw-init`。
2. 是否存在 `CLAUDE.md`。
3. 是否存在 `.wave` 目录。
4. 检查以下核心产物是否存在且非空：
   - `.wave/LESSONS.md`
   - `.wave/STATUS.md`
   - `.wave/MODULE_MAP.md`
   - `.wave/brief/*.md`
   - `.wave/prd/*-PRD.md`
   - `.wave/specs/{module}/MODULE.md`
   - `.wave/specs/{module}/DESIGN.md`
   - `.wave/specs/{module}/UI.md`
   - `.wave/specs/{module}/ARCH.md`
   - `.wave/specs/{module}/SPEC.md`
   - `.wave/specs/{module}/TASKS.md`
5. 根据当前状态建议下一条 SweetWave 命令。
6. 如果模块 `TASKS.md` 已存在，按模块统计：
   - 已完成任务 `[x]`
   - 待执行任务 `[ ]`
   - 新增任务 `[NEW]`
   - 变更任务 `[CHANGED]`
   - 废弃任务 `[DROPPED]`
7. 如果存在未完成任务，建议用户选择：
   - 手动推进：`/sw-work TASK-ID`
   - 状态机推进：`/sw-run {module} TASK-ID` 或 `/sw-run --all`

## 输出格式

```md
# SweetWave 当前状态

## 已完成

## 缺失项

## 风险

## 建议下一步
```
