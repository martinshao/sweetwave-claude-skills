# Claude Code 项目规则

## SweetWave 工作流

对于非 trivial 的产品或工程任务，遵循：

Idea → Brief → PRD → Module Map → Design → UI Prototype → Architecture → Dev Spec → Tasks → Run → QA → Release → Retro

可使用以下 SweetWave 个人级 skills：

```txt
/sw-brief
/sw-prd
/sw-map
/sw-design [module]
/sw-ui [module]
/sw-arch [module]
/sw-spec [module]
/sw-task [module]
/sw-run [module] TASK-001
/sw-run --all
/sw-run [module] TASK-001 --stage implement|verify|review|qa
/sw-release v0.1.0
/sw-retro v0.1.0
```

## 项目命令

执行 `/sw-init` 后，根据当前项目实际情况补全本节。

- 安装依赖：
- 本地开发：
- 类型检查：
- 代码检查：
- 测试：
- 构建：

## 工程规则

- 不要修改与当前任务无关的文件。
- 未经明确批准，不要新增依赖。
- 不要通过压制 TypeScript、lint、测试错误来让检查通过，必须先分析根因。
- `/sw-run` 是 SweetWave 三层运行状态的唯一写入者。
- 任务通过验证、审查和按需 QA/安全门后才可标记为 `[x]`。
- 跨会话恢复以 `.wave/STATUS.md`、`.wave/RUN_STATE.md` 和模块 `TASKS.md` 为准，
  不依赖聊天历史猜测进度。
- 重要架构决策、踩坑记录和跨任务影响写入 `.wave/LESSONS.md`。
- 不要读取或编辑 `.env` 文件。
- 未经明确批准，不要执行生产部署命令。
- 优先运行与任务最相关的最小验证命令，再运行全项目验证。
- 在声明完成前，必须报告修改文件、执行命令、命令结果和剩余风险。

## 架构规则

根据当前项目补全：

- UI 层：
- 领域层：
- API Client：
- 数据模型：
- 状态管理：
- 测试策略：
