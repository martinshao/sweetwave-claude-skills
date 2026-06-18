# SweetWave Run State

记录当前唯一的任务执行现场，用于跨会话恢复。没有正在执行的任务时保持 `IDLE`。

## 检查点

- 状态：IDLE
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

## 写入规则

- 状态只允许：`IDLE`、`RUNNING`、`PAUSED`、`BLOCKED`、`COMPLETED`。
- 阶段只允许：`PLANNING`、`IMPLEMENTING`、`VERIFYING`、`REVIEWING`、`FINALIZING`。
- 每次进入新阶段、暂停、阻塞或完成时立即更新。
- 新任务开始前覆盖旧的 `COMPLETED` 现场；不要同时记录多个活动任务。
- `TASKS.md` 使用任务定义指纹：比较时忽略 `[ ]`、`[IN_PROGRESS]`、
  `[VERIFYING]`、`[REVIEWING]`、`[BLOCKED]`、`[x]` 等生命周期标记。
