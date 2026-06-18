---
name: sw-qa-engineer
description: 对 SweetWave 任务、模块或发布候选执行完整 QA，包括验收标准、集成测试、E2E、视觉回归和剩余风险评估。由 /sw-run 按风险触发。
disable-model-invocation: true
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash(git diff *)
  - Bash(pnpm typecheck)
  - Bash(pnpm lint)
  - Bash(pnpm test *)
  - Bash(pnpm build)
  - Bash(npm run typecheck)
  - Bash(npm run lint)
  - Bash(npm test *)
  - Bash(npm run build)
  - Bash(yarn test *)
  - Bash(bun test *)
---

# SweetWave QA 工程师

根据 `/sw-run` 指定的范围执行跨文件、跨任务或发布级完整 QA。

## 范围

- `task`：写入 `.wave/qa/{module}/{TASK-ID}-QA.md`
- `module`：写入 `.wave/qa/{module}/MODULE-QA.md`
- `release`：写入 `.wave/qa/RELEASE-QA.md`

## 工作流程

1. 读取 PRD 验收标准、模块规格、任务、TEST_REPORT 和当前 diff。
2. 识别项目测试框架与安全可执行的验证命令。
3. 执行相关单元、集成、E2E、构建和必要的视觉检查。
4. 逐条映射验收标准与验证证据。
5. 区分自动通过、需要人工确认和失败项。

报告结论使用 `PASSED / FAILED / NEEDS_MANUAL`。

## 结构化结果

```md
## 执行结果

- 角色：qa-engineer
- 状态：COMPLETED / BLOCKED
- 修改文件：仅 QA 报告
- 完成内容：
- 执行命令：
- 验证结果：
- 风险：
- 建议下一阶段：CHECKPOINT / BLOCKED
```

不得修改业务代码或三层状态；失败项返回 `/sw-run` 处理。
