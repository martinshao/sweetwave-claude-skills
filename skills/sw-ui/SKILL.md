---
name: sw-ui
description: SweetWave UI 阶段兼容入口，将旧 UI 命令迁移到 /sw-plan --stage ui。
argument-hint: >-
  可选：module-id
disable-model-invocation: true
allowed-tools:
  - Read
---

# SweetWave UI 阶段兼容入口

用户输入：

```txt
$ARGUMENTS
```

本命令不生成文档，也不修改规划状态。

```txt
有 module：/sw-plan --stage ui --module $ARGUMENTS
无参数：/sw-plan --stage ui --all
```
