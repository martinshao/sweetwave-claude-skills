---
name: sw-verify
description: SweetWave 验证阶段兼容入口，将旧的单任务验证命令迁移到 /sw-run --stage verify。
argument-hint: >-
  module-id TASK-ID
disable-model-invocation: true
allowed-tools:
  - Read
---

# SweetWave 验证阶段兼容入口

用户输入：

```txt
$ARGUMENTS
```

本命令不运行验证，也不修改任何状态文件。

根据参数输出并建议执行：

```txt
/sw-run $ARGUMENTS --stage verify
```

验证命令、报告和生命周期写回由 `/sw-run` 的 N5 节点统一管理。
