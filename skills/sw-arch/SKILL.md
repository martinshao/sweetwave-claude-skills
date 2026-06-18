---
name: sw-arch
description: SweetWave 架构阶段兼容入口，将旧 Arch 命令迁移到 /sw-plan --stage architecture。
argument-hint: >-
  可选：module-id
disable-model-invocation: true
allowed-tools:
  - Read
---

# SweetWave Architecture 阶段兼容入口

用户输入：

```txt
$ARGUMENTS
```

本命令不生成文档，也不修改规划状态。

```txt
有 module：/sw-plan --stage architecture --module $ARGUMENTS
无参数：/sw-plan --stage architecture --all
```
