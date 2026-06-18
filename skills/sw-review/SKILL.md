---
name: sw-review
description: 审查当前 git diff 是否满足 SweetWave 文档、任务和工程质量要求。
argument-hint: >-
  可选：module-id、任务 ID、审查重点或风险关注点
disable-model-invocation: true
allowed-tools:
  - Read
  - Write
  - Edit
  - MultiEdit
  - Glob
  - Grep
  - Bash(git status)
  - Bash(git diff *)
  - Bash(git log *)
  - Bash(git rev-parse *)
  - Bash(shasum *)
---

# SweetWave 代码审查

用户输入：

```txt
$ARGUMENTS
```

## 输入

读取：

- 当前 git diff
- `CLAUDE.md`
- `.wave/MODULE_MAP.md`
- `.wave/specs/{module}/MODULE.md`
- `.wave/specs/{module}/UI.md`
- `.wave/specs/{module}/SPEC.md`
- `.wave/specs/{module}/TASKS.md`
- `.wave/specs/{module}/TEST_REPORT.md`，如果存在
- `.wave/STATUS.md`
- `.wave/RUN_STATE.md`

## 当前 git diff

!`git diff --stat HEAD`

## 检查点协议

1. 如果指定任务，确认 `RUN_STATE.md` 指向同一模块和任务。
2. 确认任务处于 `[REVIEWING]`，且 `TEST_REPORT.md` 的质量门为 `PASSED`。
3. 将检查点写为 `RUNNING / REVIEWING`，保留基准提交、物料基线和修改文件。
4. 如果物料或 Git 现场与检查点不一致，暂停审查并写为 `[BLOCKED]`。

## 审查维度

1. 是否满足相关任务的验收标准。
2. 是否符合 PRD、界面原型和开发规格。
3. 是否有无关文件或无关逻辑修改。
4. 是否破坏架构边界。
5. 是否有类型安全问题。
6. 是否有错误处理缺失。
7. 是否漏掉 `UI.md` 中要求的 loading / empty / error / success 状态。
8. 是否有测试覆盖缺口。
9. 是否有安全风险或敏感信息风险。
10. 是否需要补充文档或 changelog。
11. 是否可以通过质量门并标记任务完成。

## 状态写回

- `BLOCKED`：任务写为 `[BLOCKED]`，`RUN_STATE.md` 和 `STATUS.md` 记录 Must Fix、
  风险及恢复命令。
- `PASSED`：任务写为 `[x]`；`RUN_STATE.md` 写为 `COMPLETED / FINALIZING`；
  更新 `STATUS.md` 的模块计数和下一任务。
- 所有可执行任务完成时，将 `STATUS.md` 阶段写为 `READY_TO_RELEASE`，下一步写为
  `/sw-release`。
- 只允许修改 SweetWave 状态文档，不因审查结论直接修改业务代码。

## 输出格式

```md
# SweetWave Review

## 结论

- 建议：通过 / 有条件通过 / 不建议通过
- 质量门：PASSED / BLOCKED

## Must Fix

## Should Fix

## Optional

## 无关改动

## 测试与验证缺口

## 安全与发布风险

## 建议下一步
```

## 规则

- 默认只审查，不直接修改代码。
- 不要纠结纯主观命名偏好。
- 优先关注 correctness、架构边界、测试、风险。
- Must Fix 未清零时，质量门必须是 `BLOCKED`。
- 质量门未通过时，不要建议把任务标记为 `[x]`。
- 没有有效的验证通过证据时，不得写入 `[x]`。
- 状态写回后重新读取 `TASKS.md`、`RUN_STATE.md` 和 `STATUS.md` 确认落盘。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
