# P3: Map

1. 要求当前 PRD 为 READY。
2. 将当前节点写为 `P3_MAP`，Module Map 状态写为 `DRAFT`。
3. 调用 `/sw-domain-engineer` 更新 `.wave/MODULE_MAP.md` 和各模块 `MODULE.md`。
4. 模块按业务域和交付边界拆分，ID 使用 kebab-case。
5. 分析依赖、优先级、跨模块约束和循环依赖。
6. 保留既有模块人工内容；删除或合并模块时先生成影响清单。
7. 初始化每个模块的 Design/UI/Arch/Spec/Tasks 状态为 MISSING 或 STALE。
8. 记录模块串行计划和并行候选；实际仍串行执行。
9. 基础检查通过后将 Map 写为 READY。

`--stage map` 完成后停止；下一步建议 `/sw-plan --from design`。
