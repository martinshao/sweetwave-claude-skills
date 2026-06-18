# SweetWave Run State

记录当前唯一的任务执行现场，用于跨会话恢复。没有正在执行的任务时保持 `IDLE`。

## 检查点

- 状态：IDLE
- 当前节点：
- 模块：
- 任务：
- 阶段：
- 基准提交：
- 恢复命令：
- 更新时间：

## 物料基线

| 文件 | 指纹 |
|---|---|
| MODULE.md |  |
| DESIGN.md |  |
| UI.md |  |
| ARCH.md |  |
| SPEC.md |  |
| TASKS.md 任务定义 |  |

## 执行现场

### 调度计划

- 串行组：
- 并行候选：
- 冲突原因：

### Engineer 执行结果

- 任务类型：
- 角色：
- 状态：
- 结果摘要：

### 已完成步骤

- 

### 已修改文件

- 

### 已执行验证

| 命令 | 结果 | 说明 |
|---|---|---|
|  |  |  |

### 阻塞与待确认

- 

## QA 累积

- 距离上次完整 QA 的完成任务数：0
- 最近 QA：
- 本任务 QA 原因：
- 本任务安全门原因：

## 上下文恢复摘要

- 当前模块：
- 刚完成任务：
- 下一任务：
- 必读规格：
- 相关 LESSONS：
- Git 基线：
- 未解决风险：
- 推荐恢复命令：

## 写入规则

- 状态只允许：`IDLE`、`RUNNING`、`PAUSED`、`BLOCKED`、`COMPLETED`。
- 阶段只允许：`PLANNING`、`IMPLEMENTING`、`VERIFYING`、`REVIEWING`、
  `QA_EVALUATING`、`FINALIZING`。
- 当前节点只允许：`N1_RESTORE` 至 `N10_FINISH`。
- 每次进入新阶段、暂停、阻塞或完成时立即更新。
- 新任务开始前覆盖旧的 `COMPLETED` 现场；不要同时记录多个活动任务。
- `TASKS.md` 使用任务定义指纹：比较时忽略 `[ ]`、`[IN_PROGRESS]`、
  `[VERIFYING]`、`[REVIEWING]`、`[BLOCKED]`、`[x]` 等生命周期标记。
