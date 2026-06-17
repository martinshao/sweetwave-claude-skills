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
→ /sw-brief
→ /sw-prd
→ /sw-design
→ /sw-arch
→ /sw-spec
→ /sw-task
→ /sw-work TASK-001
→ /sw-verify TASK-001
→ /sw-review
→ /sw-release v0.1.0
→ /sw-retro v0.1.0
```

## 命令说明

| Skill | 用途 |
|---|---|
| `/sw-init` | 初始化当前项目的 SweetWave 文档结构和 CLAUDE.md |
| `/sw-brief` | 把模糊想法收敛成产品简报 |
| `/sw-prd` | 生成产品需求文档 PRD |
| `/sw-design` | 生成用户流程、页面地图、交互说明 |
| `/sw-arch` | 生成技术架构、API 契约、数据模型 |
| `/sw-spec` | 生成开发规格文档 |
| `/sw-task` | 把开发规格拆成可执行任务 |
| `/sw-work TASK-001` | 只实现一个任务 |
| `/sw-verify TASK-001` | 用测试、构建、类型检查、lint 验证实现 |
| `/sw-review` | 审查当前 git diff |
| `/sw-release v0.1.0` | 准备发布清单、变更日志、回滚方案 |
| `/sw-retro v0.1.0` | 进行上线后复盘 |

## 核心规则

1. 非 trivial 工作不要跳过文档阶段。
2. `/sw-work` 一次只允许实现一个任务。
3. 开始编码前必须先输出实现计划。
4. 声称完成前必须给出验证证据。
5. 发布类 skill 默认不执行生产部署命令。
6. 当前 skills 是个人级能力，项目产物沉淀在当前 repo。
