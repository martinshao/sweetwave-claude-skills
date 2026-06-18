---
name: sw-doc-sync
description: 在 SweetWave 全部任务完成后同步 README、CLAUDE.md、LESSONS 和模块规格，生成发布候选摘要并检查文档一致性。由 /sw-run 的完成节点调用。
disable-model-invocation: true
allowed-tools:
  - Read
  - Write
  - Edit
  - MultiEdit
  - Glob
  - Grep
  - Bash(git diff *)
  - Bash(git status)
---

# SweetWave 文档同步

根据已完成任务和实际代码同步长期文档，不执行发布。

## 工作流程

1. 汇总已完成模块、QA、安全报告和 `.wave/LESSONS.md`。
2. 更新 README 中受影响的架构、功能和运行命令。
3. 更新 `CLAUDE.md` 中长期有效的项目规则和目录信息。
4. 修正规格与代码之间可确认的文档漂移。
5. 将稳定决策补充到 `LESSONS.md`，不写开发流水账。
6. 生成 `.wave/release/RELEASE-CANDIDATE.md`，供 `/sw-release` 使用。
7. 检查命令、路径、接口和文档引用一致性。

## 输出

```md
## 同步结果

- 状态：COMPLETED / BLOCKED
- README：
- CLAUDE.md：
- LESSONS：
- 规格文档：
- 发布候选摘要：
- 一致性检查：
- 剩余风险：
```

不得修改 `.wave/STATUS.md`、`.wave/PLAN_STATE.md`、`.wave/RUN_STATE.md`
或任何 `TASKS.md`；
不得自动提交、部署或发布。
