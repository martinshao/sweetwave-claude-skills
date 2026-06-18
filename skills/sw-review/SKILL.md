---
name: sw-review
description: SweetWave 审查阶段兼容入口，将旧的任务审查命令迁移到 /sw-run --stage review。
argument-hint: >-
  module-id TASK-ID
disable-model-invocation: true
allowed-tools:
  - Read
---

# SweetWave 审查阶段兼容入口

用户输入：

```txt
$ARGUMENTS
```

本命令不审查 diff，也不修改任何状态文件。

根据参数输出并建议执行：

```txt
/sw-run $ARGUMENTS --stage review
```

审查结论、额外 QA/安全门和任务完成写回由 `/sw-run` 统一管理。
