# N4: Implement

1. 将任务写为 `[IN_PROGRESS]`，`STATUS.md` 写为 `RUNNING`。
2. 将 `RUN_STATE.md` 写为 `RUNNING / IMPLEMENTING / N4_IMPLEMENT`。
3. 非 `generic` 任务向选中的 Engineer Skill 传入模块、任务正文、规格路径、
   允许与禁止范围、Git 基线。
4. `generic` 任务由 `/sw-run` 按同一边界直接实现，并生成相同结构的“执行结果”。
5. Engineer Skill 必须返回统一“执行结果”；不得写三层状态。
6. 校验返回的修改文件均在允许范围内，并记录到 `RUN_STATE.md`。
7. `BLOCKED` 时同步任务和项目阻塞状态，保存恢复命令。
8. `COMPLETED` 时将任务写为 `[VERIFYING]`，下一节点设为 N5。

`--stage implement` 在写入 `[VERIFYING]` 后停止，恢复命令为：

```txt
/sw-run {module} {TASK-ID} --stage verify
```
