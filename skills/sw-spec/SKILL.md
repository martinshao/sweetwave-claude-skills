---
name: sw-spec
description: SweetWave 规格阶段兼容入口，将旧 Spec 命令迁移到 /sw-plan --stage spec。
argument-hint: >-
  可选：module-id
disable-model-invocation: true
allowed-tools:
  - Read
---

# SweetWave Spec 阶段兼容入口

用户输入：

```txt
$ARGUMENTS
```

本命令不生成文档，也不修改规划状态。

```txt
有 module：/sw-plan --stage spec --module $ARGUMENTS
无参数：/sw-plan --stage spec --all
```
