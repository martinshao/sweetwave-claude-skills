---
name: sw-init
description: 在当前项目中初始化 SweetWave 文档结构和 CLAUDE.md。适合项目第一次接入 SweetWave 时使用。
argument-hint: >-
  可选：项目类型或上下文
disable-model-invocation: true
allowed-tools:
  - Read
  - Write
  - Edit
  - MultiEdit
  - Glob
  - Grep
  - Bash(git status)
  - Bash(ls *)
  - Bash(find *)
  - Bash(mkdir -p *)
  - Bash(test *)
  - Bash(cat package.json)
---

# SweetWave 初始化

在当前项目中初始化 SweetWave。

用户输入：

```txt
$ARGUMENTS
```

## 当前项目线索

包和配置文件：

!`find . -maxdepth 3 \( -name package.json -o -name pnpm-workspace.yaml -o -name turbo.json -o -name vite.config.* -o -name next.config.* -o -name tsconfig.json -o -name pyproject.toml -o -name go.mod -o -name Cargo.toml \) 2>/dev/null | sort | head -200`

Git 状态：

!`git status --short 2>/dev/null || true`

## 目标

创建或更新当前项目中的 SweetWave 资产：

```txt
CLAUDE.md
docs/sweetwave/00-brief/BRIEF.md
docs/sweetwave/01-prd/PRD.md
docs/sweetwave/02-design/USER_FLOW.md
docs/sweetwave/02-design/PAGE_MAP.md
docs/sweetwave/02-design/INTERACTION.md
docs/sweetwave/03-architecture/ARCHITECTURE.md
docs/sweetwave/03-architecture/API_CONTRACT.md
docs/sweetwave/03-architecture/DATA_MODEL.md
docs/sweetwave/04-spec/DEV_SPEC.md
docs/sweetwave/05-task/TASKS.md
docs/sweetwave/06-qa/TEST_REPORT.md
docs/sweetwave/07-release/RELEASE_CHECKLIST.md
docs/sweetwave/07-release/CHANGELOG.md
docs/sweetwave/07-release/ROLLBACK_PLAN.md
docs/sweetwave/08-retro/RETRO.md
docs/sweetwave/LESSONS.md
```

## 工作流程

1. 分析当前项目类型、包管理器、框架、已有脚本、测试和构建方式。
2. 创建缺失的 `docs/sweetwave/*` 目录和初始文档。
3. 创建或更新 `CLAUDE.md`，保持简洁，只写长期有效的项目规则：
   - 包管理器
   - dev / typecheck / lint / test / build 命令
   - 架构边界
   - AI Coding 规则
   - 禁止操作
4. 如果已有文档，不要粗暴覆盖；保留用户已有内容，并补充缺失章节。
5. 最后总结创建或更新了哪些文件，并给出下一步命令。
6. `LESSONS.md` 用于沉淀跨任务仍然有效的架构决策、踩坑记录和业务规则确认，不写常规流水账。

## 规则

- 不要修改业务源码。
- 不要安装依赖。
- 不要读取或编辑 `.env` 文件。
- 不要执行部署命令。
- 生成的文档要使用中文。
- 生成的文档应简洁、可维护、便于后续 `/sw-*` skills 引用。
