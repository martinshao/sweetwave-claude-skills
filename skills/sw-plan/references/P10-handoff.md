# P10: Handoff

仅当 `.wave/PLAN_REPORT.md` 结论为 `PASSED` 时执行。

1. 将当前节点写为 `P10_HANDOFF`。
2. 确认所有 planned/active 模块文档状态为 READY。
3. 更新 `.wave/STATUS.md`：
   - 阶段：`READY_TO_RUN`
   - 当前 PRD、模块数、任务总数和物料指纹
   - 下一步：`/sw-run --all`
4. 更新 `.wave/PLAN_STATE.md`：
   - 状态：`COMPLETED`
   - 当前节点：`P10_HANDOFF`
   - 保留最近规划摘要和质量报告路径
5. 将 `.wave/RUN_STATE.md` 保持或重置为 `IDLE`；存在活动运行现场时不得覆盖。
6. 输出 PRD、模块、规格、任务和质量门摘要。

不得自动调用 `/sw-run`、提交、部署或发布。
