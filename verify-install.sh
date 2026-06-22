#!/usr/bin/env bash
set -euo pipefail

missing=0
for name in sw-help sw-status sw-init sw-brief sw-plan sw-prd sw-map sw-design sw-ui sw-arch sw-spec sw-task sw-scaffold sw-product-engineer sw-domain-engineer sw-ux-engineer sw-ui-design-engineer sw-architecture-engineer sw-spec-engineer sw-task-engineer sw-work sw-verify sw-review sw-run sw-frontend-engineer sw-backend-engineer sw-database-engineer sw-security-engineer sw-qa-engineer sw-doc-sync sw-release sw-retro; do
  file="$HOME/.claude/skills/$name/SKILL.md"
  if [ -f "$file" ]; then
    echo "OK：/$name -> $file"
  else
    echo "缺失：/$name -> $file"
    missing=1
  fi
done

run_skill="$HOME/.claude/skills/sw-run/SKILL.md"
if [ -f "$run_skill" ] && ! grep -q '^  - Skill$' "$run_skill"; then
  echo "错误：/sw-run 缺少 Skill 调用权限，无法派发 Engineer Skills。" >&2
  missing=1
fi

for name in sw-frontend-engineer sw-backend-engineer sw-database-engineer sw-security-engineer sw-qa-engineer sw-doc-sync; do
  file="$HOME/.claude/skills/$name/SKILL.md"
  if [ -f "$file" ] && ! grep -q '^disable-model-invocation: false$' "$file"; then
    echo "错误：/$name 未允许由 /sw-run 调用。" >&2
    missing=1
  fi
done

for name in sw-frontend-engineer sw-backend-engineer sw-database-engineer; do
  file="$HOME/.claude/skills/$name/SKILL.md"
  if [ -f "$file" ] && ! grep -q 'RETURN_TO_SW_RUN_N3' "$file"; then
    echo "错误：/$name 缺少返回 /sw-run 的控制权协议。" >&2
    missing=1
  fi
done

if [ "$missing" -ne 0 ]; then
  echo "部分 SweetWave skills 缺失。" >&2
  exit 1
fi

echo "全部 SweetWave skills 已安装。"
