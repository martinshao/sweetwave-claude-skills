---
name: sw-work
description: SweetWave 实现阶段兼容入口，将旧的单任务实现命令迁移到 /sw-run --stage implement。
argument-hint: >-
  module-id TASK-ID
disable-model-invocation: true
allowed-tools:
  - Read
---

# SweetWave 实现阶段兼容入口

用户输入：

```txt
$ARGUMENTS
```

本命令不再实现任务，也不修改任何状态文件。

根据参数输出并建议执行：

```txt
/sw-run $ARGUMENTS --stage implement
```

说明：状态写入已统一收口到 `/sw-run`，避免手动阶段命令与自治编排器产生冲突。
