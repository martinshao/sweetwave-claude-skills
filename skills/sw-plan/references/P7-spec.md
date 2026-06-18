# P7: Spec

按模块调度计划执行。

1. 要求 MODULE、DESIGN、UI、ARCH 为 READY。
2. 将当前节点写为 `P7_SPEC`，Spec 状态写为 `DRAFT`。
3. 调用 `/sw-spec-engineer` 生成或更新 `SPEC.md`。
4. 汇总功能、边界、路由、组件、状态、API、数据模型、安全、性能和测试策略。
5. 对 `app-shell` 汇总所有规划路由及对应模块，规定页面仅包含标题、说明、
   内容占位区和未实现标识，禁止 API、业务逻辑、真实表单和 Mock 业务数据。
6. 保持与 ARCH 契约及 UI 状态一致，不新增未经确认的产品需求。
7. 校验开发验收标准和禁止修改范围后写为 READY。
8. 记录 SPEC 指纹和 Tasks 下游影响。

`--stage spec` 完成目标范围后停止。
