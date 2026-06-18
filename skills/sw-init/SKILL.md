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
.wave/
  LESSONS.md
  STATUS.md
  RUN_STATE.md
  MODULE_MAP.md
  idea/
    INIT-IDEA.md
  brief/
    INIT-BRIEF.md
  prd/
    INIT-PRD.md
  specs/
    README.md
  qa/
  security/
  release/
    README.md
  retro/
    README.md
```

## 工作流程

1. 分析当前项目类型、包管理器、框架、已有脚本、测试和构建方式。
2. 创建缺失的 `.wave/*` 目录和初始文档。
3. 创建或更新 `CLAUDE.md`，保持简洁，只写长期有效的项目规则：
   - 包管理器
   - dev / typecheck / lint / test / build 命令
   - 架构边界
   - AI Coding 规则
   - 禁止操作
4. 如果已有文档，不要粗暴覆盖；保留用户已有内容，并补充缺失章节。
5. 最后总结创建或更新了哪些文件，并提示用户先填写 `.wave/idea/INIT-IDEA.md`，
   再执行 `/sw-brief`。
6. `.wave/LESSONS.md` 用于沉淀跨任务仍然有效的架构决策、踩坑记录和业务规则确认，不写常规流水账。
7. `.wave/STATUS.md` 保存项目级快照；`.wave/RUN_STATE.md` 保存当前任务执行检查点。

## 新目录规范

- `.wave/` 是 SweetWave 在项目内的工作区，承载 AI workflow 产物。
- `.wave/idea/` 存放用户未经加工的原始想法，初始文件命名为 `INIT-IDEA.md`。
- `.wave/brief/` 存放产品简报，初始简报命名为 `INIT-BRIEF.md`。
- `.wave/prd/` 存放 PRD，初始 PRD 命名为 `INIT-PRD.md`。
- `.wave/specs/` 预留给后续模块化规格目录，例如 `.wave/specs/product-detail/`。
- `.wave/MODULE_MAP.md` 预留给后续 `/sw-map` 生成模块拆分和依赖关系。
- `.wave/STATUS.md` 记录阶段、模块进度、物料清单和下一步命令。
- `.wave/RUN_STATE.md` 初始化为 `IDLE`，只记录一个当前任务的执行现场。
- `.wave/release/` 和 `.wave/retro/` 按版本或发布对象继续分目录或文件管理。
- `.wave/qa/` 保存任务、模块和发布级完整 QA 报告。
- `.wave/security/` 保存任务级安全专项报告。
- 文件名前缀使用 `{SCOPE}-{TYPE}.md`，例如 `INIT-IDEA.md`、`INIT-BRIEF.md`、`CHECKOUT-PRD.md`。
- `INIT-IDEA.md` 只提供最小提示，保留给用户粘贴原始想法；初始化时不要替用户扩写或结构化。

## 模板映射

如可读取全局模板，按以下关系初始化：

```txt
CLAUDE_TEMPLATE.md -> CLAUDE.md
LESSONS_TEMPLATE.md -> .wave/LESSONS.md
STATUS_TEMPLATE.md -> .wave/STATUS.md
RUN_STATE_TEMPLATE.md -> .wave/RUN_STATE.md
MODULE_MAP_TEMPLATE.md -> .wave/MODULE_MAP.md
IDEA_TEMPLATE.md -> .wave/idea/INIT-IDEA.md
BRIEF_TEMPLATE.md -> .wave/brief/INIT-BRIEF.md
PRD_TEMPLATE.md -> .wave/prd/INIT-PRD.md
WAVE_SPECS_README_TEMPLATE.md -> .wave/specs/README.md
UI_TEMPLATE.md -> .wave/specs/{module}/UI.md，由 /sw-ui 在模块目录中生成
WAVE_RELEASE_README_TEMPLATE.md -> .wave/release/README.md
WAVE_RETRO_README_TEMPLATE.md -> .wave/retro/README.md
```

## 规则

- 不要修改业务源码。
- 不要安装依赖。
- 不要读取或编辑 `.env` 文件。
- 不要执行部署命令。
- 生成的文档要使用中文。
- 生成的文档应简洁、可维护、便于后续 `/sw-*` skills 引用。
