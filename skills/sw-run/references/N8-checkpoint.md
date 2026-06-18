# N8: Checkpoint

仅当实现、验证、审查和所有必需 QA/安全门均通过时执行。

1. 将当前任务状态改为 `[x]`，只改生命周期标记。
2. 重新读取 `TASKS.md`，确认状态落盘。
3. 更新 `STATUS.md` 的模块计数、当前任务、QA 累积和下一任务。
4. 将 `RUN_STATE.md` 写为 `COMPLETED / FINALIZING / N8_CHECKPOINT`。
5. 记录最终验证、审查、QA、安全报告路径。
6. 有长期价值的决策或踩坑追加到 `.wave/LESSONS.md`。

任何证据缺失时不得写 `[x]`。
