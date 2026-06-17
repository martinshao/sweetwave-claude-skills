---
name: sw-map
description: 根据 PRD 拆分 SweetWave 模块，生成 MODULE_MAP.md 和模块规格目录。
argument-hint: >-
  可选：PRD 文件名或路径，例如 INIT-PRD、INIT-PRD.md、.wave/prd/INIT-PRD.md
disable-model-invocation: true
allowed-tools:
  - Read
  - Write
  - Edit
  - MultiEdit
  - Glob
  - Grep
  - Bash(git status)
  - Bash(git diff *)
  - Bash(ls *)
  - Bash(find *)
  - Bash(mkdir -p *)
  - Bash(test *)
---

# SweetWave 模块地图

用户输入：

```txt
$ARGUMENTS
```

## 定位

`/sw-map` 在 `/sw-prd` 之后运行，用于把 PRD 拆成模块边界和模块依赖。它只生成模块规划和目录，不写业务代码。

## 输入

读取：

- `CLAUDE.md`
- `.wave/LESSONS.md`，如果存在
- `.wave/prd/{SCOPE}-PRD.md`

PRD 选择规则：

- 如果用户传入 PRD 文件名或路径，优先使用该 PRD。
- 用户可传入 `INIT-PRD`、`INIT-PRD.md` 或 `.wave/prd/INIT-PRD.md`。
- 如果无参数，选择 `.wave/prd/` 下最近修改的 `*-PRD.md`。
- 如果找不到 PRD，提示先运行 `/sw-prd`。

## 输出文件

创建或更新：

```txt
.wave/MODULE_MAP.md
.wave/specs/{module-id}/MODULE.md
```

每个模块目录预留以下文件，但本节点只必须创建 `MODULE.md`：

```txt
.wave/specs/{module-id}/
  MODULE.md
  DESIGN.md
  ARCH.md
  SPEC.md
  TASKS.md
  TEST_REPORT.md
```

## 工作流程

1. 定位 PRD，并记录来源 PRD 路径。
2. 从 PRD 中提取业务域、核心功能、用户场景、验收标准和跨模块约束。
3. 将 PRD 拆成小而稳定的业务模块：
   - 模块 ID 使用 kebab-case，例如 `product-list`、`product-detail`、`order`、`user-profile`。
   - 模块边界按业务域和交付边界划分，不按技术层强拆。
   - 每个模块应能独立生成设计、架构、规格和任务。
4. 生成 `.wave/MODULE_MAP.md`：
   - 来源 PRD
   - 模块列表
   - 模块依赖
   - 跨模块约束
   - 待确认问题
5. 为每个模块创建 `.wave/specs/{module-id}/MODULE.md`：
   - 来源 PRD
   - 关联功能需求
   - 关联验收标准
   - 模块目标
   - 模块边界
   - 上游依赖
   - 下游影响
   - 待生成文档
6. 如果模块边界存在高风险歧义，列入待确认问题；不要强行生成不可靠的模块边界。
7. 输出模块列表和建议下一步命令。

## MODULE_MAP.md 结构

```md
# SweetWave Module Map

## 来源 PRD

- `.wave/prd/INIT-PRD.md`

## 模块列表

| 模块 ID | 模块名 | 业务域 | 优先级 | 状态 |
|---|---|---|---|---|
| product-detail | 商品详情 | 商品 | P0 | planned |

## 模块依赖

| 上游模块 | 下游模块 | 依赖说明 |
|---|---|---|

## 跨模块约束

## 待确认问题
```

## MODULE.md 结构

```md
# <module-id> 模块

## 来源 PRD

## 关联需求

## 关联验收标准

## 模块目标

## 模块边界

## 上游依赖

## 下游影响

## 待生成文档

- DESIGN.md
- ARCH.md
- SPEC.md
- TASKS.md
- TEST_REPORT.md
```

## 规则

- 不要实现代码。
- 不要生成设计、架构、开发规格或任务内容；这些交给后续节点。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 模块目录只写入 `.wave/specs/{module-id}/`。
- 输出语言使用中文。
