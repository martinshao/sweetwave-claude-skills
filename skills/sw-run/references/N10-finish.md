# N10: Finish

仅 `ALL_PROJECT_TASKS` 范围在全项目任务完成后进入本节点。

1. 确认当前范围为 `ALL_PROJECT_TASKS`，且全项目不存在未完成任务、
   `[IN_PROGRESS]`、`[VERIFYING]`、`[REVIEWING]` 或 `[BLOCKED]`。
2. 必要时执行 release 级 `/sw-qa-engineer`。
3. 调用 `/sw-doc-sync` 同步 README、CLAUDE.md、LESSONS 和规格文档。
4. 校验文档同步结果，不允许 `sw-doc-sync` 修改三层状态。
5. 由 `/sw-run` 将 `STATUS.md` 写为 `READY_TO_RELEASE`。
6. 将 `RUN_STATE.md` 重置为 `IDLE`，保留最近完成摘要。
7. 输出模块、任务、QA、安全和文档同步总结。

下一步固定建议 `/sw-release {version}`，不得自动发布或部署。

模块范围或单任务范围不得调用本节点，即使它们碰巧完成了项目最后一个任务。
