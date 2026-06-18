# P8: Task

按模块调度计划执行。

1. 要求 MODULE、UI、ARCH、SPEC 为 READY。
2. 将当前节点写为 `P8_TASK`，Tasks 状态写为 `DRAFT`。
3. 调用 `/sw-task-engineer` 创建或更新 `TASKS.md`。
4. 每个任务包含稳定 ID、角色、项目、风险、QA、并行、依赖、范围和验收标准。
5. 每个任务增加 `任务类型`，允许 `scaffold` 或 `feature`，默认 `feature`。
6. `app-shell` 只能生成一个 `APP-SHELL-001`：
   - 任务类型：`scaffold`
   - 执行角色：`frontend-engineer`
   - 风险等级：`medium`
   - QA 策略：`required`
   - 并行策略：`serial`
   - 覆盖应用入口识别、示例代码审计、导航、布局、路由和占位页面。
7. 其他模块的前端页面任务必须依赖 `app-shell/APP-SHELL-001`。
8. 旧任务更新规则：
   - 保留 `[x]` 任务正文和状态。
   - 新增使用 `[NEW]`。
   - 受影响未完成任务使用 `[CHANGED]`。
   - 不再需要的未完成任务使用 `[DROPPED]`。
9. 涉及已完成任务时必须已在 P1 获得用户确认。
10. 校验任务粒度、依赖和验证命令后写为 READY。
11. 记录任务定义指纹，忽略生命周期标记。

`--stage task` 完成目标范围后停止。
