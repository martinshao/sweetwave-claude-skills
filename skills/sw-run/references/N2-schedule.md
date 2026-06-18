# N2: Schedule

选择下一个依赖已满足的任务，并生成串行调度计划。

1. 跳过 `[x]` 和 `[DROPPED]`。
2. `--stage scaffold` 只能选择 `app-shell/APP-SHELL-001`，并要求任务类型为
   `scaffold`、角色为 `frontend-engineer`；缺失、重复或元数据不符时阻塞。
3. 普通运行不得选择 scaffold 任务；其依赖未完成时阻塞并建议 `/sw-scaffold`。
4. 优先恢复 `[IN_PROGRESS]`、`[VERIFYING]`、`[REVIEWING]`、`[BLOCKED]`。
5. 新任务按模块依赖、任务依赖和文档顺序选择。
6. 分析修改范围、共享 API/Schema、数据库对象和涉及项目。
7. 仅当无依赖、无范围交集、无共享契约时标记为并行候选；仍然串行执行。
8. 将串行组、并行候选及冲突原因写入 `RUN_STATE.md` 的调度计划。
9. 将当前节点写为 `N2_SCHEDULE`。

输出：当前任务、后续串行组、并行候选和选择理由。
