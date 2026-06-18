# N1: Restore

读取 `CLAUDE.md`、`.wave/STATUS.md`、`.wave/RUN_STATE.md`、`.wave/LESSONS.md`、
`.wave/MODULE_MAP.md` 和目标模块规格。

1. 解析 module、TASK-ID、`--all` 和 `--stage`。
2. 检查当前 Git commit、工作区状态和检查点基准提交。
3. 比较 MODULE、DESIGN、UI、ARCH、SPEC 和任务定义指纹；TASKS 比较忽略生命周期标记。
4. 活动检查点优先于新任务。显式切换任务时先暂停确认。
5. 物料变化时将任务视为 `CHANGED`，清除过期质量门结果，回到计划阶段。
6. 无法归属当前任务的工作区改动必须阻塞。
7. 如果所有 planned/active 模块都有可执行 `TASKS.md`，且没有活动检查点，
   将 `STATUS.md` 写为 `READY_TO_RUN`，记录物料指纹和下一步。
8. 将 `RUN_STATE.md` 当前节点写为 `N1_RESTORE`，记录恢复判断。

输出：有效检查点、可执行范围、风险和下一节点。
