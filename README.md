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
/sw-plan
/sw-prd
/sw-map
/sw-design
/sw-ui
/sw-arch
/sw-spec
/sw-task
/sw-scaffold
/sw-run --stage scaffold
/sw-run [module]
/sw-run [module] TASK-001
/sw-run [module] --all
/sw-run --all
/sw-run [module] TASK-001 --stage implement
/sw-frontend-engineer
/sw-backend-engineer
/sw-database-engineer
/sw-security-engineer
/sw-qa-engineer
/sw-doc-sync
/sw-product-engineer
/sw-domain-engineer
/sw-ux-engineer
/sw-ui-design-engineer
/sw-architecture-engineer
/sw-spec-engineer
/sw-task-engineer
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
/sw-plan
# 审查规划结果；存在前端页面时先建立应用壳
/sw-scaffold  # 仅当 P10 提示时
# 检查导航、路由和页面骨架后，由用户手动触发
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
  PLAN_STATE.md
  RUN_STATE.md
  MODULE_MAP.md
  TRACEABILITY.md
  PLAN_REPORT.md
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

存在前端页面时，规划阶段还会生成保留技术模块 `.wave/specs/app-shell/`，
其中 `TASKS.md` 只包含唯一 scaffold 任务 `APP-SHELL-001`。

`.wave/idea/INIT-IDEA.md` 用来保留用户未经加工的最初想法，只需要粘贴几句话；
`/sw-brief` 会读取它并生成对应的产品简报，不会覆盖原始 IDEA。

SweetWave 使用双编排检查点支持跨会话恢复：

```txt
.wave/STATUS.md                    项目级阶段、模块进度、物料清单和下一步
.wave/PLAN_STATE.md                文档规划节点、STALE 传播和规划恢复现场
.wave/specs/{module}/TASKS.md      每个任务的生命周期状态
.wave/RUN_STATE.md                 当前任务的执行阶段、Git 基线和恢复现场
```

`/sw-plan` 会从 PRD 连续推进到 TASKS，生成需求追踪矩阵和质量报告；只有 P9
质量门通过，P10 才会把工作流交接为 `READY_TO_RUN`。隔一段时间后可以通过
`/sw-plan --resume` 恢复文档阶段，或由 `/sw-run` 从
`IMPLEMENTING`、`VERIFYING`、`REVIEWING` 或 `BLOCKED` 检查点继续。

`READY_TO_RUN` 只表示规划物料已经就绪。`/sw-plan` 会在 P10 后结束，不会自动调用
工程命令。存在前端页面时，用户先手动执行 `/sw-scaffold`（等价于
`/sw-run --stage scaffold`），检查导航、路由和占位页面后再执行 `/sw-run --all`。
纯后端项目跳过骨架步骤。

完整流转见
[SweetWave 断点记忆与恢复流程图](./docs/sweetwave-checkpoint-recovery-workflow.svg)。

`/sw-run` 已升级为 N1–N10 节点化自治编排器，会根据任务元数据调用同级
Engineer Skills，并在验证、审查、风险 QA 和安全门全部满足后写入 `[x]`。
`/sw-scaffold` 是前端骨架友好入口；`/sw-work`、`/sw-verify`、`/sw-review`
仅作为兼容入口。

角色派发是强制边界：N3 必须通过 `Skill` 工具调用任务声明或推断出的
`sw-frontend-engineer`、`sw-backend-engineer` 或 `sw-database-engineer`。
非 `generic` 任务没有 `RESULT_VALIDATED` 派发凭证时不能进入 N4；上下文压缩或
跨会话恢复也必须重新校验该凭证。`sw-run` 不得把调用失败降级成自行实现。

`/sw-run` 的执行范围由命令显式决定：

