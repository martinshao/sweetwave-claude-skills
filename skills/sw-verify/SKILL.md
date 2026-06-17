---
name: sw-verify
description: 使用测试、类型检查、lint、构建和验收标准验证 SweetWave 任务实现。
argument-hint: >-
  TASK-ID
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
- `docs/sweetwave/05-task/TASKS.md`
- `docs/sweetwave/04-spec/DEV_SPEC.md`
- 当前 git diff

## 当前 git diff 概览

!`git diff --stat HEAD`

## 工作流程

1. 在 `TASKS.md` 中定位请求的任务。
2. 阅读验收标准。
3. 审查当前 git diff。
4. 识别当前项目中最小且相关的验证命令。
5. 运行对当前项目安全的验证命令：
   - typecheck
   - lint
   - tests
   - build
   - task-specific commands
6. 如果命令失败：
   - 报告具体失败信息
   - 判断可能根因
   - 推荐修复方向
   - 不要隐藏或忽略失败
7. 创建或更新：

```txt
docs/sweetwave/06-qa/TEST_REPORT.md
```

## 报告结构

```md
# 测试报告

## 任务

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
- 输出语言使用中文。
