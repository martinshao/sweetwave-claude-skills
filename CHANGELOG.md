# SweetWave Claude Skills Changelog

本文档记录 SweetWave Claude Skills 自身的功能变化。

格式参考 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.1.0/)，版本号遵循
[Semantic Versioning](https://semver.org/lang/zh-CN/)。在正式发布前，所有变更先记录到
`Unreleased`；发布时再迁移到对应版本并补充发布日期。

> 本文件记录 skills 仓库的功能演进。各业务项目通过 `/sw-release` 生成的发布记录，
> 仍保存在项目自己的 `.wave/release/` 目录中。

## [Unreleased]

### Added

- 新增节点化 `/sw-plan`，将恢复、PRD、模块地图、设计、UI、架构、规格、任务、
  文档质量门和工程交接拆分为 P1–P10。
- 新增 `/sw-product-engineer`、`/sw-domain-engineer`、`/sw-ux-engineer`、
  `/sw-ui-design-engineer`、`/sw-architecture-engineer`、`/sw-spec-engineer`
  和 `/sw-task-engineer`。
- 新增 `.wave/PLAN_STATE.md`、`.wave/TRACEABILITY.md` 和
  `.wave/PLAN_REPORT.md`，支持文档断点恢复、需求追踪和质量门。
- 新增模块文档状态 `MISSING`、`DRAFT`、`REVIEWING`、`READY`、`BLOCKED`、
  `STALE` 及上游变更传播规则。
- 新增节点化 `/sw-run`，将恢复、调度、角色路由、实现、验证、审查、风险 QA、
  检查点、上下文重建和完成同步拆分为 N1–N10。
- 新增 `/sw-frontend-engineer`、`/sw-backend-engineer`、
  `/sw-database-engineer`、`/sw-security-engineer`、`/sw-qa-engineer` 和
  `/sw-doc-sync`。
- 新增任务角色、涉及项目、风险等级、QA 策略和并行候选元数据。
- 新增 `.wave/qa/`、`.wave/security/` 报告目录和发布候选摘要。
- 新增三层断点记忆：`.wave/STATUS.md` 保存项目快照，模块 `TASKS.md` 保存任务
  生命周期，`.wave/RUN_STATE.md` 保存当前执行现场、物料基线和恢复命令。
- 新增任务中间状态 `[IN_PROGRESS]`、`[VERIFYING]`、`[REVIEWING]`、`[BLOCKED]`，
  支持从实现、验证、审查或阻塞阶段跨会话恢复。
- 新增 `.wave/idea/{SCOPE}-IDEA.md` 原始想法文件；`/sw-init` 创建
  `INIT-IDEA.md`，`/sw-brief` 读取 IDEA 并生成对应产品简报，同时保留原始输入。
- 新增 `/sw-ui [module]`，根据 PRD、模块定义和产品设计生成模块级界面规格、
  原型文件与设计交付说明。
- 新增 `/sw-map`，根据 PRD 建立 `.wave/MODULE_MAP.md`、模块依赖关系和
  `.wave/specs/{module}/` 规格目录。
- 新增模块化规格工作流，`/sw-design`、`/sw-arch`、`/sw-spec`、`/sw-task`
  支持显式模块参数，也可无参数处理全部 planned/active 模块。
- 新增 `/sw-run` 任务状态机，支持任务选择、断点恢复、验证质量门、审查质量门和
  `.wave/LESSONS.md` 长期经验沉淀。
- 新增 `update-global.sh`，支持团队成员拉取仓库更新后刷新全局安装的 skills 和模板。
- 新增 SweetWave 主流程、模块化流程、`/sw-run` 状态流转和敏捷迭代流程图。

### Changed

- `/sw-prd`、`/sw-map`、`/sw-design`、`/sw-ui`、`/sw-arch`、`/sw-spec`、
  `/sw-task` 改为对应 `/sw-plan --stage` 的兼容入口。
- `/sw-run` 只接受 `/sw-plan` P10 已交接且 PLAN_REPORT 为 `PASSED` 的物料。
- `/sw-run` 成为三层运行状态的唯一写入者；`/sw-work`、`/sw-verify`、
  `/sw-review` 改为对应 `--stage` 模式的兼容入口。
- 任务完成顺序调整为实现、验证、审查、按需 QA/安全门全部通过后再写入 `[x]`。
- 项目内工作区统一迁移到 `.wave/`，不再使用旧的 `docs/sweetwave/` 产物路径。
- 文档产物改为按阶段与模块组织：brief、PRD 使用范围前缀命名，模块规格统一存放在
  `.wave/specs/{module}/`。
- `/sw-init` 更新为创建 `.wave/` 工作区、状态文件、经验库及各类产物目录。
- `install-global.sh` 调整为幂等安装逻辑，可用于首次安装和覆盖更新。
- `/sw-prd` 增强产品简报输入、变更模式和结构化 PRD 生成流程。

## 维护约定

- 只记录对使用者有影响的功能、行为、兼容性和安装方式变化，不罗列纯内部重构。
- 每个功能提交或 PR 都应同步更新 `Unreleased`。
- 使用 `Added`、`Changed`、`Deprecated`、`Removed`、`Fixed`、`Security`
  对变更分类。
- 发布时将 `Unreleased` 内容迁移到 `## [x.y.z] - YYYY-MM-DD`，并保留新的空
  `Unreleased` 区段。
- 破坏兼容性的路径、命令或产物格式变化必须明确标注为 **Breaking**。
