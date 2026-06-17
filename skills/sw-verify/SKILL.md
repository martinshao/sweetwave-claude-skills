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
  - Glob
  - Grep
  - Bash(git status)
  - Bash(git diff *)
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
- 当前 git diff

## 当前 git diff 概览

!`git diff --stat HEAD`

## 工作流程

1. 从用户输入解析 `{module}` 和 `TASK-ID`；如果未提供模块，遍历 `.wave/specs/*/TASKS.md` 查找唯一匹配任务。
2. 在 `.wave/specs/{module}/TASKS.md` 中定位请求的任务。
3. 阅读验收标准。
4. 审查当前 git diff。
5. 识别当前项目中最小且相关的验证命令。
6. 运行对当前项目安全的验证命令：
   - typecheck
   - lint
   - tests
   - build
   - task-specific commands
7. 如果命令失败：
   - 报告具体失败信息
   - 判断可能根因
   - 推荐修复方向
   - 不要隐藏或忽略失败
8. 创建或更新：

```txt
.wave/specs/{module}/TEST_REPORT.md
```
9. 给出质量门结论：
   - `PASSED`：验收标准和验证命令通过，可进入 `/sw-review`。
   - `FAILED`：存在失败项，不得标记任务完成。
   - `NEEDS_MANUAL`：存在必须人工确认的验收项。

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
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
