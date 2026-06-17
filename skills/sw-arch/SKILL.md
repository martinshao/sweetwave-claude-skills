---
name: sw-arch
description: 根据 PRD 和设计文档生成技术架构、API 契约和数据模型。
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
  - Bash(cat package.json)
---

# SweetWave 技术架构

用户输入：

```txt
$ARGUMENTS
```

## 输入

如存在则读取：

- `CLAUDE.md`
- `package.json` / workspace 配置
- `.wave/MODULE_MAP.md`
- `.wave/specs/{module}/MODULE.md`
- `.wave/specs/{module}/DESIGN.md`
- MODULE.md 中记录的来源 PRD，例如 `.wave/prd/INIT-PRD.md`

模块选择规则：

- 如果用户传入 `{module}`，只处理 `.wave/specs/{module}/`。
- 如果无参数，遍历 `.wave/MODULE_MAP.md` 中状态为 `planned` 或 `active` 的所有模块。
- 如果模块缺少 `DESIGN.md`，提示先运行 `/sw-design {module}`。

## 输出文件

创建或更新：

```txt
.wave/specs/{module}/ARCH.md
```

## 工作流程

1. 分析当前项目技术栈、已有架构和该模块边界。
2. 定义模块架构、模块内边界和跨模块依赖。
3. 定义该模块涉及的前端、后端、数据、外部服务或其他技术层。
4. 定义模块 API 契约。
5. 定义模块数据模型。
6. 定义模块状态管理方式。
7. 定义模块错误处理、认证权限、性能、安全、部署和可观测性关注点。
8. 明确区分：已决策、技术取舍、假设和待确认问题。
9. 写入 `.wave/specs/{module}/ARCH.md`。

## 规则

- 不要实现代码。
- 不要无理由引入新依赖。
- 尊重当前项目已有约定。
- 如果是 monorepo 项目，必须明确 app/package 的依赖边界。
- 只写目标模块架构；跨模块内容写依赖和契约。
- 只使用 `.wave/*` 作为 SweetWave 工作区。
- 输出语言使用中文。
