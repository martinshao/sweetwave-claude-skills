---
description: 根据产品简报或用户想法生成 SweetWave PRD。
argument-hint: [可选：产品想法、补充约束或文档路径]
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
  - Bash(ls *)
  - Bash(find *)
  - Bash(mkdir -p *)
  - Bash(test *)
---

# SweetWave PRD

用户输入：

```txt
$ARGUMENTS
```

## 输入

优先读取：

- `docs/sweetwave/00-brief/BRIEF.md`
- 用户本次输入的补充信息

## 输出文件

创建或更新：

```txt
docs/sweetwave/01-prd/PRD.md
```

## 工作流程

1. 阅读产品简报和用户补充信息。
2. 明确产品背景、目标用户、用户场景、MVP 范围、非本期范围。
3. 将功能需求写成可验证描述，避免空泛口号。
4. 为核心功能补充用户故事和验收标准。
5. 列出风险、假设和待确认问题。
6. 如果关键问题无法确定，先做合理假设，但必须明确标注。

## PRD 结构

```md
# 产品需求文档（PRD）

## 1. 背景

## 2. 目标

## 3. 目标用户

## 4. 用户场景

## 5. 功能需求

## 6. 非功能需求

## 7. MVP 范围

## 8. 非本期范围

## 9. 用户故事

| ID | 用户故事 | 优先级 | 验收标准 |
|---|---|---|---|

## 10. 总体验收标准

## 11. 风险与假设

## 12. 待确认问题
```

## 规则

- 不要写代码。
- 不要做具体技术架构。
- 每条需求都要尽量可测试、可验收。
- 输出语言使用中文。
