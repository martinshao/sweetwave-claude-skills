# P6: Architecture

按模块调度计划执行。

1. 要求 MODULE、DESIGN、UI 为 READY。
2. 将当前节点写为 `P6_ARCHITECTURE`，Arch 状态写为 `DRAFT`。
3. 调用 `/sw-architecture-engineer` 生成或更新 `ARCH.md`。
4. 定义模块边界、技术层、API、数据模型、权限、安全、性能、部署和可观测性。
5. 校验跨模块契约和依赖方向，发现循环或冲突时 BLOCKED。
6. 校验 UI 状态均有技术支撑后写为 READY。
7. 记录 ARCH 指纹和 SPEC/Tasks 下游影响。

`--stage architecture` 完成目标范围后停止。
