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
→ /sw-prd
→ /sw-map
→ /sw-design
→ /sw-ui
→ /sw-arch
→ /sw-spec
→ /sw-task
→ /sw-run --all
→ /sw-release v0.1.0
→ /sw-retro v0.1.0
```

如需只推进单个阶段：

```txt
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
| `/sw-prd` | 生成产品需求文档 PRD |
| `/sw-map` | 根据 PRD 拆分模块，生成 `.wave/MODULE_MAP.md` 和模块目录 |
| `/sw-design [module]` | 生成模块用户流程、页面地图、交互说明 |
| `/sw-ui [module]` | 生成模块界面与原型设计，产出 `UI.md` |
| `/sw-arch [module]` | 生成模块技术架构、API 契约、数据模型 |
| `/sw-spec [module]` | 生成模块开发规格文档 |
| `/sw-task [module]` | 把模块开发规格拆成可执行任务 |
| `/sw-run TASK-001` | 自治执行任务，包含角色路由、断点恢复、质量门和状态写回 |
| `/sw-work TASK-001` | 兼容入口，提示改用 `/sw-run --stage implement` |
| `/sw-verify TASK-001` | 兼容入口，提示改用 `/sw-run --stage verify` |
| `/sw-review TASK-001` | 兼容入口，提示改用 `/sw-run --stage review` |
| `/sw-frontend-engineer` | 由 `/sw-run` 调用的前端实现角色 |
| `/sw-backend-engineer` | 由 `/sw-run` 调用的后端实现角色 |
| `/sw-database-engineer` | 由 `/sw-run` 调用的数据库实现角色 |
| `/sw-security-engineer` | 由 `/sw-run` 调用的安全专项角色 |
| `/sw-qa-engineer` | 由 `/sw-run` 调用的完整 QA 角色 |
| `/sw-doc-sync` | 全部任务完成后的文档同步能力 |
| `/sw-release v0.1.0` | 准备发布清单、变更日志、回滚方案 |
| `/sw-retro v0.1.0` | 进行上线后复盘 |

## 核心规则

1. 非 trivial 工作不要跳过文档阶段。
2. `/sw-init` 初始化状态、`/sw-task` 创建任务定义，只有 `/sw-run` 推进运行期状态。
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
