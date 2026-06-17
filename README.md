# SweetWave Claude Skills 中文版 V0

SweetWave 是一套基于 Claude Code `~/.claude/skills` 的个人级 AI Coding Workflow。

这一版的特点是：**Skill 命令跨项目复用，文档产物沉淀到当前项目。**

安装后，你可以在任意项目中使用：

```txt
/sw-help
/sw-status
/sw-init
/sw-brief
/sw-prd
/sw-map
/sw-design
/sw-arch
/sw-spec
/sw-task
/sw-work TASK-001
/sw-verify TASK-001
/sw-review
/sw-run TASK-001
/sw-run --all
/sw-release v0.1.0
/sw-retro v0.1.0
```

## 1. 安装

```bash
cd sweetwave-personal-skills-zh-v0
./install-global.sh
```

安装目标：

```txt
~/.claude/skills/sw-*
~/.claude/sweetwave/templates/*
```

## 2. 验证安装

```bash
./verify-install.sh
```

然后进入任意项目：

```bash
cd /path/to/your-project
claude
```

在 Claude Code 中输入：

```txt
/sw-help
```

如果可以看到 SweetWave 帮助说明，说明安装成功。

## 3. 更新

SweetWave Claude Skills 由 git 管理。团队成员拉取最新仓库后，可以执行：

```bash
git pull
./update-global.sh
```

`update-global.sh` 会复用 `install-global.sh update`，覆盖更新 `~/.claude/skills/sw-*` 和 `~/.claude/sweetwave/templates/*`。

`install-global.sh` 本身也是幂等的；重复执行也会刷新本机已安装的 SweetWave skills。

## 4. 卸载

```bash
./uninstall-global.sh
```

## 5. 推荐使用流程

在任意项目根目录启动 Claude Code：

```bash
claude
```

然后按下面顺序推进：

```txt
/sw-init
/sw-brief "我要做一个轻量 C 端商城，用于验证前端监控系统"
/sw-prd
/sw-map
/sw-design
/sw-arch
/sw-spec
/sw-task
/sw-work TASK-001
/sw-verify TASK-001
/sw-review
/sw-run --all
/sw-release v0.1.0
/sw-retro v0.1.0
```

## 6. 每个项目中的产物目录

`/sw-init` 会在当前项目创建或更新：

```txt
CLAUDE.md
.wave/
  LESSONS.md
  STATUS.md
  MODULE_MAP.md
  brief/
    INIT-BRIEF.md
  prd/
    INIT-PRD.md
  specs/
    README.md
  release/
    README.md
  retro/
    README.md
```

`.wave/` 是 SweetWave 在项目内的工作区。后续模块化规格会挂在 `.wave/specs/{module}/` 下，例如：

```txt
.wave/specs/product-detail/
  MODULE.md
  DESIGN.md
  ARCH.md
  SPEC.md
  TASKS.md
  TEST_REPORT.md
```

文件名前缀使用 `{SCOPE}-{TYPE}.md`，例如 `INIT-BRIEF.md`、`INIT-PRD.md`、`CHECKOUT-PRD.md`。

模块化节点支持显式模块参数；无参数时默认处理 `.wave/MODULE_MAP.md` 中所有 planned/active 模块：

```txt
/sw-design product-detail
/sw-arch product-detail
/sw-spec product-detail
/sw-task product-detail
```

## 7. 设计原则

1. **文档先行**：PRD、开发规格、任务清单是 AI Coding 的核心上下文。
2. **单任务执行**：`/sw-work` 一次只处理一个 `TASK`，避免改动范围失控。
3. **先计划后实现**：复杂开发必须先输出实现计划，再进行代码修改。
4. **验证闭环**：开发完成必须报告 typecheck / lint / test / build 的执行结果。
5. **审查独立**：`/sw-review` 默认只审查当前 diff，不直接修改代码。
6. **状态机可选**：`/sw-run` 可以按 `TASKS.md` 状态连续推进，提供断点恢复、验证质量门、审查质量门和 `.wave/LESSONS.md` 长期记忆。
7. **发布谨慎**：`/sw-release` 默认只生成发布清单、变更日志和回滚方案，不执行生产部署。
8. **个人级复用**：skills 安装在 `~/.claude/skills`，项目产物留在当前 repo。

## 8. V0 边界

这一版是个人级 skills 工作流，适合跨项目复用和个人方法论验证。后续可以升级为：

```txt
V0：~/.claude/skills
V1：~/.claude/skills + ~/.claude/agents
V2：项目级 .claude/settings.json + hooks
V3：SweetWave plugin，支持 /sw:prd /sw:work /sw:release
```

## 9. 核心理念

SweetWave 的目标不是让 AI 随意写更多代码，而是把 AI 放入一套可控的软件工程闭环中：

```txt
想法 → PRD → 设计 → 架构 → 开发规格 → 任务 → 实现 → 验证 → 审查 → 经验沉淀 → 发布 → 复盘
```

真正提升质量的不是一次性生成，而是：

```txt
高信噪上下文 × 高精度输入 × 强验证闭环
```
