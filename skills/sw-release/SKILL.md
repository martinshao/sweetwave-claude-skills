---
name: sw-release
description: 为 SweetWave 项目准备发布清单、变更日志和回滚方案。默认不执行生产部署。
argument-hint: >-
  version
disable-model-invocation: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash(git status)
  - Bash(git diff *)
  - Bash(git log *)
---

# SweetWave 发布准备

发布版本：

```txt
$ARGUMENTS
```

## 输入

读取：

- `.wave/MODULE_MAP.md`
- `.wave/TRACEABILITY.md`
- `.wave/PLAN_REPORT.md`
- `.wave/specs/*/TASKS.md`
- `.wave/specs/*/TEST_REPORT.md`
- `.wave/qa/**/*-QA.md`
- `.wave/security/**/*-SECURITY.md`
- `.wave/release/RELEASE-CANDIDATE.md`
- `.wave/LESSONS.md`
- 当前 git log / diff
- 如存在，读取已有 changelog 或 release notes

## 输出文件

创建或更新：

```txt
.wave/release/{version}/RELEASE_CHECKLIST.md
.wave/release/{version}/CHANGELOG.md
.wave/release/{version}/ROLLBACK_PLAN.md
```

## 工作流程

1. 总结本次发布范围。
2. 列出包含的任务、commit、PR 或主要改动。
3. 整理验证结果。
4. 识别发布风险：
   - breaking changes
   - 环境变量
   - 数据库迁移
   - feature flags
   - 第三方服务
   - 性能风险
   - 回滚复杂度
5. 生成回滚方案。
6. 生成发布前最终检查清单。

## 规则

- 不要执行生产部署命令。
- 不要创建 git tag，除非用户明确要求。
- 不要推送代码。
- 明确标注需要人工确认的事项。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
