---
name: sw-status
description: 检查当前项目的 SweetWave 文档进度、git 状态和下一步建议。
disable-model-invocation: true
allowed-tools:
  - Read
  - Glob
  - Bash(git status)
  - Bash(git diff *)
  - Bash(git rev-parse *)
  - Bash(shasum *)
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
   - `.wave/PLAN_STATE.md`
   - `.wave/RUN_STATE.md`
   - `.wave/MODULE_MAP.md`
   - `.wave/TRACEABILITY.md`
   - `.wave/PLAN_REPORT.md`
   - `.wave/idea/*-IDEA.md`
   - `.wave/brief/*.md`
   - `.wave/prd/*-PRD.md`
   - `.wave/specs/{module}/MODULE.md`
   - `.wave/specs/{module}/DESIGN.md`
   - `.wave/specs/{module}/UI.md`
   - `.wave/specs/{module}/ARCH.md`
   - `.wave/specs/{module}/SPEC.md`
   - `.wave/specs/{module}/TASKS.md`
   对 IDEA 文件不能只检查文件大小：忽略标题、空行和 HTML 注释后没有正文时，
   状态应为“待填写”，下一步应提示用户填写 IDEA，而不是执行 `/sw-brief`。
5. 读取 `.wave/STATUS.md`、`.wave/PLAN_STATE.md` 和 `.wave/RUN_STATE.md`：
   - PLAN_STATE 为 RUNNING/PAUSED/BLOCKED 时，优先建议规划恢复命令。
   - RUN_STATE 为 RUNNING/PAUSED/BLOCKED 时，优先建议执行恢复命令。
   - 两者同时活动时报告状态冲突，不自动选择或覆盖。
6. 检查规划状态一致性：
   - 当前节点必须是 P1–P10，并与产物状态和恢复命令一致。
   - MODULE_MAP 文档状态必须与实际文件存在性一致。
   - PLAN_REPORT 只有 PASSED 才允许 STATUS 为 READY_TO_RUN。
   - TRACEABILITY 中不能存在影响交接的未覆盖需求或断裂引用。
   - 物料指纹变化时报告 STALE，并建议 `/sw-plan --resume`。
7. 检查执行状态一致性：
   - 活动检查点的模块和任务必须存在。
   - `RUN_STATE.md` 阶段必须与 `TASKS.md` 生命周期匹配。
   - 当前节点必须是 N1–N10，并与阶段和恢复命令一致。
   - `STATUS.md` 的当前任务、模块计数和下一步命令必须可解释。
   - 物料指纹变化时报告为 `STALE`，并建议重新规划或重新运行 `/sw-task`。
   - 比较 `TASKS.md` 时忽略生命周期状态行的标记变化，只检查任务定义是否变化。
   - 前端骨架 PENDING/BLOCKED/STALE 时，普通任务不得启动。
   - 前端骨架 READY 时，`app-shell/APP-SHELL-001` 必须为 `[x]` 且有验证证据。
8. 根据当前状态建议下一条 SweetWave 命令：
   - 文档未通过质量门：`/sw-plan` 或 PLAN_STATE 恢复命令。
   - READY_TO_RUN + 前端骨架 PENDING/BLOCKED：`/sw-scaffold`。
   - READY_TO_RUN + 前端骨架 STALE：`/sw-plan --change`。
   - READY_TO_RUN + 前端骨架 READY/NOT_REQUIRED：`/sw-run --all`。
   - 活动执行检查点：RUN_STATE 恢复命令。
   - 恢复命令必须保留 RUN_STATE 中的范围模式、目标模块和目标任务。
9. 如果模块 `TASKS.md` 已存在，按模块统计：
   - 已完成任务 `[x]`
   - 待执行任务 `[ ]`
   - 实现中任务 `[IN_PROGRESS]`
   - 验证中任务 `[VERIFYING]`
   - 审查中任务 `[REVIEWING]`
   - 阻塞任务 `[BLOCKED]`
   - 新增任务 `[NEW]`
   - 变更任务 `[CHANGED]`
   - 废弃任务 `[DROPPED]`
   - 当前执行角色、风险等级和 QA 策略
   - 距离上次完整 QA 的完成任务数
10. 如果存在未完成任务且没有活动检查点，建议：
   - 下一个全项目任务：`/sw-run`
   - 下一个模块任务：`/sw-run {module}`
   - 指定任务：`/sw-run {module} TASK-ID`
   - 完成指定模块：`/sw-run {module} --all`
   - 完成全项目：`/sw-run --all`
   - 单阶段推进：`/sw-run {module} TASK-ID --stage implement|verify|review|qa`
   - 前端骨架：`/sw-scaffold` 或 `/sw-run --stage scaffold`
11. 检查 `.wave/qa/`、`.wave/security/` 报告和文档同步状态。

## 输出格式

```md
# SweetWave 当前状态

## 已完成

## 缺失项

## 风险

## 建议下一步

## 规划现场

## 恢复现场
```
