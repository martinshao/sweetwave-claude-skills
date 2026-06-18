# SweetWave 任务清单

## TASK-001：<任务标题>

- [ ] TASK-001
预估：30min
任务类型：feature
执行角色：frontend-engineer
涉及项目：
风险等级：medium
QA 策略：auto
并行策略：candidate
依赖：无
涉及范围：

### 目标

### 输入文档

- .wave/specs/{module}/MODULE.md
- .wave/specs/{module}/UI.md
- .wave/specs/{module}/SPEC.md
- .wave/specs/{module}/ARCH.md

### 允许修改范围

### 禁止修改范围

### 实现说明

### 验收标准

- [ ] [AC-001] 

### 验证命令

```bash
# 根据项目实际情况填写
```

### 风险点

---

## TASK-002：<任务标题>

- [ ] TASK-002
预估：30min
任务类型：feature
执行角色：backend-engineer
涉及项目：
风险等级：medium
QA 策略：auto
并行策略：serial
依赖：TASK-001
涉及范围：

### 目标

### 输入文档

- .wave/specs/{module}/MODULE.md
- .wave/specs/{module}/UI.md
- .wave/specs/{module}/SPEC.md
- .wave/specs/{module}/ARCH.md

### 允许修改范围

### 禁止修改范围

### 实现说明

### 验收标准

- [ ] [AC-002] 

### 验证命令

```bash
```

### 风险点

---

## 状态标记说明

- `[ ]`：待执行
- `[IN_PROGRESS]`：正在实现
- `[VERIFYING]`：实现完成，正在验证
- `[REVIEWING]`：验证通过，正在审查
- `[BLOCKED]`：存在阻塞，读取 `RUN_STATE.md` 获取原因
- `[x]`：已完成
- `[NEW]`：需求变更新增
- `[CHANGED]`：需求变更影响，按更新后描述执行
- `[DROPPED]`：需求变更废弃，跳过

`TASKS.md` 只记录任务生命周期；当前执行步骤、修改文件、验证结果和恢复命令写入
`.wave/RUN_STATE.md`。

## 任务元数据说明

- `执行角色`：`frontend-engineer`、`backend-engineer`、`database-engineer`、
  `security-engineer`、`qa-engineer`、`generic`
- `任务类型`：`scaffold`、`feature`；旧任务缺少时按 `feature` 处理
- `风险等级`：`low`、`medium`、`high`、`critical`
- `QA 策略`：`auto`、`required`、`skip`
- `并行策略`：`serial`、`candidate`
- `app-shell/APP-SHELL-001` 是唯一 scaffold 任务；具体前端页面任务依赖它。
- 旧任务缺少字段时由 `/sw-run` 临时推断，不要求改写历史内容。

## app-shell 任务约定

`app-shell/TASKS.md` 只生成：

```txt
APP-SHELL-001
任务类型：scaffold
执行角色：frontend-engineer
风险等级：medium
QA 策略：required
并行策略：serial
```
