# N3: Dispatch

根据任务元数据选择执行能力。

| 执行角色 | Skill |
|---|---|
| `frontend-engineer` | `/sw-frontend-engineer` |
| `backend-engineer` | `/sw-backend-engineer` |
| `database-engineer` | `/sw-database-engineer` |
| `security-engineer` | `/sw-security-engineer` |
| `qa-engineer` | `/sw-qa-engineer` |
| `generic` | `/sw-run` 在 N4 直接实现 |

缺少 `执行角色` 时，根据任务目标、允许修改范围和文件类型临时推断，并把推断及理由
写入 `RUN_STATE.md`，不要强制改写旧 `TASKS.md`。

scaffold 任务必须路由到 `/sw-frontend-engineer` 的 `scaffold` 模式，不允许临时推断
为其他角色或由 `/sw-run` 直接实现。

跨多个主要工种的任务应阻塞并建议重新拆分；仅有少量辅助改动时选择主导角色。

将当前节点写为 `N3_DISPATCH`，记录选中的 Skill、项目、风险和调用输入。
