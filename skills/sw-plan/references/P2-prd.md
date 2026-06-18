# P2: PRD

1. 读取 scope 对应的 Idea、Brief、已有 PRD、用户输入和项目规则。
2. 将 `PLAN_STATE.md` 写为 `RUNNING / P2_PRD`，PRD 状态写为 `DRAFT`。
3. 调用 `/sw-product-engineer` 创建或更新 `.wave/prd/{SCOPE}-PRD.md`。
4. 变更模式保留仍有效需求，稳定编号 F-xxx 和 AC-xxx。
5. 高风险歧义返回 `BLOCKED`，保存问题与恢复命令。
6. 校验 Role 输出后将 PRD 写为 `REVIEWING`，通过本节点基础检查后写为 `READY`。
7. 记录 PRD 指纹、输入来源和下游影响。

`--stage prd` 完成后停止；下一步建议 `/sw-plan {scope} --from map`。
