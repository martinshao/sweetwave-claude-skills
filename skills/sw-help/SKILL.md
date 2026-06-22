---
name: sw-help
description: 展示 SweetWave 个人级 skills 工作流和命令使用说明。
disable-model-invocation: true
allowed-tools:
  - Read
---

# SweetWave 帮助

SweetWave 是一套 Spec-Driven AI Coding Workflow，用来把软件开发从“让 AI 随意写代码”升级为“受控的软件工程闭环”。

## 推荐工作流

```txt
/sw-init
→ 填写 .wave/idea/INIT-IDEA.md
→ /sw-brief
→ /sw-plan
→ 人工确认规划结果
→ /sw-scaffold（存在前端页面时）
→ 人工检查页面骨架
→ /sw-run --all
→ /sw-release v0.1.0
→ /sw-retro v0.1.0
```

如需只推进单个阶段：

```txt
/sw-plan --stage prd|map|design|ui|architecture|spec|task|quality
/sw-run --stage scaffold
/sw-run {module} TASK-001 --stage implement
/sw-run {module} TASK-001 --stage verify
/sw-run {module} TASK-001 --stage review
/sw-run {module} TASK-001 --stage qa
```

## 命令说明

| Skill | 用途 |
|---|---|
| `/sw-init` | 初始化文档结构、CLAUDE.md 和原始想法文件 |
| `/sw-brief` | 读取 `.wave/idea/*-IDEA.md`，把原始想法收敛成产品简报 |
| `/sw-plan` | 自治生成 PRD、模块地图、设计、UI、架构、规格和任务 |
| `/sw-prd` 至 `/sw-task` | 兼容入口，提示改用对应 `/sw-plan --stage` |
| `/sw-scaffold` | 条件强制的前端应用壳入口，转交 `/sw-run --stage scaffold` |
| `/sw-run` | 执行全项目下一个可执行任务，完成一个任务后停止 |
| `/sw-run {module}` | 执行指定模块下一个可执行任务，完成一个任务后停止 |
| `/sw-run {module} TASK-001` | 只执行指定任务的完整质量闭环 |
| `/sw-run {module} --all` | 串行完成指定模块，完成后停止且不进入其他模块 |
| `/sw-run --all` | 串行完成全项目，结束后进入发布收尾 |
| `/sw-work TASK-001` | 兼容入口，提示改用 `/sw-run --stage implement` |
| `/sw-verify TASK-001` | 兼容入口，提示改用 `/sw-run --stage verify` |
| `/sw-review TASK-001` | 兼容入口，提示改用 `/sw-run --stage review` |
| `/sw-frontend-engineer` | 由 `/sw-run` 调用的前端实现角色 |
| `/sw-backend-engineer` | 由 `/sw-run` 调用的后端实现角色 |
| `/sw-database-engineer` | 由 `/sw-run` 调用的数据库实现角色 |
| `/sw-security-engineer` | 由 `/sw-run` 调用的安全专项角色 |
| `/sw-qa-engineer` | 由 `/sw-run` 调用的完整 QA 角色 |
| `/sw-doc-sync` | 全部任务完成后的文档同步能力 |
| `/sw-product-engineer` | 由 `/sw-plan` 调用的 PRD 角色 |
| `/sw-domain-engineer` | 由 `/sw-plan` 调用的模块领域角色 |
| `/sw-ux-engineer` | 由 `/sw-plan` 调用的产品体验角色 |
| `/sw-ui-design-engineer` | 由 `/sw-plan` 调用的界面设计角色 |
| `/sw-architecture-engineer` | 由 `/sw-plan` 调用的架构角色 |
| `/sw-spec-engineer` | 由 `/sw-plan` 调用的规格角色 |
| `/sw-task-engineer` | 由 `/sw-plan` 调用的任务拆解角色 |
| `/sw-release v0.1.0` | 准备发布清单、变更日志、回滚方案 |
| `/sw-retro v0.1.0` | 进行上线后复盘 |

## 核心规则

1. 非 trivial 工作不要跳过文档阶段。
2. `/sw-plan` 独占文档规划状态，`/sw-run` 独占工程运行状态；存在前端页面时，
   用户必须先手动执行 `/sw-scaffold`，检查骨架后再执行普通任务。
3. 开始编码前必须先输出实现计划。
4. 声称完成前必须给出验证证据。
5. 任务必须通过验证、审查和按需 QA/安全门后才能标记为 `[x]`。
6. `.wave/STATUS.md` 记录项目级进度和物料，`.wave/RUN_STATE.md` 记录当前执行现场，
   `TASKS.md` 记录任务生命周期。
7. 恢复任务时先校验 Git 现场和物料指纹，规格变化后不得沿用旧验证结果。
8. 重要经验写入 `.wave/LESSONS.md`，供后续任务读取。
9. `.wave/idea/*-IDEA.md` 保留用户原始输入，后续 skill 不应覆盖。
10. 模块级产物写入 `.wave/specs/{module}/`，只使用 `.wave/*` 作为 SweetWave 工作区。
11. 发布类 skill 默认不执行生产部署命令。
12. 当前 skills 是个人级能力，项目产物沉淀在当前 repo。
13. 第一版只识别并行候选，实际任务仍串行执行。
14. 文档质量门未通过或物料 STALE 时，不得进入 `/sw-run`。
15. 前端骨架为 PENDING、BLOCKED 或 STALE 时，不得执行普通 `/sw-run --all`。
16. `/sw-run` 必须锁定调用范围；单任务、模块和项目全量模式不得相互自动升级。
