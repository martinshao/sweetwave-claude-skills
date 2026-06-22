# N3: Dispatch

根据任务元数据选择执行能力，并完成不可跳过的实际派发。

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

## 强制派发协议

1. 将当前节点写为 `N3_DISPATCH`，记录声明角色、解析角色、选中的 Skill、项目、
   风险、调用输入摘要和派发状态 `NOT_STARTED`。
2. 只有解析角色为 `generic` 时，写入 `DIRECT_GENERIC` 并进入 N4，由 `/sw-run`
   直接实现。缺少角色不等于 `generic`；必须先完成推断。
3. 非 `generic` 任务在调用前由 `/sw-run`：
   - 将任务写为 `[IN_PROGRESS]`，`STATUS.md` 写为 `RUNNING`；
   - scaffold 任务同时将前端骨架写为 `RUNNING`；
   - 将 `RUN_STATE.md` 阶段写为 `IMPLEMENTING`；
   - 将派发状态写为 `CALLING`。
4. 必须通过 `Skill` 工具在当前 `/sw-run` 调用内加载并执行选中的 Engineer Skill，
   并传入：
   - module、TASK-ID 和完整任务正文；
   - MODULE、DESIGN、UI、ARCH、SPEC 等必要规格路径；
   - 允许修改范围、禁止修改范围；
   - 目标项目、任务模式、风险和 Git 基线；
   - 要求生成统一“执行结果”和控制权标记 `RETURN_TO_SW_RUN_N3`，不得修改三层状态。
5. Engineer Skill 完成后不得结束当前 assistant turn、不得把“执行结果”作为最终答复
   发给用户。立即恢复本协议，将派发状态写为 `RESULT_RETURNED`，记录返回角色、状态、
   修改文件、执行命令、验证结果、风险和控制权标记。
6. 校验返回角色必须等于解析角色，返回文件必须位于允许范围，且工作区业务改动
   必须能由返回文件清单解释，控制权标记必须为 `RETURN_TO_SW_RUN_N3`。
   通过后写为 `RESULT_VALIDATED` 并立即进入 N4。
7. Skill 不可调用、调用异常、无结构化返回、角色不匹配或改动越界时写为
   `[BLOCKED]`，派发状态写为 `FAILED`；scaffold 任务同时将前端骨架写为
   `BLOCKED`。不得由 `/sw-run` 接管实现，不得改写为 `generic`。
8. 上下文压缩或恢复后，如果派发状态不是 `RESULT_VALIDATED`，必须从本节点重新开始；
   不得仅凭已经识别过角色就跳到 N4。
9. 当前范围为 `ALL_MODULE_TASKS` 或 `ALL_PROJECT_TASKS` 时，Engineer 的结构化结果、
   N3 或 N4 的完成都禁止作为当前 `/sw-run` 的最终输出。

输出：派发凭证、Engineer 执行结果或明确阻塞原因。
