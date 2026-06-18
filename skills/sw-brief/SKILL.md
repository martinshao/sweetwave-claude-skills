---
name: sw-brief
description: 根据 .wave/idea 中的原始想法或用户补充信息，创建或更新 SweetWave 产品简报。
argument-hint: >-
  可选：范围名、产品想法、补充上下文或 IDEA 文档路径
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

## 输入来源

按以下优先级读取并合并输入：

1. 用户显式指定的 IDEA 文档路径。
2. 与目标范围同名的 `.wave/idea/{SCOPE}-IDEA.md`。
3. 无明确范围时的 `.wave/idea/INIT-IDEA.md`。
4. 用户在 `$ARGUMENTS` 中提供的产品想法和补充上下文。
5. 已有 `.wave/brief/{SCOPE}-BRIEF.md` 中仍然有效的内容。

原始 IDEA 是事实来源，用户补充信息用于澄清和扩展，不要改写或覆盖 IDEA 文件。

## 工作流程

1. 确定目标范围，默认使用 `INIT`；如用户提供明确范围名，则使用该范围。
2. 按“输入来源”读取原始 IDEA、用户补充信息和已有简报。
3. 如果 IDEA 文件只有标题、空白或注释，且用户没有提供有效想法，不生成臆测内容；提示用户先填写对应的 IDEA 文件。
4. 把原始想法收敛成简洁的产品简报，并保留其核心意图和措辞。
5. 如果关键产品信息缺失，列出待确认问题，但仍然输出一个 best-effort 版本。
6. 只关注产品问题，不进入技术架构和代码实现。
7. 默认输出 `.wave/brief/INIT-BRIEF.md`；明确范围使用 `.wave/brief/{SCOPE}-BRIEF.md`。

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
- 不要修改 `.wave/idea/*-IDEA.md`，它是用户原始输入的只读记录。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
