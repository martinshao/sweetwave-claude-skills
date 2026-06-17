---
name: sw-ui
description: 根据模块 PRD 和产品设计生成 SweetWave 界面与原型设计，产出 UI.md，可选生成静态原型说明。
argument-hint: >-
  可选：module-id；无参数时处理 MODULE_MAP 中所有 planned/active 模块
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

# SweetWave 界面与原型设计

用户输入：

```txt
$ARGUMENTS
```

## 定位

`/sw-ui` 在 `/sw-design` 之后、`/sw-arch` 之前运行。它把产品流程和交互说明转成工程可消费的界面设计、组件结构、布局规则和原型说明。

本节点默认使用 Claude 内部能力生成文档化原型，不依赖 Figma、Stitch 或其他外部 MCP。外部设计稿链接可作为补充写入 `UI.md`，但不是主路径。

## 输入

读取：

- `.wave/MODULE_MAP.md`
- `.wave/specs/{module}/MODULE.md`
- `.wave/specs/{module}/DESIGN.md`
- MODULE.md 中记录的来源 PRD，例如 `.wave/prd/INIT-PRD.md`
- 如有必要，读取 `.wave/brief/*.md`

模块选择规则：

- 如果用户传入 `{module}`，只处理 `.wave/specs/{module}/`。
- 如果无参数，遍历 `.wave/MODULE_MAP.md` 中状态为 `planned` 或 `active` 的所有模块。
- 如果模块不存在，提示先运行 `/sw-map`。
- 如果模块缺少 `DESIGN.md`，提示先运行 `/sw-design {module}`。

## 输出文件

创建或更新：

```txt
.wave/specs/{module}/UI.md
```

可选创建：

```txt
.wave/specs/{module}/prototype/README.md
```

只有当用户明确要求“生成 HTML 原型”或当前任务非常适合静态原型时，才创建具体原型文件，例如：

```txt
.wave/specs/{module}/prototype/index.html
```

## 工作流程

1. 从 `MODULE.md`、`DESIGN.md` 和来源 PRD 中提取页面、用户路径、核心状态和验收标准。
2. 生成模块级界面设计：
   - 页面清单
   - 页面布局
   - 信息架构
   - 视觉层级
   - 核心组件
   - 组件状态
   - 表单与校验
   - 响应式规则
   - 可访问性要求
3. 生成低保真或中保真原型说明：
   - 页面线框
   - 页面跳转
   - 操作反馈
   - 空态、加载态、错误态、成功态
4. 标注设计系统假设：
   - 复用现有组件或 UI 框架
   - 颜色、间距、字体、密度和图标规则
   - 不确定时写假设，不要发明品牌规范。
5. 标注跨模块 UI 依赖、外部设计稿链接、待确认问题。
6. 写入 `.wave/specs/{module}/UI.md`。

## UI.md 结构

```md
# <module-id> 界面与原型设计

## 来源

## 设计目标

## 页面清单

## 用户路径

## 信息架构

## 页面布局

## 组件清单

## 组件状态

## 表单与校验

## 响应式规则

## 可访问性要求

## 原型说明

## 外部设计稿链接

## 跨模块 UI 依赖

## 待确认问题
```

## 规则

- 不要实现业务代码。
- 默认只生成文档化 UI 设计和原型说明。
- 不要调用外部 MCP；如果用户提供 Figma/Stitch 链接，只作为引用写入 `UI.md`。
- 不要编造品牌规范、真实图片或设计系统名称；没有项目依据时标为假设。
- 不要把技术架构、API 契约或任务拆解写进 `UI.md`。
- 只写目标模块界面与原型内容；跨模块内容写为依赖或链接。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
