# N1: Restore

读取 `CLAUDE.md`、`.wave/STATUS.md`、`.wave/RUN_STATE.md`、`.wave/LESSONS.md`、
`.wave/PLAN_STATE.md`、`.wave/PLAN_REPORT.md`、`.wave/TRACEABILITY.md`、
`.wave/MODULE_MAP.md` 和目标模块规格。

1. 确认 STATUS 阶段为 `READY_TO_RUN` 或已有活动 RUN_STATE。
2. 新任务启动前，要求 PLAN_REPORT 为 `PASSED` 且 PLAN_STATE 已完成 P10。
3. 如果规划物料为 STALE、质量门未通过或追踪矩阵存在阻塞，拒绝执行并建议
   `/sw-plan --resume`。
4. 解析 module、TASK-ID、`--all` 和 `--stage`，并归一化执行范围：
   - 无 module、无 TASK-ID、无 `--all`：`NEXT_PROJECT_TASK`
   - 只有 module：`NEXT_MODULE_TASK`
   - TASK-ID（可带 module）：`SINGLE_TASK`
   - module + `--all`：`ALL_MODULE_TASKS`
   - 只有 `--all`：`ALL_PROJECT_TASKS`
   - `--stage scaffold`：`SCAFFOLD_ONLY`
   TASK-ID 未带 module 时必须在全部 TASKS 中唯一匹配，否则阻塞并要求补充 module。
5. 读取 `STATUS.md` 的前端骨架状态：
   - `--stage scaffold` 只接受 `PENDING`、`BLOCKED` 或同任务活动检查点。
   - `STALE` 时拒绝沿用旧骨架，建议 `/sw-plan --change` 刷新物料后重新执行。
   - 普通运行只接受 `NOT_REQUIRED` 或 `READY`；其他状态建议 `/sw-scaffold`。
   - `READY` 时普通调度跳过已完成的 `APP-SHELL-001`。
6. 检查当前 Git commit、工作区状态和检查点基准提交。
7. 比较 MODULE、DESIGN、UI、ARCH、SPEC 和任务定义指纹；TASKS 比较忽略生命周期标记。
8. 活动检查点优先于新任务，并沿用 `RUN_STATE.md` 已保存的范围模式、目标模块和
   目标任务。显式切换任务或扩大、缩小范围时先暂停确认。
   如果活动检查点位于 N4 或更晚节点，且任务角色不是 `generic`，必须校验：
   - 已解析角色与任务定义或已记录推断一致；
   - 目标 Engineer Agent 和 handoff 路径已记录；
   - 派发状态为 `RESULT_VALIDATED`；
   - Engineer 返回角色与解析角色一致；
   - handoff 文件存在，且返回的修改文件和结果摘要已落盘。
   任一项缺失都不得直接恢复 N4：尚无无法归属的业务改动时退回 N3 重新派发；
   已出现无派发凭证的业务改动时写为 `[BLOCKED]`，报告越权文件并等待处理。
9. 物料变化时停止工程执行；涉及 scaffold 时将前端骨架写为 `STALE`，并建议返回
   `/sw-plan --change`；
   不由 `/sw-run` 重写规划文档。
10. 无法归属当前任务的工作区改动必须阻塞。
11. 将 `RUN_STATE.md` 当前节点写为 `N1_RESTORE`，记录范围模式、目标模块、
    目标任务和恢复判断。

输出：有效检查点、可执行范围、风险和下一节点。
