---
name: sw-map
description: SweetWave 模块地图阶段兼容入口，将旧 Map 命令迁移到 /sw-plan --stage map。
argument-hint: >-
  可选：scope、PRD 路径或 --module
disable-model-invocation: true
allowed-tools:
  - Read
---

# SweetWave Map 阶段兼容入口

用户输入：

```txt
$ARGUMENTS
```

本命令不生成文档，也不修改规划状态。保留全部参数并建议执行：

```txt
/sw-plan --stage map $ARGUMENTS
```
