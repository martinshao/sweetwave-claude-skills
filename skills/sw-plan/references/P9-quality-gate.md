# P9: Quality Gate

将当前节点写为 `P9_QUALITY_GATE`，生成：

```txt
.wave/TRACEABILITY.md
.wave/PLAN_REPORT.md
```

## 追踪矩阵

建立：

```txt
F-xxx → module → DESIGN → UI → ARCH → SPEC → TASK-ID → AC-xxx
```

## 检查项

- 核心功能需求 F 和验收标准 AC 均有完整下游追踪。
- DESIGN、UI、SPEC 的页面、流程、状态一致。
- ARCH、SPEC 的 API、数据、权限、安全约束一致。
- TASKS 引用的文档、F、AC、角色和范围真实存在。
- 模块依赖无循环、无遗漏。
- 每个任务都有角色、项目、风险、QA、并行策略和验证命令。
- 不存在 MISSING、DRAFT、STALE 或高风险未确认问题。

## 结论

- `PASSED`：全部强制项通过，可进入 P10。
- `BLOCKED`：结构或一致性失败，返回对应节点修复。
- `NEEDS_CONFIRMATION`：存在必须由用户决策的高风险问题。

`--stage quality` 在写入报告后停止；只有 PASSED 才建议执行 P10。
