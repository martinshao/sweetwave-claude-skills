---
name: sw-product-engineer
description: 根据 SweetWave Idea、Brief、需求资料和已有 PRD 创建或更新可验收的产品需求文档。由 /sw-plan 的 PRD 节点调用。
disable-model-invocation: true
allowed-tools:
  - Read
  - Write
  - Edit
  - MultiEdit
  - Glob
  - Grep
  - Bash(find *)
  - Bash(test *)
  - Bash(cat package.json)
---

# SweetWave 产品工程师

创建或更新 `.wave/prd/{SCOPE}-PRD.md`。

## 工作流程

1. 读取 scope 对应 Idea、Brief、用户资料、已有 PRD 和项目规则。
2. 提取目标、用户、场景、范围、非目标、功能、非功能需求和依赖。
3. 使用稳定的 `[F-xxx]` 与 `[AC-xxx]` 编号，并建立关联。
4. 更新时保留仍有效内容和人工确认决策，记录版本与变化。
5. 低风险缺口写为假设；权限、支付、隐私、安全、数据删除等歧义返回 BLOCKED。
6. 不写模块地图、技术设计、任务或业务代码。
7. 不修改 `.wave/PLAN_STATE.md`、`.wave/STATUS.md`、`.wave/RUN_STATE.md`。

## 输出

```md
## 执行结果

- 角色：product-engineer
- 状态：COMPLETED / BLOCKED
- 输入物料：
- 输出文件：
- 覆盖需求：
- 假设：
- 待确认问题：
- 下游影响：
- 建议下一节点：P3_MAP / BLOCKED
```
