# N8: Checkpoint

仅当实现、验证、审查和所有必需 QA/安全门均通过时执行。

1. 将当前任务状态改为 `[x]`，只改生命周期标记。
2. 重新读取 `TASKS.md`，确认状态落盘。
3. 更新 `STATUS.md` 的模块计数、当前任务、QA 累积和下一任务。
4. 将 `RUN_STATE.md` 写为 `COMPLETED / FINALIZING / N8_CHECKPOINT`。
5. 记录最终验证、审查、QA、安全报告路径。
6. 有长期价值的决策或踩坑追加到 `.wave/LESSONS.md`。
7. 如果当前为 `--stage scaffold`：
   - 将 `STATUS.md` 的前端骨架写为 `READY`，项目阶段恢复为 `READY_TO_RUN`。
   - 下一步写为“用户检查页面骨架后手动执行 `/sw-run --all`”。
   - 将 `RUN_STATE.md` 重置为 `IDLE`，保留骨架完成摘要和最终 Git 基线。
   - 到此停止，不进入 N9/N10，不调度任何普通任务。
8. 非 scaffold 任务进入 N9，由 N9 根据已保存的范围模式决定停止、继续 N2 或进入 N10。

任何证据缺失时不得写 `[x]`。
