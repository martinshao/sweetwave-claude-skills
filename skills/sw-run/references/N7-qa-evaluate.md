# N7: QA Evaluate

将当前节点写为 `N7_QA_EVALUATE`，先判断安全门，再判断完整 QA。

## 强制安全门

- 风险等级 `critical`
- 认证、授权、支付、敏感信息或数据删除
- 用户输入进入数据库、HTML、命令或外部请求
- 新增第三方依赖
- Review 发现安全疑点

触发时调用 `/sw-security-engineer`，报告写入：

```txt
.wave/security/{module}/{TASK-ID}-SECURITY.md
```

## QA 评分

变更范围、业务风险、累积任务、契约影响、用户流程影响各评 1–5 分，总分 `>= 10`
触发 `/sw-qa-engineer`。

以下情况无条件触发：

- 模块最后一个未完成任务
- API、Schema 或 Migration 变化
- 登录、权限、支付或数据删除
- 关键用户流程变化
- 连续 5 个任务未做完整 QA
- 准备发布

报告写入：

```txt
.wave/qa/{module}/{TASK-ID}-QA.md
.wave/qa/{module}/MODULE-QA.md
.wave/qa/RELEASE-QA.md
```

`QA 策略：required` 强制触发；`skip` 只允许低风险且无强制条件时跳过。
`APP-SHELL-001` 固定使用 `required`，QA 必须检查导航可达性、路由完整性、
响应式壳层、404/错误边界和存量功能保留情况。
任何必需门禁失败都写为 `[BLOCKED]`，不得进入 N8。
