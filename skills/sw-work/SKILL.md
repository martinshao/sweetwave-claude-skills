---
name: sw-work
description: 只实现 TASKS.md 中的一个 SweetWave 任务。必须先计划，再编辑。
argument-hint: >-
  TASK-ID
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

# SweetWave 开发执行

请求执行的任务：

```txt
$ARGUMENTS
```

## 必读输入

读取：

- `CLAUDE.md`
- `docs/sweetwave/01-prd/PRD.md`
- `docs/sweetwave/04-spec/DEV_SPEC.md`
- `docs/sweetwave/05-task/TASKS.md`
- 相关的架构 / API / 数据模型文档

## 当前 git 状态

!`git status --short`

## 工作流程

1. 在 `docs/sweetwave/05-task/TASKS.md` 中定位请求的任务 ID。
2. 提取：
   - 状态标记
   - 目标
   - 依赖关系
   - 涉及范围
   - 允许修改范围
   - 禁止修改范围
   - 验收标准
   - 验证命令
3. 如果任务状态是 `[x]` 或 `[DROPPED]`，不要重复实现，直接说明原因。
4. 如果任务状态是 `[CHANGED]` 或 `[NEW]`，按当前任务描述执行。
5. 只检查与当前任务相关的代码。
6. 在输出实现计划前，不要编辑任何文件。
7. 先给出：
   - 对任务的理解
   - 可能修改的文件
   - 实现步骤
   - 测试计划
   - 风险点
8. 在用户批准计划或明确授权继续后，实施最小可工作的改动。
9. 先运行与任务最相关的最小验证命令。
10. 在适用时运行项目级验证命令：
   - typecheck
   - lint
   - tests
   - build
11. 如果验证失败，分析根因并修复，不要压制错误。
12. 最后总结：
   - 修改了哪些文件
   - 每个修改为什么必要
   - 执行了哪些命令
   - 命令结果
   - 剩余风险
   - 是否建议进入 `/sw-verify TASK-ID` 和 `/sw-review`

## 规则

- 只实现一个任务。
- 不要修改无关文件。
- 未经明确批准，不要引入新依赖。
- 不要编辑 `.env` 文件。
- 不要削弱测试。
- 没有验证证据，不要声称完成。
- `/sw-work` 默认不把任务标记为 `[x]`；任务必须经过 `/sw-verify` 和 `/sw-review` 后，或由 `/sw-run` 的质量门完成后再标记。
- 输出语言使用中文。
