---
name: sw-verify
description: 使用测试、类型检查、lint、构建和验收标准验证 SweetWave 任务实现。
argument-hint: >-
  可选：module-id TASK-ID；未提供 module 时按 TASK-ID 在所有模块中查找唯一任务
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
  - Bash(git rev-parse *)
  - Bash(shasum *)
  - Bash(pnpm typecheck)
  - Bash(pnpm lint)
  - Bash(pnpm test *)
  - Bash(pnpm build)
  - Bash(npm run typecheck)
  - Bash(npm run lint)
  - Bash(npm test *)
  - Bash(npm run build)
  - Bash(yarn typecheck)
  - Bash(yarn lint)
  - Bash(yarn test *)
  - Bash(yarn build)
  - Bash(bun run typecheck)
  - Bash(bun run lint)
  - Bash(bun test *)
  - Bash(bun run build)
---

# SweetWave 验证

请求验证的任务：

```txt
$ARGUMENTS
```

## 输入

读取：

- `CLAUDE.md`
- `.wave/specs/{module}/TASKS.md`
- `.wave/specs/{module}/SPEC.md`
- `.wave/STATUS.md`
- `.wave/RUN_STATE.md`
- 当前 git diff

## 当前 git diff 概览

!`git diff --stat HEAD`

## 工作流程

1. 从用户输入解析 `{module}` 和 `TASK-ID`；如果未提供模块，遍历 `.wave/specs/*/TASKS.md` 查找唯一匹配任务。
2. 读取 `RUN_STATE.md`，确认检查点属于该任务，并校验 Git 现场与物料基线。
3. 在 `.wave/specs/{module}/TASKS.md` 中定位请求的任务；将可验证任务状态写为
   `[VERIFYING]`，检查点写为 `RUNNING / VERIFYING`。
4. 阅读验收标准。
5. 审查当前 git diff。
6. 识别当前项目中最小且相关的验证命令。
7. 运行对当前项目安全的验证命令：
   - typecheck
   - lint
   - tests
   - build
   - task-specific commands
8. 每条命令和结果都追加到 `.wave/RUN_STATE.md`。
9. 如果命令失败：
   - 报告具体失败信息
   - 判断可能根因
   - 推荐修复方向
   - 不要隐藏或忽略失败
   - 可在原范围修复时保持 `[VERIFYING]`
   - 需要扩大范围或人工输入时写为 `[BLOCKED]`
   - 同步 `STATUS.md` 和精确恢复命令
10. 创建或更新：

```txt
.wave/specs/{module}/TEST_REPORT.md
```
11. 给出质量门结论：
   - `PASSED`：验收标准和验证命令通过，可进入 `/sw-review`。
   - `FAILED`：存在失败项，不得标记任务完成。
   - `NEEDS_MANUAL`：存在必须人工确认的验收项。
12. `PASSED` 时将任务写为 `[REVIEWING]`，检查点阶段写为 `REVIEWING`，
    恢复命令写为 `/sw-review {module} TASK-ID`。

## 报告结构

```md
# 测试报告

## 任务

## 质量门结论

## 已检查的验收标准

## 执行命令

| 命令 | 结果 | 说明 |
|---|---|---|

## 手动检查

## 失败项

## 剩余风险

## 最终状态
```

## 规则

- 不要做无关代码修改。
- 如果需要大范围修复，先征求用户确认。
- 验证证据比乐观总结更重要。
- 验证未通过时，不要建议把任务标记为 `[x]`。
- 验证阶段只允许 `[VERIFYING]`、`[BLOCKED]` 或 `[REVIEWING]`，不得直接写 `[x]`。
- 状态变化必须同步写入 `TASKS.md`、`RUN_STATE.md` 和 `STATUS.md`。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
