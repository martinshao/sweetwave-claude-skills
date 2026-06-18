# SweetWave Claude Skills 中文版 V0

SweetWave 是一套基于 Claude Code `~/.claude/skills` 的个人级 AI Coding Workflow。

这一版的特点是：**Skill 命令跨项目复用，文档产物沉淀到当前项目。**

SweetWave Claude Skills 自身的功能演进记录在 [CHANGELOG.md](./CHANGELOG.md)。

安装后，你可以在任意项目中使用：

```txt
/sw-help
/sw-status
/sw-init
/sw-brief
/sw-prd
/sw-map
/sw-design
/sw-ui
/sw-arch
/sw-spec
/sw-task
/sw-run [module] TASK-001
/sw-run --all
/sw-run [module] TASK-001 --stage implement
/sw-frontend-engineer
/sw-backend-engineer
/sw-database-engineer
/sw-security-engineer
/sw-qa-engineer
/sw-doc-sync
/sw-release v0.1.0
/sw-retro v0.1.0
```

## 1. 安装

```bash
cd sweetwave-claude-skills
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
# 将最初的产品想法粘贴到 .wave/idea/INIT-IDEA.md
/sw-brief
/sw-prd
/sw-map
/sw-design
/sw-ui
/sw-arch
/sw-spec
/sw-task
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

`.wave/` 是 SweetWave 在项目内的工作区。后续模块化规格会挂在 `.wave/specs/{module}/` 下，例如：

```txt
.wave/specs/product-detail/
  MODULE.md
  DESIGN.md
  UI.md
  prototype/
  ARCH.md
  SPEC.md
  TASKS.md
  TEST_REPORT.md
```

`.wave/idea/INIT-IDEA.md` 用来保留用户未经加工的最初想法，只需要粘贴几句话；
`/sw-brief` 会读取它并生成对应的产品简报，不会覆盖原始 IDEA。

SweetWave 使用三层状态记忆支持跨会话恢复：

```txt
.wave/STATUS.md                    项目级阶段、模块进度、物料清单和下一步
.wave/specs/{module}/TASKS.md      每个任务的生命周期状态
.wave/RUN_STATE.md                 当前任务的执行阶段、Git 基线和恢复现场
```

`/sw-task` 完成任务定义后，首次 `/sw-run` 会把工作流标记为 `READY_TO_RUN`
并记录物料指纹。即使隔一段时间再执行，也会先校验 Git 现场和规格物料，再从
`IMPLEMENTING`、`VERIFYING`、`REVIEWING` 或 `BLOCKED` 检查点继续。

完整流转见
[SweetWave 断点记忆与恢复流程图](./docs/sweetwave-checkpoint-recovery-workflow.svg)。

`/sw-run` 已升级为 N1–N10 节点化自治编排器，会根据任务元数据调用同级
Engineer Skills，并在验证、审查、风险 QA 和安全门全部满足后写入 `[x]`。
`/sw-work`、`/sw-verify`、`/sw-review` 仅作为旧命令兼容入口。

自治编排流程见
[SweetWave 自治工程编排流程图](./docs/sweetwave-autonomous-run-workflow.svg)。

文件名前缀使用 `{SCOPE}-{TYPE}.md`，例如 `INIT-IDEA.md`、`INIT-BRIEF.md`、
`INIT-PRD.md`、`CHECKOUT-PRD.md`。

模块化节点支持显式模块参数；无参数时默认处理 `.wave/MODULE_MAP.md` 中所有 planned/active 模块：

```txt
/sw-design product-detail
/sw-ui product-detail
/sw-arch product-detail
/sw-spec product-detail
/sw-task product-detail
```

## 7. 设计原则

1. **文档先行**：PRD、开发规格、任务清单是 AI Coding 的核心上下文。
2. **单状态写入者**：初始化和任务定义生成后，只有 `/sw-run` 推进三层运行状态，
   Engineer Skills 只返回结果。
3. **先计划后实现**：复杂开发必须先输出实现计划，再进行代码修改。
4. **验证闭环**：开发完成必须报告 typecheck / lint / test / build 的执行结果。
5. **角色路由**：任务按 frontend、backend、database 等角色进入专业 Engineer Skill。
6. **自治状态机**：`/sw-run` 节点化推进实现、验证、审查、QA、安全和文档同步。
7. **三层记忆**：`STATUS.md` 记录全局位置，`TASKS.md` 记录任务生命周期，
   `RUN_STATE.md` 记录执行现场和恢复命令。
8. **恢复校验**：恢复任务前必须比较 Git 基线和物料指纹，避免使用过期规格继续开发。
9. **风险驱动 QA**：普通任务执行最小质量门，高风险和模块完成场景执行完整 QA。
10. **安全并行边界**：当前只识别并行候选，仍采用串行执行。
11. **发布谨慎**：`/sw-release` 默认只生成发布清单、变更日志和回滚方案，不执行生产部署。
12. **个人级复用**：skills 安装在 `~/.claude/skills`，项目产物留在当前 repo。

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
原始想法 → 产品简报 → PRD → 模块地图 → 产品设计 → 界面与原型设计 → 架构 → 开发规格 → 任务 → 自治执行 → 风险 QA → 文档同步 → 发布 → 复盘
```

真正提升质量的不是一次性生成，而是：

```txt
高信噪上下文 × 高精度输入 × 强验证闭环
```
