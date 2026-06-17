---
name: sw-review
description: 审查当前 git diff 是否满足 SweetWave 文档、任务和工程质量要求。
argument-hint: >-
  可选：module-id、任务 ID、审查重点或风险关注点
disable-model-invocation: true
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash(git status)
  - Bash(git diff *)
  - Bash(git log *)
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
- `.wave/specs/{module}/SPEC.md`
- `.wave/specs/{module}/TASKS.md`
- `.wave/specs/{module}/TEST_REPORT.md`，如果存在

## 当前 git diff

!`git diff --stat HEAD`

## 审查维度

1. 是否满足相关任务的验收标准。
2. 是否符合 PRD 和开发规格。
3. 是否有无关文件或无关逻辑修改。
4. 是否破坏架构边界。
5. 是否有类型安全问题。
6. 是否有错误处理缺失。
7. 是否漏掉 loading / empty / error 状态。
8. 是否有测试覆盖缺口。
9. 是否有安全风险或敏感信息风险。
10. 是否需要补充文档或 changelog。
11. 是否可以通过质量门并标记任务完成。

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
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
