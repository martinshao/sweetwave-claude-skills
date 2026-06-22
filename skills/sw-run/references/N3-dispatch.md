# N3: Dispatch

根据任务元数据选择执行能力，并完成不可跳过的前台 Agent 派发。

| 执行角色 | 前台 Agent | 预加载 Skill |
|---|---|---|
| `frontend-engineer` | `sw-frontend-worker` | `/sw-frontend-engineer` |
| `backend-engineer` | `sw-backend-worker` | `/sw-backend-engineer` |
| `database-engineer` | `sw-database-worker` | `/sw-database-engineer` |
| `security-engineer` | `sw-security-worker` | `/sw-security-engineer` |
| `qa-engineer` | `sw-qa-worker` | `/sw-qa-engineer` |
| `generic` | 无 | `/sw-run` 在 N4 直接实现 |

缺少 `执行角色` 时，根据任务目标、允许修改范围和文件类型临时推断，并把推断及理由
写入 `RUN_STATE.md`，不要强制改写旧 `TASKS.md`。

scaffold 任务必须路由到 `sw-frontend-worker`，由其预加载 `/sw-frontend-engineer`
并使用 `scaffold` 模式；不允许临时推断为其他角色或由 `/sw-run` 直接实现。

跨多个主要工种的任务应阻塞并建议重新拆分；仅有少量辅助改动时选择主导角色。

## 强制派发协议

1. 创建 `.wave/handoffs/{module}/`，删除或归档当前任务不匹配 Git 基线的旧 handoff。
2. 将当前节点写为 `N3_DISPATCH`，记录声明角色、解析角色、选中的 Agent、handoff
   路径、项目、风险、调用输入摘要和派发状态 `NOT_STARTED`。
3. 只有解析角色为 `generic` 时，写入 `DIRECT_GENERIC` 并进入 N4，由 `/sw-run`
   直接实现。缺少角色不等于 `generic`；必须先完成推断。
4. 非 `generic` 任务在调用前由 `/sw-run`：
   - 将任务写为 `[IN_PROGRESS]`，`STATUS.md` 写为 `RUNNING`；
   - scaffold 任务同时将前端骨架写为 `RUNNING`；
   - 将 `RUN_STATE.md` 阶段写为 `IMPLEMENTING`；
   - 将派发状态写为 `CALLING`。
5. 必须通过 `Agent` 工具以前台模式调用选中的 Engineer Subagent，不设置
   `run_in_background: true`。传入：
   - module、TASK-ID 和完整任务正文；
   - MODULE、DESIGN、UI、ARCH、SPEC 等必要规格路径；
   - 允许修改范围、禁止修改范围；
   - 目标项目、任务模式、风险和 Git 基线；
   - 唯一 handoff 路径 `.wave/handoffs/{module}/{TASK-ID}.md`；
   - 要求写入 handoff，不得修改三层状态。
6. Agent 前台完成并返回后，将派发状态写为 `RESULT_RETURNED`。读取 handoff，
   不从对话文本解析 Engineer 结果。
7. 校验 handoff 中的角色必须等于解析角色，状态必须合法，返回文件必须位于允许范围，
   module、TASK-ID 和 Git 基线必须匹配当前检查点，且工作区业务改动必须能由
   handoff 文件清单解释。通过后写为
   `RESULT_VALIDATED` 并立即进入 N4。
   `.wave/handoffs/**` 是运行期证据文件，始终允许写入，但不得计入任务业务修改范围。
8. Agent 不可调用、调用异常、handoff 缺失或过期、角色不匹配或改动越界时写为
   `[BLOCKED]`，派发状态写为 `FAILED`；scaffold 任务同时将前端骨架写为
   `BLOCKED`。不得由 `/sw-run` 接管实现，不得改写为 `generic`。
9. 上下文压缩或恢复后，如果派发状态不是 `RESULT_VALIDATED`，必须从本节点重新开始；
   不得仅凭已经识别过角色就跳到 N4。
10. 当前范围为 `ALL_MODULE_TASKS` 或 `ALL_PROJECT_TASKS` 时，Agent 返回、handoff
    生成、N3 或 N4 完成都禁止作为当前 `/sw-run` 的最终输出。

输出：派发凭证、handoff 路径或明确阻塞原因。
