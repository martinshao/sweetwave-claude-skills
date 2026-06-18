# P4: Design

按 MODULE_MAP 的依赖和优先级遍历目标模块。

1. 要求 PRD、Map、MODULE 为 READY。
2. 将当前节点写为 `P4_DESIGN`，目标 Design 状态写为 `DRAFT`。
3. 调用 `/sw-ux-engineer` 生成或更新模块 `DESIGN.md`。
4. 覆盖主流程、分支、异常、页面地图、交互状态和跨模块 UX 依赖。
5. 对 `app-shell` 汇总全部模块页面地图，定义全局导航分组、入口、面包屑和
   跨模块跳转；只描述页面壳，不设计具体业务内容。
6. 保留人工决策；高风险待确认问题写为 BLOCKED。
7. 校验 F/AC 引用后将 Design 写为 READY，并记录指纹。
8. 单模块阻塞时，可继续无依赖模块；依赖该模块的下游保持 BLOCKED。

`--stage design` 完成目标范围后停止。
