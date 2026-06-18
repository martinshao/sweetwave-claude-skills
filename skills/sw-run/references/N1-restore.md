# N1: Restore

读取 `CLAUDE.md`、`.wave/STATUS.md`、`.wave/RUN_STATE.md`、`.wave/LESSONS.md`、
`.wave/PLAN_STATE.md`、`.wave/PLAN_REPORT.md`、`.wave/TRACEABILITY.md`、
`.wave/MODULE_MAP.md` 和目标模块规格。

1. 确认 STATUS 阶段为 `READY_TO_RUN` 或已有活动 RUN_STATE。
2. 新任务启动前，要求 PLAN_REPORT 为 `PASSED` 且 PLAN_STATE 已完成 P10。
3. 如果规划物料为 STALE、质量门未通过或追踪矩阵存在阻塞，拒绝执行并建议
   `/sw-plan --resume`。
4. 解析 module、TASK-ID、`--all` 和 `--stage`。
5. 检查当前 Git commit、工作区状态和检查点基准提交。
6. 比较 MODULE、DESIGN、UI、ARCH、SPEC 和任务定义指纹；TASKS 比较忽略生命周期标记。
7. 活动检查点优先于新任务。显式切换任务时先暂停确认。
8. 物料变化时停止工程执行，将影响写为 STALE，并建议返回 `/sw-plan --change`；
   不由 `/sw-run` 重写规划文档。
9. 无法归属当前任务的工作区改动必须阻塞。
10. 将 `RUN_STATE.md` 当前节点写为 `N1_RESTORE`，记录恢复判断。

输出：有效检查点、可执行范围、风险和下一节点。
