---
name: sw-prd
description: SweetWave PRD 阶段兼容入口，将旧 PRD 命令迁移到 /sw-plan --stage prd。
argument-hint: >-
  可选：scope、补充约束、文档路径，或 --change 变更说明
disable-model-invocation: true
allowed-tools:
  - Read
---

# SweetWave PRD 阶段兼容入口

用户输入：

```txt
$ARGUMENTS
```

本命令不生成文档，也不修改规划状态。保留全部参数并建议执行：

```txt
/sw-plan --stage prd $ARGUMENTS
```
