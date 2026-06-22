# N4: Implement

1. 将 `RUN_STATE.md` 当前节点写为 `N4_IMPLEMENT`。
2. 非 `generic` 任务只接受 N3 已落盘且状态为 `RESULT_VALIDATED` 的派发凭证。
   `/sw-run` 在本节点只能复核 Engineer 返回结果和写三层状态，不得使用 Write、Edit、
   MultiEdit 或 Bash 写入业务文件来代替 Engineer 实现。
3. 非 `generic` 任务缺少有效派发凭证时：
   - 尚无越权业务改动：退回 N3 调用目标 Engineer Skill；
   - 已有无法由 Engineer 返回清单解释的业务改动：写为 `[BLOCKED]`。
4. `generic` 任务必须已有 `DIRECT_GENERIC` 凭证；进入实现前将任务写为
   `[IN_PROGRESS]`、`STATUS.md` 写为 `RUNNING`、阶段写为 `IMPLEMENTING`。
   此时才允许 `/sw-run` 按任务边界直接实现，并生成与 Engineer Skill 相同结构的
   “执行结果”。
5. 对执行结果再次校验角色、状态、修改范围和 Git diff；记录最终修改文件。
6. `BLOCKED` 时同步任务和项目阻塞状态，保存恢复命令。
   scaffold 任务同时将前端骨架写为 `BLOCKED`。
7. `COMPLETED` 时将任务写为 `[VERIFYING]`，下一节点设为 N5。

`--stage implement` 在写入 `[VERIFYING]` 后停止，恢复命令为：

```txt
/sw-run {module} {TASK-ID} --stage verify
```
