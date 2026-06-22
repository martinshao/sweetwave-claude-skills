# N2: Schedule

选择下一个依赖已满足的任务，并生成串行调度计划。

1. 跳过 `[x]` 和 `[DROPPED]`。
2. 先按 `RUN_STATE.md` 的范围模式过滤候选：
   - `NEXT_PROJECT_TASK`：全项目候选中只选择一个任务。
   - `NEXT_MODULE_TASK`：只在目标模块选择一个任务。
   - `SINGLE_TASK`：只允许选择目标 module + TASK-ID。
   - `ALL_MODULE_TASKS`：只在目标模块持续选择任务。
   - `ALL_PROJECT_TASKS`：可跨模块持续选择任务。
   - `SCAFFOLD_ONLY`：只允许 `app-shell/APP-SHELL-001`。
   范围外任务不得进入当前串行组、并行候选或“下一任务”。
3. `--stage scaffold` 只能选择 `app-shell/APP-SHELL-001`，并要求任务类型为
   `scaffold`、角色为 `frontend-engineer`；缺失、重复或元数据不符时阻塞。
4. 普通运行不得选择 scaffold 任务；其依赖未完成时阻塞并建议 `/sw-scaffold`。
5. 优先恢复范围内的 `[IN_PROGRESS]`、`[VERIFYING]`、`[REVIEWING]`、`[BLOCKED]`。
6. 新任务按模块依赖、任务依赖和文档顺序选择。
7. 如果范围内任务依赖范围外未完成任务，阻塞并报告依赖，不得自动扩大范围。
8. 分析修改范围、共享 API/Schema、数据库对象和涉及项目。
9. 仅当无依赖、无范围交集、无共享契约时标记为并行候选；仍然串行执行。
10. 将范围内串行组、并行候选及冲突原因写入 `RUN_STATE.md` 的调度计划。
11. 将当前节点写为 `N2_SCHEDULE`。
12. 范围内没有候选时：
    - `SINGLE_TASK` 的目标为 `[x]` 或 `[DROPPED]`：报告无需执行并停止。
    - `NEXT_PROJECT_TASK` 或 `NEXT_MODULE_TASK`：报告当前范围没有可执行任务并停止。
    - `ALL_MODULE_TASKS` 或 `ALL_PROJECT_TASKS`：进入 N9 做范围完成判断；
      只有 `ALL_PROJECT_TASKS` 可以随后进入 N10。
    - 存在 `[BLOCKED]` 或未满足依赖：按阻塞处理，不得伪装为范围完成。

输出：当前任务、后续串行组、并行候选和选择理由。
