---
description: 检查当前项目的 SweetWave 文档进度、git 状态和下一步建议。
disable-model-invocation: true
allowed-tools:
  - Read
  - Glob
  - Bash(git status)
  - Bash(git diff *)
  - Bash(find docs/sweetwave -maxdepth 3 -type f 2>/dev/null | sort)
  - Bash(test *)
---

# SweetWave 状态检查

请检查当前项目的 SweetWave 工作流状态。

## 当前 git 状态

!`git status --short 2>/dev/null || true`

## SweetWave 文档文件

!`find docs/sweetwave -maxdepth 3 -type f 2>/dev/null | sort || true`

## 检查内容

1. 是否已经执行 `/sw-init`。
2. 是否存在 `CLAUDE.md`。
3. 是否存在 `docs/sweetwave` 目录。
4. 检查以下核心产物是否存在且非空：
   - `docs/sweetwave/00-brief/BRIEF.md`
   - `docs/sweetwave/01-prd/PRD.md`
   - `docs/sweetwave/02-design/USER_FLOW.md`
   - `docs/sweetwave/02-design/PAGE_MAP.md`
   - `docs/sweetwave/02-design/INTERACTION.md`
   - `docs/sweetwave/03-architecture/ARCHITECTURE.md`
   - `docs/sweetwave/03-architecture/API_CONTRACT.md`
   - `docs/sweetwave/03-architecture/DATA_MODEL.md`
   - `docs/sweetwave/04-spec/DEV_SPEC.md`
   - `docs/sweetwave/05-task/TASKS.md`
5. 根据当前状态建议下一条 SweetWave 命令。

## 输出格式

```md
# SweetWave 当前状态

## 已完成

## 缺失项

## 风险

## 建议下一步
```
