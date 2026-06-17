---
description: 根据 PRD 和设计文档生成技术架构、API 契约和数据模型。
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
- `docs/sweetwave/01-prd/PRD.md`
- `docs/sweetwave/02-design/USER_FLOW.md`
- `docs/sweetwave/02-design/PAGE_MAP.md`
- `docs/sweetwave/02-design/INTERACTION.md`

## 输出文件

创建或更新：

```txt
docs/sweetwave/03-architecture/ARCHITECTURE.md
docs/sweetwave/03-architecture/API_CONTRACT.md
docs/sweetwave/03-architecture/DATA_MODEL.md
```

## 工作流程

1. 分析当前项目技术栈和已有架构。
2. 定义系统概览和模块边界。
3. 定义前端架构和后端架构。
4. 定义 API 契约。
5. 定义数据模型。
6. 定义状态管理方式。
7. 定义错误处理、认证权限、性能、安全、部署和可观测性关注点。
8. 明确区分：已决策、技术取舍、假设和待确认问题。

## 规则

- 不要实现代码。
- 不要无理由引入新依赖。
- 尊重当前项目已有约定。
- 如果是 monorepo 项目，必须明确 app/package 的依赖边界。
- 输出语言使用中文。
