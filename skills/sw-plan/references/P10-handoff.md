# P10: Handoff

仅当 `.wave/PLAN_REPORT.md` 结论为 `PASSED` 时执行。

1. 将当前节点写为 `P10_HANDOFF`。
2. 确认所有 planned/active 模块文档状态为 READY。
3. 更新 `.wave/STATUS.md`：
   - 阶段：`READY_TO_RUN`
   - 当前 PRD、模块数、任务总数和物料指纹
   - 下一步：`等待用户手动执行 /sw-run --all`
4. 更新 `.wave/PLAN_STATE.md`：
   - 状态：`COMPLETED`
   - 当前节点：`P10_HANDOFF`
   - 保留最近规划摘要和质量报告路径
5. 将 `.wave/RUN_STATE.md` 保持或重置为 `IDLE`；存在活动运行现场时不得覆盖。
6. 输出 PRD、模块、规格、任务和质量门摘要。
7. 明确宣布 `/sw-plan` 已结束，并展示可供用户选择的手动命令：
   - 全部任务：`/sw-run --all`
   - 指定模块：`/sw-run {module} --all`
   - 指定任务：`/sw-run {module} TASK-ID`

到此必须结束当前调用。不得自动调用或模拟调用 `/sw-run`，不得自动继续工程节点，
不得提交、部署或发布。
