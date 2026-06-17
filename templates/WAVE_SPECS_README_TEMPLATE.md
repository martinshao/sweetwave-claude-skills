# Module Specs

模块级规格目录。每个模块使用一个子目录承载设计、界面与原型、架构、开发规格、任务和验证报告。

## 目录约定

```txt
.wave/specs/{module-id}/
  MODULE.md
  DESIGN.md
  UI.md
  prototype/
  ARCH.md
  SPEC.md
  TASKS.md
  TEST_REPORT.md
```

## 命名约定

- 模块 ID 使用 kebab-case，例如 `product-detail`、`checkout`、`user-profile`。
- 模块目录由后续模块拆分节点生成。
