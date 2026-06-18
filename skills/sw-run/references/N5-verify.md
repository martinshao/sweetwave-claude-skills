# N5: Verify

1. 确认任务处于 `[VERIFYING]`，检查点属于同一任务。
2. 将当前节点写为 `N5_VERIFY`。
3. 按任务验收标准和验证命令执行最小相关 typecheck、lint、test、build。
   scaffold 任务至少执行目标前端项目可用的 typecheck、lint 和 build；命令不存在时
   记录缺失原因，不得伪造通过结果。
4. 更新模块 `TEST_REPORT.md`，并把命令、结果和失败摘要写入 `RUN_STATE.md`。
5. 原范围内可修复的问题返回 N4；需扩大范围或人工确认时写为 `[BLOCKED]`。
6. 通过后将任务写为 `[REVIEWING]`，下一节点设为 N6。

`--stage verify` 在写入 `[REVIEWING]` 后停止，恢复命令为：

```txt
/sw-run {module} {TASK-ID} --stage review
```
