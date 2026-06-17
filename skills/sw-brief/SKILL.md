---
name: sw-brief
description: 根据粗略想法创建或更新 SweetWave 产品简报。
argument-hint: >-
  产品想法或上下文
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

# SweetWave 产品简报

用户输入：

```txt
$ARGUMENTS
```

## 输出文件

创建或更新：

```txt
.wave/brief/{SCOPE}-BRIEF.md
```

## 工作流程

1. 如果已有 `.wave/brief/*.md`，先读取相关简报并保留有价值内容。
2. 把用户想法转成简洁的产品简报。
3. 如果关键产品信息缺失，列出待确认问题，但仍然输出一个 best-effort 版本。
4. 只关注产品问题，不进入技术架构和代码实现。
5. 默认输出 `.wave/brief/INIT-BRIEF.md`；如用户输入提供明确范围名，使用 `{SCOPE}-BRIEF.md`。

## 必须包含的章节

```md
# SweetWave 产品简报

## 1. 一句话想法

## 2. 目标用户

## 3. 用户痛点

## 4. 核心场景

## 5. MVP 边界

## 6. 不做什么

## 7. 成功指标

## 8. 待确认问题
```

## 规则

- 不要写实现代码。
- 不要在本阶段选择技术栈。
- 明确区分事实、假设和待确认问题。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