| 命令 | 执行范围 | 停止条件 |
|---|---|---|
| `/sw-run` | 全项目下一个可执行任务 | 一个任务完成 |
| `/sw-run {module}` | 指定模块下一个可执行任务 | 一个任务完成 |
| `/sw-run TASK-ID` | 全项目唯一匹配的指定任务 | 指定任务完成 |
| `/sw-run {module} TASK-ID` | 指定模块的指定任务 | 指定任务完成 |
| `/sw-run {module} --all` | 指定模块全部任务 | 模块完成 |
| `/sw-run --all` | 全项目全部模块和任务 | 项目完成并进入发布收尾 |

模块范围不会自动进入其他模块；单任务模式也不会因为碰巧完成最后一个任务而自动升级
为 `--all`。执行范围会写入 `.wave/RUN_STATE.md`，跨会话恢复时继续沿用。

自治编排流程见
[SweetWave 自治工程编排流程图](./docs/sweetwave-autonomous-run-workflow.svg)。

`/sw-plan` 是 P1–P10 节点化自治文档编排器，会调用 product、domain、UX、UI、
architecture、spec 和 task Engineer Skills。上游变化会按依赖传播 `STALE`；
涉及完成任务或已有实现时先暂停确认。

自治文档流程见
[SweetWave 自治文档编排流程图](./docs/sweetwave-autonomous-document-workflow.svg)。

文件名前缀使用 `{SCOPE}-{TYPE}.md`，例如 `INIT-IDEA.md`、`INIT-BRIEF.md`、
`INIT-PRD.md`、`CHECKOUT-PRD.md`。

旧阶段命令保留为兼容入口，推荐直接使用 `/sw-plan`：

```txt
/sw-plan
/sw-plan --module product-detail
/sw-plan --stage ui --module product-detail
/sw-plan --change INIT 变更说明
```

## 7. 设计原则

1. **双编排器**：`/sw-plan` 负责文档规划，`/sw-run` 负责工程执行。
2. **状态所有权**：`/sw-plan` 独占规划状态，`/sw-run` 独占运行状态，
   Engineer Skills 只写目标产物或返回结果。
3. **人工交接**：规划完成只进入 `READY_TO_RUN`；前端项目先人工启动并检查骨架，
   再人工启动普通工程任务。
4. **先计划后实现**：复杂开发必须先输出实现计划，再进行代码修改。
5. **验证闭环**：开发完成必须报告 typecheck / lint / test / build 的执行结果。
6. **角色路由**：任务按 frontend、backend、database 等角色进入专业 Engineer Skill。
7. **派发凭证**：非 generic 任务必须留下实际 Skill 调用和结构化返回证据，
   N4 只验收结果，不代替专业角色写业务代码。
8. **自治状态机**：`/sw-run` 节点化推进实现、验证、审查、QA、安全和文档同步。
9. **范围锁定**：单任务、模块和全项目模式使用不同停止条件，恢复时不得越界扩展范围。
10. **规划质量门**：F/AC 必须追踪到模块、规格和任务，跨文档冲突会阻塞交接。
11. **失效传播**：上游变化只将受影响下游标记为 `STALE`，不覆盖完成成果。
12. **恢复校验**：规划与执行恢复都比较物料指纹，避免使用过期规格。
13. **风险驱动 QA**：普通任务执行最小质量门，高风险和模块完成场景执行完整 QA。
14. **安全并行边界**：当前只识别并行候选，仍采用串行执行。
15. **发布谨慎**：`/sw-release` 默认只生成发布清单、变更日志和回滚方案，不执行生产部署。
16. **骨架门禁**：前端页面项目必须先完成 `APP-SHELL-001`，普通任务才能运行。
17. **个人级复用**：skills 安装在 `~/.claude/skills`，项目产物留在当前 repo。

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
原始想法 → 产品简报 → 自治文档规划 → 文档质量门 → 自治工程执行 → 风险 QA → 文档同步 → 发布 → 复盘
```

真正提升质量的不是一次性生成，而是：

```txt
高信噪上下文 × 高精度输入 × 强验证闭环
```
