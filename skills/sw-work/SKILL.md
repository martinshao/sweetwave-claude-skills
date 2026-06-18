---
name: sw-work
description: 只实现 TASKS.md 中的一个 SweetWave 任务。必须先计划，再编辑。
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
  - Bash(git log *)
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

# SweetWave 开发执行

请求执行的任务：

```txt
$ARGUMENTS
```

## 必读输入

读取：

- `CLAUDE.md`
- `.wave/MODULE_MAP.md`
- `.wave/STATUS.md`
- `.wave/RUN_STATE.md`
- `.wave/specs/{module}/MODULE.md`
- `.wave/specs/{module}/UI.md`
- `.wave/specs/{module}/SPEC.md`
- `.wave/specs/{module}/TASKS.md`
- `.wave/specs/{module}/ARCH.md`
- `.wave/LESSONS.md`，如果存在

## 当前 git 状态

!`git status --short`

## 工作流程

1. 读取 `.wave/STATUS.md` 和 `.wave/RUN_STATE.md`，检查是否存在其他活动任务现场。
2. 从用户输入解析 `{module}` 和 `TASK-ID`；如果未提供模块，遍历 `.wave/specs/*/TASKS.md` 查找唯一匹配任务。
3. 在 `.wave/specs/{module}/TASKS.md` 中定位请求的任务 ID。
4. 提取：
   - 状态标记
   - 目标
   - 依赖关系
   - 涉及范围
   - 允许修改范围
   - 禁止修改范围
   - 验收标准
   - 验证命令
5. 如果任务状态是 `[x]` 或 `[DROPPED]`，不要重复实现，直接说明原因。
6. 如果任务处于 `[VERIFYING]` 或 `[REVIEWING]`，不要重复实现，建议恢复对应质量门。
7. 如果任务是 `[IN_PROGRESS]` 或 `[BLOCKED]`，校验 `RUN_STATE.md`、Git 现场和物料基线后恢复。
8. 如果任务状态是 `[CHANGED]` 或 `[NEW]`，按当前任务描述执行。
9. 只检查与当前任务相关的代码。
10. 在输出实现计划前，不要编辑业务文件。
11. 先给出：
   - 对任务的理解
   - 可能修改的文件
   - 实现步骤
   - 测试计划
   - 风险点
12. 如果需要等待用户批准，将 `RUN_STATE.md` 写为 `PAUSED / PLANNING`，
    `STATUS.md` 记录当前模块、任务和恢复命令；此时不修改任务生命周期状态。
13. 在用户批准计划或明确授权继续后：
   - 将任务状态写为 `[IN_PROGRESS]`。
   - 更新 `RUN_STATE.md` 为 `RUNNING / IMPLEMENTING`，记录基准提交、物料指纹、
     恢复命令和初始 Git 状态。
   - 更新 `STATUS.md` 为 `RUNNING`。
14. 实施最小可工作的改动，并持续记录已完成步骤和已修改文件。
15. 实现结束后将任务写为 `[VERIFYING]`，`RUN_STATE.md` 阶段写为 `VERIFYING`，
   恢复命令写为 `/sw-verify {module} TASK-ID`。
16. 先运行与任务最相关的最小验证命令。
17. 在适用时运行项目级验证命令：
   - typecheck
   - lint
   - tests
   - build
18. 如果验证失败，分析根因并修复，不要压制错误；无法在原范围解决时写入
   `[BLOCKED]` 和阻塞检查点。
19. 最后总结：
   - 修改了哪些文件
   - 每个修改为什么必要
   - 执行了哪些命令
   - 命令结果
   - 剩余风险
   - 是否建议进入 `/sw-verify {module} TASK-ID` 和 `/sw-review {module} TASK-ID`

## 规则

- 只实现一个任务。
- 不要修改无关文件。
- 未经明确批准，不要引入新依赖。
- 不要编辑 `.env` 文件。
- 不要削弱测试。
- 没有验证证据，不要声称完成。
- `/sw-work` 不把任务标记为 `[x]`；实现完成后必须停在 `[VERIFYING]`。
- 不要启动第二个任务覆盖活动 `RUN_STATE.md`；切换前必须获得用户确认。
- 状态变化必须同步写入 `TASKS.md`、`RUN_STATE.md` 和 `STATUS.md`。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
