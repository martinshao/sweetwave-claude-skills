---
name: sw-task
description: SweetWave 任务拆解阶段兼容入口，将旧 Task 命令迁移到 /sw-plan --stage task。
argument-hint: >-
  可选：module-id
disable-model-invocation: true
allowed-tools:
  - Read
---

# SweetWave Task 阶段兼容入口

用户输入：

```txt
$ARGUMENTS
```

本命令不生成文档，也不修改规划状态。

```txt
有 module：/sw-plan --stage task --module $ARGUMENTS
无参数：/sw-plan --stage task --all
```
