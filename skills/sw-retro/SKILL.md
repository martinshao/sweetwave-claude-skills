---
description: 生成 SweetWave 上线后复盘，沉淀问题、经验和下一轮改进方向。
argument-hint: [version-or-release-name]
disable-model-invocation: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash(git status)
  - Bash(git log *)
---

# SweetWave 上线复盘

复盘对象：

```txt
$ARGUMENTS
```

## 输入

读取：

- `docs/sweetwave/07-release/RELEASE_CHECKLIST.md`
- `docs/sweetwave/07-release/CHANGELOG.md`
- `docs/sweetwave/07-release/ROLLBACK_PLAN.md`
- `docs/sweetwave/06-qa/TEST_REPORT.md`
- 用户提供的线上反馈、事故记录、监控摘要或补充信息

## 输出文件

创建或更新：

```txt
docs/sweetwave/08-retro/RETRO.md
```

## 工作流程

1. 总结本次发布目标和实际结果。
2. 记录上线过程中的问题。
3. 分析问题根因：需求、设计、架构、开发、测试、发布、监控、协作。
4. 总结做得好的地方。
5. 总结需要改进的地方。
6. 生成下一轮行动项。
7. 把可复用经验沉淀为 SweetWave 规则或项目规范建议。

## 复盘结构

```md
# 上线复盘

## 版本 / 发布对象

## 发布目标

## 实际结果

## 做得好的地方

## 出现的问题

## 根因分析

## 改进行动项

## 可沉淀规则

## 下一轮计划
```

## 规则

- 不要只做流水账。
- 必须分析机制原因，而不是只归因于个人疏忽。
- 行动项要可执行、可负责人化、可验证。
- 输出语言使用中文。
