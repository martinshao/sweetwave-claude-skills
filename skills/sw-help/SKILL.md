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
→ /sw-work TASK-001
→ /sw-verify TASK-001
→ /sw-review
→ /sw-release v0.1.0
→ /sw-retro v0.1.0
```

如果希望由 SweetWave 按任务状态连续推进，可以使用可选状态机入口：

```txt
/sw-run TASK-001
/sw-run --all
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
| `/sw-work TASK-001` | 只实现一个任务 |
| `/sw-verify TASK-001` | 用测试、构建、类型检查、lint 验证实现 |
| `/sw-review` | 审查当前 git diff |
| `/sw-run TASK-001` | 按状态机执行任务，包含断点恢复、验证质量门、审查质量门和 LESSONS 沉淀 |
| `/sw-release v0.1.0` | 准备发布清单、变更日志、回滚方案 |
| `/sw-retro v0.1.0` | 进行上线后复盘 |

## 核心规则

1. 非 trivial 工作不要跳过文档阶段。
2. `/sw-work` 一次只允许实现一个任务。
3. 开始编码前必须先输出实现计划。
4. 声称完成前必须给出验证证据。
5. 使用 `/sw-run` 时，任务必须通过验证质量门和审查质量门后才能标记为 `[x]`。
6. `.wave/STATUS.md` 记录项目级进度和物料，`.wave/RUN_STATE.md` 记录当前执行现场，
   `TASKS.md` 记录任务生命周期。
7. 恢复任务时先校验 Git 现场和物料指纹，规格变化后不得沿用旧验证结果。
8. 重要经验写入 `.wave/LESSONS.md`，供后续任务读取。
9. `.wave/idea/*-IDEA.md` 保留用户原始输入，后续 skill 不应覆盖。
10. 模块级产物写入 `.wave/specs/{module}/`，只使用 `.wave/*` 作为 SweetWave 工作区。
11. 发布类 skill 默认不执行生产部署命令。
12. 当前 skills 是个人级能力，项目产物沉淀在当前 repo。
