# P1: Restore

读取 `CLAUDE.md`、`.wave/STATUS.md`、`.wave/PLAN_STATE.md`、
`.wave/RUN_STATE.md`、`.wave/LESSONS.md`、Idea、Brief、PRD、MODULE_MAP
和目标模块产物。

1. 解析 scope、module、stage、from、resume、all 和 change。
2. RUN_STATE 为 RUNNING、PAUSED 或 BLOCKED 时停止规划，报告当前工程恢复命令；
   不允许规划与工程执行同时修改同一物料链。
3. 活动 PLAN_STATE 优先恢复；显式切换 scope/module 时先确认。
4. 计算 PRD、MODULE、DESIGN、UI、ARCH、SPEC、TASKS 任务定义指纹。
5. 根据来源关系比较基线，识别真实变化并传播 STALE：
   - PRD → Map、Module、Design、UI、Arch、Spec、Tasks
   - Module → Design、UI、Arch、Spec、Tasks
   - Design → UI、Arch、Spec、Tasks
   - UI → Arch、Spec、Tasks
   - Arch → Spec、Tasks
   - Spec → Tasks
6. 只标记受影响模块；无关模块保持 READY。
7. 如果受影响 TASKS 含 `[x]`，或 Git 显示已有相关实现，写影响清单并进入
   `PAUSED / NEEDS_CONFIRMATION`，不得自动重写。
8. 如果变化影响页面地图、全局导航、路由或 `app-shell` 物料，同时将前端骨架标记为
   `STALE`，不得沿用旧骨架验证结果。
9. 未完成下游产物可进入自动重生成计划。
10. 将当前节点写为 `P1_RESTORE`，保存调度与恢复判断。

输出：有效检查点、STALE 清单、暂停原因、可执行范围和下一节点。
