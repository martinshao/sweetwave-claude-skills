---
name: sw-scaffold
description: SweetWave 前端骨架兼容入口，在 /sw-plan 完成后将应用壳、导航、路由和占位页面任务交给 /sw-run --stage scaffold 执行。
argument-hint: ""
disable-model-invocation: true
allowed-tools:
  - Read
---

# SweetWave 前端骨架入口

本命令不直接修改代码或状态文件。

建议执行：

```txt
/sw-run --stage scaffold
```

`/sw-run` 负责校验 P10 交接、调度 `APP-SHELL-001`、调用
`/sw-frontend-engineer`、执行验证审查并写回三层状态。骨架完成后必须停止，
等待用户检查页面结构并手动执行 `/sw-run --all`。
